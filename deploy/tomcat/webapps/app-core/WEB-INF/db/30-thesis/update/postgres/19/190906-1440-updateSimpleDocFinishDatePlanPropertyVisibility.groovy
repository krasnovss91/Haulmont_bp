/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.ThesisConstants
import com.haulmont.thesis.core.entity.DocKind
import com.haulmont.thesis.core.entity.FieldInfo

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {
            em.setSoftDeletion(false)
            List<DocKind> docKinds = em.createQuery("select dk from df\$DocKind dk where " +
                    "dk.docType.id = :simpleDocTypeId", DocKind.class)
                    .setParameter("simpleDocTypeId", ThesisConstants.DOC_TYPE_SIMPLE_DOC_ID)
                    .getResultList()

            for (DocKind docKind : docKinds) {
                List<FieldInfo> fieldInfoList = docKind.getFields()
                for (FieldInfo fieldInfo : fieldInfoList) {
                    if ("finishDatePlan".equals(fieldInfo.getName())) {
                        fieldInfo.setVisible(true)
                        docKind.updateFieldsXml()
                        break
                    }
                }
            }

            em.setSoftDeletion(true)
        }
    })
})