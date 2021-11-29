/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.DocflowDeployerMBean
import com.haulmont.thesis.core.entity.MeetingDoc
import com.haulmont.thesis.core.entity.Solution

/**
 *
 * @author shamashov
 * @version $Id$
 */
postUpdate.add({
    AppBeans.get(DocflowDeployerMBean.class).initLogging()
    Transaction tx = AppBeans.get(Persistence.class).createTransaction()
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager()
    List<MeetingDoc> meetingDocs
    try {
        em.setSoftDeletion(false)
        meetingDocs = em.createQuery("select md from df\$MeetingDoc md").getResultList()
        meetingDocs.each { MeetingDoc meetingDoc ->
            List<Solution> solutions = meetingDoc.getSolutions()
            if (solutions != null && !solutions.isEmpty()) {
                StringBuilder solutionsString = new StringBuilder()

                for (int i = 0; i < solutions.size() - 1; i++) {
                    String solution = solutions.get(i).getSolution()
                    solutionsString.append(solution).append("\n")
                }

                String solution = solutions.get(solutions.size() - 1).getSolution()
                solutionsString.append(solution)
                meetingDoc.setComment(solutionsString.toString())
            }
        }
        tx.commit()
    } finally {
        tx.end()
    }
})