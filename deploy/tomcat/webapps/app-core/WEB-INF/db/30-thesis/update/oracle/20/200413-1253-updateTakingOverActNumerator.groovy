/*
 * Copyright (c) 2020 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.persistence.DbmsSpecificFactory

postUpdate.add({

    def un = AppBeans.get("cuba_UniqueNumbers")

    def sequenceSupport = DbmsSpecificFactory.getSequenceSupport()

    def seqName = "seq_un_accountdocact"
    def domainName = "accountdocact"
    def domainNameForUpdate = "accountdoctakingoveract"
    def seqExists = false

    def persistence = AppBeans.get(Persistence.class)

    def tx = persistence.createTransaction()
    try {
        def em = persistence.getEntityManager()
        def query = em.createNativeQuery(sequenceSupport.sequenceExistsSql(seqName))
        List list = query.getResultList()
        seqExists = !list.isEmpty()
        tx.commit()
    } finally {
        tx.end()
    }

    if (seqExists) {
        def cur = un.getCurrentNumber(domainName)
        if (cur != null && cur > 0) {
            un.setCurrentNumber(domainNameForUpdate, cur + 1)
        }
    }

})