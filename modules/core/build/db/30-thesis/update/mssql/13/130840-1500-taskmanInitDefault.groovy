/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.TaskmanDeployerMBean

/**
 *
 * @author Saiyan Sergey
 * @version $Id$
 */

postUpdate.add({
    TaskmanDeployerMBean taskmanDeployerMBean = AppBeans.get("tm_TaskmanDeployer");
    taskmanDeployerMBean.initDefault("init");
});