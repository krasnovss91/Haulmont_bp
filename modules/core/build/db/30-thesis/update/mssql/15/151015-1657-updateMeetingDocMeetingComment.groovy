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
import com.haulmont.thesis.core.entity.MeetingQuestion

/**
 *
 * @author timokhov
 * @version $Id$
 */
postUpdate.add({
    AppBeans.get(DocflowDeployerMBean.class).initLogging()
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<MeetingDoc> meetingDocs;
    try {
        em.setSoftDeletion(false);
        meetingDocs = em.createQuery("select md from df\$MeetingDoc md").getResultList();
        meetingDocs.each { MeetingDoc meetingDoc ->
            meetingDoc.setMeetingComment(meetingDoc.getComment());
            StringBuffer questions = new StringBuffer();
            if (meetingDoc.getMeetingQuestions() != null && !meetingDoc.getMeetingQuestions().isEmpty()){
                for(MeetingQuestion question : meetingDoc.getMeetingQuestions()){
                    questions.append(question.getNumber() + ". ").append(question.getQuestion()).append("\n");
                }
                if(questions.length() > 2) {
                    questions.delete(questions.length() - 1, questions.length());
                }
            }
            meetingDoc.setComment(questions.toString());
        }
        tx.commit();
    } finally {
        tx.end();
    }
})
