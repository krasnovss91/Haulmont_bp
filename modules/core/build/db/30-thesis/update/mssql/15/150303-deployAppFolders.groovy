/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.cuba.security.app.Authentication
import com.haulmont.thesis.core.app.DocflowDeployer
import com.haulmont.thesis.core.app.DocflowDeployerMBean
import org.apache.commons.lang.exception.ExceptionUtils
import org.apache.commons.logging.LogFactory

/**
 * @author Sergey Saiyan
 * @version $Id$
 */

postUpdate.add({
    Authentication authentication = AppBeans.get(Authentication.NAME);
    DocflowDeployerMBean bean = AppBeans.get(DocflowDeployer.NAME);
    try {
        authentication.begin()
        bean.deployAppFolders();
    } catch (Exception ex) {
        LogFactory.getLog(DbUpdater.class).error(ExceptionUtils.getStackTrace(ex))
    } finally {
        authentication.end()
    }
})
