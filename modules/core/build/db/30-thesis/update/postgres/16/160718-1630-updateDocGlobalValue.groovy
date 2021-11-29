/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.thesis.core.entity.CardAcl
import com.haulmont.thesis.core.entity.Doc

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class)
    Transaction tx = persistence.createTransaction()
    EntityManager em = persistence.getEntityManager()
    Metadata metadata = AppBeans.get(Metadata.NAME)
    try {
        List<Doc> docs = em.createQuery("select d from df\$Doc d where d.global = false and d.availableForAll = true " +
                "and d.versionOf is null and d.template = false").getResultList()
        for (Doc doc : docs) {
            doc.setGlobal(true);

            CardAcl cardAcl = metadata.create(CardAcl.class);
            cardAcl.setCard(doc);
            cardAcl.setGlobal(true);
            em.persist(cardAcl);

        }
        tx.commit()
    } finally {
        tx.end()
    }
})