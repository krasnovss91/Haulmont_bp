/*
 * Copyright (c) 2020 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.global.AppBeans

postUpdate.add({

    def updateRuSql = "update WF_CARD " +
            "set description = 'Акт приёмки-сдачи работ и услуг' || SUBSTR(description, LENGTH('Акт') + 1, LENGTH(description)) " +
            "where id in (select CARD_ID from DF_DOC where DOC_KIND_ID = '393c9da47d6111eab4a2b3c8deee0df1') " +
            "and description like 'Акт № %' or description like 'Акт от %' or description like 'Акт [%' or description like 'Акт  [%' or description like 'Акт'"

    def updateEnSql = "update WF_CARD " +
            "set description = 'Taking-Over Act' || SUBSTR(description, LENGTH('Act') + 1, LENGTH(description)) " +
            "where id in (select CARD_ID from DF_DOC where DOC_KIND_ID = '393c9da47d6111eab4a2b3c8deee0df1') " +
            "and description like 'Act # %' or description like 'Act at %' or description like 'Act [%' or description like 'Act  [%' or description like 'Act'"

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


