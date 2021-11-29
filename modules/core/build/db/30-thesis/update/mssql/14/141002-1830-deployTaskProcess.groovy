/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.thesis.core.app.TaskmanDeployerMBean
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

/**
 * @author Sergey Saiyan
 * @version $Id$
 */

postUpdate.add({
    try {
        TaskmanDeployerMBean taskmanDeployerMBean = AppBeans.get(TaskmanDeployerMBean.class);
        taskmanDeployerMBean.deployProcess();
    } catch (Exception ex) {
        Log log = LogFactory.getLog(DbUpdater.class);
        log.error("Could not deploy Task process");
        log.error(ex);
        // try to run app anyway
    }
})
