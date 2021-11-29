/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.entity.Config
import com.haulmont.cuba.core.global.AppBeans

/**
 *
 * @author mishunin
 * @version $Id$
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction()
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager()
    Config config
    try {
        config = em.createQuery("select c from sys\$Config c where c.name = :name").setParameter("name", "com.haulmont.thesis.core.config.taskTypeDefault").getFirstResult()
        config.setValue(config.value + "-edit")
        tx.commit()
    } finally {
        tx.end()
    }
})