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
 * @author kozyaikin
 * @version $Id$
 */


postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    EntityLog entityLog = AppBeans.get(EntityLog.NAME);
    Boolean entityLogEnable = entityLog.isEnabled();
    entityLog.setEnabled(false);
    try {
        em.createNativeQuery("update DF_DOC_KIND set numerator_id='215c66b8-ef2e-6608-bd5d-59c3bae94e5e' where category_id='9415792f-c473-cbeb-d150-8ae687c4dcd2'").executeUpdate();
        tx.commit();
    } finally {
        tx.end();
        entityLog.setEnabled(entityLogEnable);
    }
})