/*
 * Copyright (c) 2020 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.global.AppBeans

postUpdate.add({

    def updateRuSql = "update WF_CARD " +
            "set description = 'Товарная накладная' + SUBSTRING(description, LEN('Накладная') + 1, LEN(description)) " +
            "where id in (select CARD_ID from DF_DOC where DOC_KIND_ID = '512e83a3-d8c9-45f6-b0de-d1949a55bced') " +
            "and description like 'Накладная № %' or description like 'Накладная от %' or description like 'Накладная [%' or description like 'Накладная  [%' or description like 'Накладная'"

    def persistence = AppBeans.get(Persistence.class)

    def tx = persistence.createTransaction()
    try {
        def em = persistence.getEntityManager()
        em.createNativeQuery(updateRuSql).executeUpdate()
        tx.commit()
    } finally {
        tx.end()
    }


})


