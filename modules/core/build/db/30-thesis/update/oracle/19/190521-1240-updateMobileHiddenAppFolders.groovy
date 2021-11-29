/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.app.ConfigStorageAPI
import com.haulmont.cuba.core.entity.Config
import com.haulmont.cuba.core.global.AppBeans

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {
            def config = em.createQuery("select c from sys\$Config c " +
                    "where c.name = 'thesis.mobile.hiddenAppFolders'", Config.class).getFirstResult()

            if (config != null && config.value) {
                config.value = config.value.replaceAll("AppFolder_doc.office\\|?", "")
                config.value = config.value.replaceAll("AppFolder_doc.resolutionProcessing\\|?", "")
                config.value = config.value.replaceAll("AppFolder_doc.resolution\\|?", "")
            }
        }
    })

    AppBeans.get(ConfigStorageAPI.class).clearCache()
})