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
                    "dk.docType.id <> :contractTypeId", DocKind.class)
                    .setParameter("contractTypeId", ThesisConstants.DOC_TYPE_CONTRACT_ID)
                    .getResultList()

            for (DocKind docKind : docKinds) {
                List<FieldInfo> fieldInfoList = docKind.getFields()
                for (FieldInfo fieldInfo : fieldInfoList) {
                    if ("contractor".equals(fieldInfo.getName())) {
                        fieldInfo.setVisible(false)
                        fieldInfo.setRequired(false)
                        fieldInfo.setSigned(false)
                        break
                    }
                }
                docKind.updateFieldsXml()
            }

            em.setSoftDeletion(true)
        }
    })
})