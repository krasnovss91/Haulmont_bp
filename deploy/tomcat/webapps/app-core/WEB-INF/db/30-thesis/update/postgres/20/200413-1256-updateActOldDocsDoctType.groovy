/*
 * Copyright (c) 2020 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.thesis.core.entity.DocKind
import com.haulmont.cuba.core.global.UuidProvider
import com.haulmont.thesis.core.entity.CardType
import com.haulmont.thesis.core.entity.NumeratorType
import com.haulmont.thesis.core.enums.CategoryAttrsPlace
import com.haulmont.thesis.core.entity.Numerator
import com.haulmont.cuba.core.global.Messages
import com.haulmont.thesis.core.app.LocaleProvider
import com.haulmont.thesis.core.legaldocintegration.LegalDocInitializerImpl
import com.haulmont.thesis.core.entity.multi_language.MultiLanguageString

def getDespiteSoftDeleted = { EntityManager em, Class entityClass, UUID id ->
    em.setSoftDeletion(false)
    def entity = em.find(entityClass, id)
    em.setSoftDeletion(true)
    return (entity)
}

def createAccountDocDocKindNumerator = { EntityManager em, UUID numeratorId, String numeratorSequenceName ->
    def numerator = getDespiteSoftDeleted(em, Numerator.class, numeratorId)
    if (numerator != null)
        return numerator
    def metadata = AppBeans.get(Metadata.NAME)
    def messages = AppBeans.get(Messages.NAME)
    numerator = metadata.create(Numerator.class)
    numerator.setId(numeratorId)
    String msgKey = "AccountDoc.numerator." + numeratorId.toString()
    String ru = messages.getMessage(LegalDocInitializerImpl.class, msgKey, LocaleProvider.get("ru"))
    String en = messages.getMessage(LegalDocInitializerImpl.class, msgKey, LocaleProvider.get("en"))

    numerator.setCode(ru)
    numerator.setLocName(MultiLanguageString.createFromParameters(
            ru, "ru",
            en, "en")
    )
    numerator.setScript("def un = com.haulmont.cuba.core.global.AppBeans.get(\"cuba_UniqueNumbers\")\n" +
            "    String numPrefix = \"\"\n" +
            "    if(binding.variables.containsKey(\"docOfficeData\")) {\n" +
            "    com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()\n" +
            "    if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != \"\") {\n" +
            "       numPrefix = officeFile.getNomenclature().getIndex() + \"-\"\n" +
            "    }\n" +
            "    }\n" +
            "    return numPrefix +String.valueOf( un.getNextNumber(\"" + numeratorSequenceName + "\")).padLeft(5, \"0\")")
    numerator.setScriptEnabled(true)
    em.persist(numerator)
    return numerator
}


postUpdate.add({


    def updateSql = "update DF_DOC d " +
            "set DOC_KIND_ID = '393c9da4-7d61-11ea-b4a2-b3c8deee0df1' " +
            "where d.DOC_KIND_ID = 'f147625a-4ea8-4507-956f-f07ed302a5f1' and d.is_template = false " +
            "and exists(select * from WF_CARD cc where cc.ID = d.CARD_ID and cc.HAS_ATTACHMENTS = true) " +
            "and exists(select * from WF_ATTACHMENT aa join WF_ATTACHMENTTYPE att on att.id = aa.type_id " +
            "where aa.CARD_ID = d.CARD_ID and (att.CODE = 'AttachmentType.outgoingFD' or att.CODE = 'AttachmentType.incomingFD'))"

    def persistence = AppBeans.get(Persistence.class)

    def tx = persistence.createTransaction()
    try {

        def em = persistence.getEntityManager()
        def query = em.createNativeQuery("select ID from SYS_CATEGORY where ID = 'f147625a-4ea8-4507-956f-f07ed302a5f1'")
        List list = query.getResultList()
        def oldDocKindExists = !list.isEmpty()
        if (oldDocKindExists) {
            query = em.createNativeQuery("select ID from SYS_CATEGORY where ID = '393c9da4-7d61-11ea-b4a2-b3c8deee0df1'")
            list = query.getResultList()
            def newDocKindExists = !list.isEmpty()
            if (!newDocKindExists) {
                Metadata metadata = AppBeans.get(Metadata.NAME)
                DocKind outgoingFDDocKind = metadata.create(DocKind.class)

                def docKindId = UuidProvider.fromString("393c9da4-7d61-11ea-b4a2-b3c8deee0df1")
                def name = "Акт приёмки-сдачи работ и услуг"
                def numeratorSequenceName = "accountdoctakingoveract"
                def numeratorId = UuidProvider.fromString("9476e300-7d61-11ea-b4a4-cb9c3b01bd08")

                def docTypeAccountDocId = UuidProvider.fromString("68ec9ec1-984e-47ec-929b-7ffbe09644ae")

                outgoingFDDocKind.setId(docKindId)
                outgoingFDDocKind.setName(name)
                outgoingFDDocKind.setEntityType("df\$AccountDoc")
                outgoingFDDocKind.setIsDefault(false)
                outgoingFDDocKind.setDocType(em.find(CardType.class, docTypeAccountDocId))
                outgoingFDDocKind.setNumeratorType(NumeratorType.ON_COMMIT)
                outgoingFDDocKind.setNumerator(createAccountDocDocKindNumerator(em, numeratorId, numeratorSequenceName))
                outgoingFDDocKind.setCategoryAttrsPlace(CategoryAttrsPlace.MAIN_TAB)
                outgoingFDDocKind.setAdditionalFieldsTabName("Доп. поля")
                outgoingFDDocKind.setDisableAddProcessActors(false)
                outgoingFDDocKind.setCreateOnlyByTemplate(false)
                outgoingFDDocKind.setAvailableToCreateOnMobileClient(false)

                def isFormalized = true

                outgoingFDDocKind.setFieldsXml(
                        "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
                                "\n" +
                                "<fields>\n" +
                                "  <field name=\"addressees\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"amount\" visible=\"true\" required=\"true\" signed=\"false\"/>\n" +
                                "  <field name=\"vatInclusive\" visible=\"false\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"contractor\" visible=\"true\" required=\"true\" signed=\"false\"/>\n" +
                                "  <field name=\"number\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"responseToDoc\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"officeSignedBy\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"officeExecutor\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"sender\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"receivingMethod\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"employeeExecutor\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"owner\" visible=\"" + (isFormalized ? "false" : "true") + "\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"date\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"parentCard\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"vatAmount\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"currency\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"organization\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"vatRate\" visible=\"false\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"docCategory\" visible=\"" + (isFormalized ? "false" : "true") + "\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"resolution\" visible=\"false\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"finishDatePlan\" visible=\"false\" required=\"false\" signed=\"false\"/>\n" +
                                "  <field name=\"comment\" visible=\"true\" required=\"false\" signed=\"false\"/>\n" +
                                "</fields>")

                em.persist(outgoingFDDocKind)
            }
        }
        tx.commit()
    } finally {
        tx.end()
    }

    def tx2 = persistence.createTransaction()
    try {
        def em2 = persistence.getEntityManager()
        em2.createNativeQuery(updateSql).executeUpdate()
        tx2.commit()
    } finally {
        tx2.end()
    }


})


