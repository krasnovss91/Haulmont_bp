/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.entity.CalendarEventItem
import com.haulmont.thesis.core.entity.CalendarEventParticipant

/**
 *
 * @author d.evdokimov
 * @version $Id$
 */
postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Callable() {
        @Override
        Object call(EntityManager em) {
            List<CalendarEventItem> calendarEventItems = em
                    .createQuery("select e from ts\$CalendarEventItem e where e.card.state = ',DelayedStart,'")
                    .getResultList()
            for (CalendarEventItem calendarEventItem : calendarEventItems) {
                for (CalendarEventParticipant eventParticipant : calendarEventItem.getParticipants()) {
                    em.remove(eventParticipant)
                }
                em.remove(calendarEventItem)
            }
            return null
        }
    })
})