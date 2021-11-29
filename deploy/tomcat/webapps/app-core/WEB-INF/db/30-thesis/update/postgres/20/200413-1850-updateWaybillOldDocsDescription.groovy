/*
 * Copyright (c) 2020 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.global.AppBeans

postUpdate.add({

    def updateRuSql = "update WF_CARD " +
            "set description = 'Унифицированная накладная (ТОРГ-12)' || SUBSTR(description, LENGTH('Накладная') + 1, LENGTH(description)) " +
            "where id in (select CARD_ID from DF_DOC where DOC_KIND_ID = 'a36454de-7af4-11ea-b49f-8b8e95b826ef') " +
            "and description like 'Накладная № %' or description like 'Накладная от %' or description like 'Накладная [%' or description like 'Накладная  [%' or description like 'Накладная'"

    def updateEnSql = "update WF_CARD " +
            "set description = 'Unified Waybill (TORG-12)' || SUBSTR(description, LENGTH('Waybill') + 1, LENGTH(description)) " +
            "where id in (select CARD_ID from DF_DOC where DOC_KIND_ID = 'a36454de-7af4-11ea-b49f-8b8e95b826ef') " +
            "and description like 'Waybill # %' or description like 'Waybill at %' or description like 'Waybill [%' or description like 'Waybill  [%' or description like 'Waybill'"

    def persistence = AppBeans.get(Persistence.class)

    def tx = persistence.createTransaction()
    try {
        def em = persistence.getEntityManager()
        em.createNativeQuery(updateRuSql).executeUpdate()
        em.createNativeQuery(updateEnSql).executeUpdate()
        tx.commit()
    } finally {
        tx.end()
    }


})


