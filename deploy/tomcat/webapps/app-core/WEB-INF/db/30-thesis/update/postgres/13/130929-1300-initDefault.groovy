/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.DocflowDeployerMBean

/**
 *
 * @author pavlov
 * @version $Id$
 */

postUpdate.add({ AppBeans.get(DocflowDeployerMBean.class).initDefault("init"); })
