/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.entity.Entity
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.TaskSchedulerMBean

/**
 * Created by kozyaikin on 17.04.2017.
 */
postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction()
    try {
        List<String> methodNames = new ArrayList<>();
        methodNames.add("notifyOverdueTasksByScheduler");
        methodNames.add("repeatNotifyOverdueTasksByScheduler");
        EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
        List<Entity> result = em.createQuery("select st from sys\$ScheduledTask st where st.beanName = :beanName " +
                "and st.methodName in :methodNames")
                .setParameter("beanName", TaskSchedulerMBean.NAME)
                .setParameter("methodNames", methodNames)
                .getResultList();
        for (Entity currentEntity:result){
            em.remove(currentEntity);
        }
        tx.commit();
    } finally {
        tx.end()
    }
})