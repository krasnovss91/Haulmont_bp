/*
 * Copyright (c) 2020 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.UuidProvider
import com.haulmont.cuba.core.global.View
import com.haulmont.thesis.core.entity.DocKind
import com.haulmont.thesis.core.entity.CardType
import com.haulmont.thesis.core.entity.FieldInfo

postUpdate.add({
    def persistence = AppBeans.get(Persistence.class)
    def tx = persistence.createTransaction()
    def em = persistence.getEntityManager()
    try {
        List<DocKind> docKinds = em.createQuery("select docKind from df\$DocKind docKind join docKind.docType docType where docType.name='df\$AccountDoc'")
                .setView(new View(DocKind.class).addProperty("fieldsXml").addProperty("docType", new View(CardType.class).addProperty("fieldsXml")))
                .getResultList()
        List<String> newFieldsNames = new ArrayList<String>()
        newFieldsNames.add("originalDoc")
        newFieldsNames.add("originalDocNo")
        newFieldsNames.add("originalDocDate")
        newFieldsNames.add("originalRevisedDoc")
        newFieldsNames.add("originalRevisedDocNo")
        newFieldsNames.add("originalRevisedDocDate")
        newFieldsNames.add("originalCorrectionDoc")
        newFieldsNames.add("originalCorrectionDocNo")
        newFieldsNames.add("originalCorrectionDocDate")
        for (DocKind docKind : docKinds) {
            def isRevised = UuidProvider.fromString("4352c89e-7efc-11ea-b4a9-d72a87bb998a").equals(docKind.getId()) ||
                    UuidProvider.fromString("0be2da52-7f0b-11ea-b4ac-af6db42f6aba").equals(docKind.getId())
            def isCorrection = UuidProvider.fromString("0297e7cc-7ef6-11ea-b4a6-ffeee2e4d9da").equals(docKind.getId()) ||
                    UuidProvider.fromString("056c8218-7f0b-11ea-b4ab-1fb7e3bc68a7").equals(docKind.getId())
            def isRevisedCorrection = UuidProvider.fromString("2a1b58a6-821b-11ea-b4b0-93beaa48ca30").equals(docKind.getId()) ||
                    UuidProvider.fromString("339d687e-821b-11ea-b4b1-47b20498f935").equals(docKind.getId())

            def isOriginalDocInfoVisible = isRevised || isCorrection || isRevisedCorrection
            def isOriginalRevisedDocInfoVisible = isCorrection || isRevisedCorrection
            def isOriginalCorrectionDocInfoVisible = isRevisedCorrection

            List<FieldInfo> fields = docKind.getFields()
            for (String name : newFieldsNames) {
                FieldInfo fieldInfo = null
                for (FieldInfo fi : fields) {
                    if (name.equals(fi.getName())) {
                        fieldInfo = fi
                        break
                    }
                }

                def isFieldVisible = (
                        (("originalDoc" == name || "originalDocNo" == name || "originalDocDate" == name) && isOriginalDocInfoVisible) ||
                        (("originalRevisedDoc" == name || "originalRevisedDocNo" == name || "originalRevisedDocDate" == name) && isOriginalRevisedDocInfoVisible) ||
                        (("originalCorrectionDoc" == name || "originalCorrectionDocNo" == name || "originalCorrectionDocDate" == name) && isOriginalCorrectionDocInfoVisible)
                )

                if (fieldInfo == null) {
                    fieldInfo = new FieldInfo()
                    fieldInfo.setName(name)
                    fieldInfo.setVisible(isFieldVisible)
                    fieldInfo.setRequired(false)
                    fields.add(fieldInfo)
                } else {
                    fieldInfo.setVisible(isFieldVisible)
                    fieldInfo.setRequired(false)
                }
            }

            docKind.updateFieldsXml()
            em.merge(docKind)
        }
        tx.commit()
    } finally {
        tx.end()
    }
})
