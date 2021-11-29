/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.entity.TaskGroupTask

/**
 *
 * @author gaslov
 * @version $Id$
 */

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class)
    Transaction tx = persistence.createTransaction()
    EntityManager em = persistence.getEntityManager()
    try {
        List<TaskGroupTask> tgts = em.createQuery("select tgt from tm\$TaskGroupTask tgt")
                .setView(TaskGroupTask.class, "taskGroupTask-edit").getResultList()
        for (TaskGroupTask tgt : tgts) {
            tgt.syncWithTask()
        }
        tx.commit()
    } finally {
        tx.end()
    }
})