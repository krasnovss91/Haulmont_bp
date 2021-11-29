/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.app.EntityLog

/**
 *
 * @author mishunin
 * @version $Id$
 */

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class)
    EntityLog entityLog = AppBeans.get(EntityLog.NAME)
    Boolean entityLogEnable = entityLog.isEnareindexsimpledocbled()
    entityLog.setEnabled(false)
    try {
        Transaction tx = persistence.createTransaction()
        try {
            EntityManager em = persistence.getEntityManager()
            em.createQuery(
                    'update ts$CardAcl a ' +
                            '  set a.cardRole = null, a.code = 4 ' +
                            '   where a.cardRole.code = \'CARD_ACCESS\' ' +
                            '   and a.card is not null ' +
                            '   and a.user is not null')
                    .executeUpdate()
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
