/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

/**
 *
 * @author Sergey Saiyan
 * @version $Id$
 */
postUpdate.add({
    Log log = LogFactory.getLog(DbUpdater.class);
    Persistence persistence = AppBeans.get(Persistence.NAME);

    persistence.createTransaction().execute(new Transaction.Callable() {
        @Override
        Object call(EntityManager em) {
            def list = em.createNativeQuery("select c.relname from pg_class c where c.relkind = 'S'").getResultList();
            list.each {
                em.createNativeQuery("alter sequence \"" + it + "\" minvalue 0").executeUpdate();
                log.info("Updated sequence '" + it + "' to minvalue = 0")
            }
        }
    })
})