/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.cuba.security.entity.User
import com.haulmont.thesis.core.fts.ThesisFtsManagerAPI

/**
 *
 * @author mishunin
 * @version $Id$
 */

postUpdate.add({
    ThesisFtsManagerAPI ftsManager = AppBeans.get(ThesisFtsManagerAPI.NAME);
    Metadata metadata = AppBeans.get(Metadata.NAME);
    ftsManager.reindexEntity(metadata.getExtendedEntities().getEffectiveMetaClass(User.class).getName());
    ftsManager.processQueue()
})