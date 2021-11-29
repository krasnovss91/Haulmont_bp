/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Query
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.app.ConfigStorageAPI
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Configuration
import com.haulmont.thesis.core.config.ActiveDirectorySynchronizationConfig

postUpdate.add({
    Configuration configuration = AppBeans.get(Configuration.NAME)
    ActiveDirectorySynchronizationConfig synchronizationConfig = configuration.getConfig(ActiveDirectorySynchronizationConfig.class)
    Persistence persistence = AppBeans.get(Persistence.NAME)
    Transaction transaction = persistence.createTransaction()

    try {
        Query query = persistence.entityManager.createNativeQuery("select value from sys_config " +
                "where name = 'thesis.ADSynchronization.synchronizationLevel'")
        String value = query.firstResult
        if (value != null && value.equals("ATTRIBUTES"))
            synchronizationConfig.setSynchronizeAttributes(true)

        persistence.entityManager.createNativeQuery("delete from sys_config " +
                "where name = 'thesis.ADSynchronization.synchronizationLevel'").executeUpdate()

        transaction.commit()
    } finally {
        transaction.end()
        AppBeans.get(ConfigStorageAPI.NAME).clearCache()
    }
})