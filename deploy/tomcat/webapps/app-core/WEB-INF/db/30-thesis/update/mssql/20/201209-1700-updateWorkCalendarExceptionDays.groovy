/*
 * Copyright (c) 2020 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.google.common.collect.Lists
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.workflow.core.entity.WorkCalendarEntity

import java.text.SimpleDateFormat

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {
            def exceptionDays = [
                    "2021-01-01",
                    "2021-01-04",
                    "2021-01-05",
                    "2021-01-06",
                    "2021-01-07",
                    "2021-01-08",
                    ["2021-02-20", "09:00", "13:00"],
                    ["2021-02-20", "14:00", "17:00"],
                    "2021-02-22",
                    "2021-02-23",
                    "2021-03-08",
                    ["2021-04-30", "09:00", "13:00"],
                    ["2021-04-30", "14:00", "17:00"],
                    "2021-05-03",
                    "2021-05-10",
                    ["2021-06-11", "09:00", "13:00"],
                    ["2021-06-11", "14:00", "17:00"],
                    "2021-06-14",
                    ["2021-11-03", "09:00", "13:00"],
                    ["2021-11-03", "14:00", "17:00"],
                    "2021-11-04",
                    "2021-11-05",
                    "2021-12-31"
            ]

            def metadata = AppBeans.get(Metadata.class)
            SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd")
            SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm")

            List<WorkCalendarEntity> exceptionDaysToCreate = Lists.newArrayList()
            try {
                for (Object exceptionDayInfo : exceptionDays) {
                    Date day = null
                    Date start = null
                    Date end = null
                    if (exceptionDayInfo instanceof String) {
                        day = dayFormat.parse((String) exceptionDayInfo)
                    } else if (exceptionDayInfo instanceof List) {
                        List<String> info = (List<String>) exceptionDayInfo
                        day = dayFormat.parse(info.get(0))
                        start = timeFormat.parse(info.get(1))
                        end = timeFormat.parse(info.get(2))
                    }

                    WorkCalendarEntity workCalendarEntity = metadata.create(WorkCalendarEntity.class)
                    workCalendarEntity.setDay(day)
                    workCalendarEntity.setStart(start)
                    workCalendarEntity.setEnd(end)
                    exceptionDaysToCreate.add(workCalendarEntity)
                }
            } catch (Exception e) {
                throw new RuntimeException("Work calendar exception days update error", e)
            }

            Date yearStart = dayFormat.parse('2021-01-01')
            Date yearEnd = dayFormat.parse('2021-12-31')
            em.createQuery('delete from wf$Calendar c where c.day >= :start and c.day <= :end')
                    .setParameter('start', yearStart)
                    .setParameter('end', yearEnd)
                    .executeUpdate()

            for (WorkCalendarEntity exceptionDay : exceptionDaysToCreate)
                em.persist(exceptionDay)
        }
    })
})