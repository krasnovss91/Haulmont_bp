/*
 * Copyright (c) 2020 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.View
import com.haulmont.workflow.core.app.WfService
import com.haulmont.thesis.core.entity.TsCard
import com.haulmont.thesis.core.entity.EdmSending
import com.haulmont.workflow.core.entity.CardAttachment
import com.haulmont.thesis.core.enums.EdmDocumentFormat
import com.haulmont.thesis.core.entity.PackageDoc
import com.haulmont.cuba.core.global.TimeSource
import org.apache.commons.lang.time.DateUtils

postUpdate.add({
    def timeSource = AppBeans.get(TimeSource.NAME)
    def persistence = AppBeans.get(Persistence.class)
    def tx = persistence.createTransaction()
    def em = persistence.getEntityManager()

    Date startDate = null

    try {
        startDate = em.createQuery("select min(es.createTs) from ts\$EdmSending es").getFirstResult()
        tx.commit()
    } finally {
        tx.end()
    }

    if (startDate == null) {
        startDate = timeSource.currentTimestamp()
    }

    startDate = DateUtils.addDays(startDate, -1)
    Date endDate = DateUtils.addDays(timeSource.currentTimestamp(), 1)

    Date stepStartDate = startDate

    while (stepStartDate.before(endDate)) {
        Date stepEndDate = DateUtils.addDays(stepStartDate, 15)

        tx = persistence.createTransaction()
        em = persistence.getEntityManager()

        try {

            List<TsCard> cards = em.createQuery("select cr from ts\$Card cr join cr.proc pr join cr.edmSending es where cr.jbpmProcessId is not null and pr.code = 'EdmPackageReceiving' and es.createTs >= :startDate and es.createTs < :endDate")
                    .setView(new View(TsCard.class).addProperty("edmSending", new View(EdmSending.class)))
                    .setParameter("startDate", stepStartDate)
                    .setParameter("endDate", stepEndDate)
                    .getResultList()

            for (TsCard card : cards) {
                if (card instanceof PackageDoc) {
                    EdmSending edmSending = card.getEdmSending()
                    if (edmSending != null) {

                        Map<String, Object> processVariables = AppBeans.get(WfService.class).getProcessVariables(card)
                        Map<UUID, UUID> incomingEdmAttachmentIds = (Map<UUID, UUID>) processVariables.get("incomingEdmAttachmentIds");
                        Map<UUID, EdmDocumentFormat> formats = (Map<UUID, EdmDocumentFormat>) processVariables.get("edmDocumentFormats")

                        if (incomingEdmAttachmentIds != null || formats != null) {

                            List<EdmSending> childEdmSendings = em.createQuery(
                                    "select d from ts\$EdmSending d where d.parentEdmSending.id = :parentEdmSendingId ", EdmSending.class)
                                    .setParameter("parentEdmSendingId", edmSending.getId())
                                    .setView(new View(EdmSending.class).addProperty("edmDocumentFormat").addProperty("edmAttachment", new View(CardAttachment.class)).addProperty("card", new View(TsCard.class)))
                                    .getResultList()

                            for (EdmSending childEdmSending : childEdmSendings) {

                                CardAttachment attachment = null

                                if (incomingEdmAttachmentIds != null) {
                                    UUID incomingEdmAttachmentId = incomingEdmAttachmentIds.get(childEdmSending.getCard().getId());
                                    if (incomingEdmAttachmentId != null) {
                                        attachment = em.createQuery("select att from wf\$CardAttachment att where att.id = :attId")
                                                .setView(new View(CardAttachment.class))
                                                .setParameter("attId", incomingEdmAttachmentId)
                                                .getFirstResult()
                                    }
                                }

                                if (formats != null) {
                                    EdmDocumentFormat format = formats.get(childEdmSending.getCard().getId());
                                    childEdmSending.setEdmDocumentFormat(format != null ? format : EdmDocumentFormat.NON_FORMALIZED)
                                }
                                childEdmSending.setEdmAttachment(attachment)
                                em.merge(childEdmSending)

                            }

                        }
                    }
                }
            }
            tx.commit()
        } finally {
            tx.end()
        }

        stepStartDate = stepEndDate
    }

})
