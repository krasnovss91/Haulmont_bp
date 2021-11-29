/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
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
                    "2020-01-01",
                    "2020-01-02",
                    "2020-01-03",
                    "2020-01-06",
                    "2020-01-07",
                    "2020-01-08",
                    "2020-02-24",
                    "2020-03-09",
                    ["2020-04-30", "09:00", "13:00"],
                    ["2020-04-30", "14:00", "17:00"],
                    "2020-05-01",
                    "2020-05-04",
                    "2020-05-05",
                    ["2020-05-08", "09:00", "13:00"],
                    ["2020-05-08", "14:00", "17:00"],
                    "2020-05-11",
                    ["2020-06-11", "09:00", "13:00"],
                    ["2020-06-11", "14:00", "17:00"],
                    "2020-06-12",
                    ["2020-11-03", "09:00", "13:00"],
                    ["2020-11-03", "14:00", "17:00"],
                    "2020-11-04",
                    ["2020-12-31", "09:00", "13:00"],
                    ["2020-12-31", "14:00", "17:00"]
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

            em.createQuery('delete from wf$Calendar c where c.day is not null').executeUpdate()

            for (WorkCalendarEntity exceptionDay : exceptionDaysToCreate)
                em.persist(exceptionDay)
        }
    })
})