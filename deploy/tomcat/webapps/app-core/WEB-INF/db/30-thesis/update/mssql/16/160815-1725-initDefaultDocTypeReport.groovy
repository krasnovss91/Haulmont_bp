/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.DefaultReportsWorker
import com.haulmont.thesis.core.app.DocflowDeployerMBean
import com.haulmont.thesis.core.entity.DocKind

/**
 *
 * @author feoktistov
 * @version $Id$
 */
postUpdate.add({
    AppBeans.get(DocflowDeployerMBean.class).deployReports()
    Transaction tx = AppBeans.get(Persistence.class).createTransaction()
    try {
        DefaultReportsWorker defaultReportsWorker = AppBeans.get(DefaultReportsWorker.NAME)
        EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
        List<DocKind> docKinds = em.createQuery("select o from df\$DocKind o", DocKind.class).getResultList();
        defaultReportsWorker.setDefaultReportsToDocKind(docKinds);
        tx.commit();
    } finally {
        tx.end()
    }
})
