/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.TypedQuery
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.User
import com.haulmont.thesis.core.app.CalendarWorker
import com.haulmont.thesis.core.entity.MeetingDoc
import com.haulmont.thesis.core.entity.MeetingParticipant
import com.haulmont.thesis.core.entity.MeetingTypes
import com.haulmont.workflow.core.entity.Assignment

/**
 *
 * @author mishunin
 * @version $Id$
 */

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.NAME)
    CalendarWorker calendarWorker = AppBeans.get(CalendarWorker.NAME)
    Transaction tx = persistence.createTransaction()

    try {
        EntityManager em = persistence.getEntityManager()
        TypedQuery<Assignment> assignmentQuery = em.createQuery("select a from wf\$Assignment a where " +
                "a.dueDate is not null and a.finished is null",
                Assignment.class)
        assignmentQuery.setViewName("ical")

        List<Assignment> assignments = assignmentQuery.getResultList()

        for (Assignment assignment : assignments) {
            calendarWorker.createCalendarEventItem(assignment.getCard(), assignment.getUser(), null,
                    assignment.getDueDate(), assignment, false)
        }

        TypedQuery<MeetingDoc> meetingDocQuery = em.createQuery("select d from df\$MeetingDoc d where " +
                "d.dateTime is not null and d.status = :status and d.versionOf is null and d.template = false", MeetingDoc.class)
                .setParameter("status", MeetingTypes.AGENDA.getId())
        meetingDocQuery.setViewName("edit")
        List<MeetingDoc> meetingDocs = meetingDocQuery.getResultList()
        for (MeetingDoc meetingDoc : meetingDocs) {
            List<User> newUsers = new ArrayList<>();
            if (meetingDoc.getChairman() != null)
                newUsers.add(meetingDoc.getChairman());
            if (meetingDoc.getSecretary() != null)
                newUsers.add(meetingDoc.getSecretary());
            if (meetingDoc.getInitiator() != null)
                newUsers.add(meetingDoc.getInitiator());
            if (meetingDoc.getParticipants() != null)
                for (MeetingParticipant meetingParticipant : meetingDoc.getParticipants()) {
                    if (meetingParticipant.getUser() != null)
                        newUsers.add(meetingParticipant.getUser())
                }
            calendarWorker.createCalendarEventItems(meetingDoc, newUsers, meetingDoc.getDateTime(),
                    meetingDoc.getEndDateTime(), meetingDoc, false)
        }

        tx.commit()
    } finally {
        tx.end()
    }
})