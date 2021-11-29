/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Query
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.View
import com.haulmont.cuba.security.app.EntityLog
import com.haulmont.thesis.core.app.CardSecurityAPI
import com.haulmont.thesis.core.entity.CardAcl
import com.haulmont.thesis.core.entity.CardAclCodes

/**
 *
 * @author mishunin
 * @version $Id$
 */

postUpdate.add({
    CardSecurityAPI cardSecurityAPI = AppBeans.get(CardSecurityAPI.NAME)
    Persistence persistence = AppBeans.get(Persistence.class)
    EntityLog entityLog = AppBeans.get(EntityLog.NAME)
    Boolean entityLogEnable = entityLog.isEnabled()
    entityLog.setEnabled(false)
    try {
        Transaction tx = persistence.createTransaction()
        try {
            EntityManager em = persistence.getEntityManager()
            Query query = em.createQuery("select a from ts\$CardAcl a where a.cardRole.code = 'CARD_ACCESS'")
            query.setView(new View(CardAcl.class, "cardacl-edit"))
            List<CardAcl> cardAcls = query.getResultList()
            if (cardAcls.isEmpty())
                return
            for (CardAcl acl : cardAcls) {
                if (acl.card != null && acl.user != null) {
                    acl.cardRole = null;
                    acl.code = CardAclCodes.SECURITY_ACCESS
                    em.persist(acl);
                }
            }
            tx.commit()
        } finally {
            tx.end()
        }

        tx = persistence.createTransaction()
        try {
            EntityManager em = persistence.getEntityManager()
            em.setSoftDeletion(false);
            em.createQuery("delete from ts\$CardAcl a where a.cardRole.code = 'CARD_ACCESS'").executeUpdate()
            tx.commit()
        } finally {
            tx.end()
        }

        tx = persistence.createTransaction()
        try {
            EntityManager em = persistence.getEntityManager()
            em.setSoftDeletion(false);
            em.createQuery("delete from ts\$CardRole c where c.code = 'CARD_ACCESS'").executeUpdate()
            tx.commit()
        } finally {
            tx.end()
        }

        tx = persistence.createTransaction()
        try {
            EntityManager em = persistence.getEntityManager()
            em.setSoftDeletion(false);
            em.createQuery("delete from wf\$ProcRole p where p.code = 'CARD_ACCESS'").executeUpdate()
            tx.commit()
        } finally {
            tx.end()
        }
    } finally {
        entityLog.setEnabled(entityLogEnable);
    }
})
