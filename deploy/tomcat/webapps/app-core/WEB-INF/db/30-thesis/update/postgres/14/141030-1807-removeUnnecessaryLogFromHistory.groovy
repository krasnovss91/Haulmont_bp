/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.google.common.collect.Sets
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.ThesisPostUpdateMigrationWorker
import com.haulmont.thesis.core.entity.schedule.ScheduleTask
import com.haulmont.thesis.core.entity.schedule.ScheduleTrigger

postUpdate.add({
    AppBeans.get(ThesisPostUpdateMigrationWorker.class).removeAttributesFromEntityLog(ScheduleTask.class,
            Sets.newHashSet("id", "scheduleTriggers")
    )

    AppBeans.get(ThesisPostUpdateMigrationWorker.class).removeAttributesFromEntityLog(ScheduleTrigger.class,
            Sets.newHashSet("id", "name")
    )
})