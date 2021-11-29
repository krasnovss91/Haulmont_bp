/*
 * Copyright (c) 2020 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.thesis.core.app.folder.AppFolderMigrationBean
import com.haulmont.thesis.core.entity.TsProcAppFolder
import org.slf4j.Logger
import org.slf4j.LoggerFactory

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.NAME)
    Transaction tx = persistence.createTransaction()
    Logger logger = LoggerFactory.getLogger(DbUpdater.class)
    AppFolderMigrationBean appFolderMigrationBean = AppBeans.get(AppFolderMigrationBean.NAME);
    try {
        List<TsProcAppFolder> procAppFolders = persistence.getEntityManager().createQuery('''
            select f from ts$TsProcAppFolder f 
                where f.procAppFolderXml is not null''', TsProcAppFolder.class)
                .getResultList()
        logger.info("found ${procAppFolders.size()} app folders with non null procAppFolderXml")
        procAppFolders.each { f ->
            appFolderMigrationBean.updateFolder(f);
        }
        tx.commit()
    } finally {
        tx.end()
    }
})