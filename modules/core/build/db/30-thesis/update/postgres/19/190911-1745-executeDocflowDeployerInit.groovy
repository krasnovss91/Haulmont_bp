/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.AppContext
import com.haulmont.thesis.core.app.DocflowDeployerMBean

postUpdate.add({
    AppContext.addListener(new AppContext.Listener() {
        @Override
        void applicationStarted() {
            AppBeans.get(DocflowDeployerMBean.class).initDefault("init")
        }

        @Override
        void applicationStopped() {

        }
    })
})