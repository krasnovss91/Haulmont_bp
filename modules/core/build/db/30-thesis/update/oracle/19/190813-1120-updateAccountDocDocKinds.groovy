/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.google.common.collect.Lists
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.LegalDocConstants
import com.haulmont.thesis.core.app.ThesisConstants
import com.haulmont.thesis.core.entity.DocKind
import com.haulmont.thesis.core.entity.FieldInfo

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {
            em.setSoftDeletion(false)
            List<DocKind> docKinds = em.createQuery("select dk from df\$DocKind dk where " +
                    "dk.docType.id = :accountDocTypeId", DocKind.class)
                    .setParameter("accountDocTypeId", ThesisConstants.DOC_TYPE_ACCOUNT_DOC_ID)
                    .getResultList()

            List<String> requiredFields = Lists.newArrayList("amount")
            List<String> fieldsToHide = Lists.newArrayList("vatInclusive", "vatRate", "resolution", "finishDatePlan")

            List<UUID> formalizedKinds = Lists.newArrayList(
                    LegalDocConstants.ACCOUNT_DOC_INVOICE_DOC_KIND_ID, LegalDocConstants.ACCOUNT_DOC_UTD_DOC_KIND_ID)
            List<String> fieldsToHideInFormalizedKinds = Lists.newArrayList("owner", "docCategory")

            for (DocKind docKind : docKinds) {
                boolean isFormalized = formalizedKinds.contains(docKind.getId())
                List<FieldInfo> fieldInfoList = docKind.getFields()
                for (FieldInfo fieldInfo : fieldInfoList) {
                    String fieldName = fieldInfo.getName()

                    if (fieldsToHide.contains(fieldName)) {
                        fieldInfo.setVisible(false)
                        fieldInfo.setRequired(false)
                        fieldInfo.setSigned(false)
                    }

                    if (isFormalized && fieldsToHideInFormalizedKinds.contains(fieldName)) {
                        fieldInfo.setVisible(false)
                        fieldInfo.setRequired(false)
                        fieldInfo.setSigned(false)
                    }

                    if (requiredFields.contains(fieldName)) {
                        fieldInfo.setRequired(true)
                    }
                }

                docKind.updateFieldsXml()
            }

            em.setSoftDeletion(true)
        }
    })
})