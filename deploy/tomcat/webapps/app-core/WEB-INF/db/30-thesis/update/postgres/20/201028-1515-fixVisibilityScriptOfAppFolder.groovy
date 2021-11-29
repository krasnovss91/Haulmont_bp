import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.thesis.core.app.folder.AppFolderMigrationBean
import com.haulmont.thesis.core.entity.TsProcAppFolder
import org.apache.commons.collections4.CollectionUtils
import org.slf4j.Logger
import org.slf4j.LoggerFactory

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.NAME)
    Transaction tx = persistence.createTransaction()
    AppFolderMigrationBean appFolderMigrationBean = AppBeans.get(AppFolderMigrationBean.NAME);
    Logger logger = LoggerFactory.getLogger(DbUpdater.class)
    List<TsProcAppFolder> procAppFolders = null
    try {
        procAppFolders = persistence.getEntityManager().createQuery('''
                select f from ts$TsProcAppFolder f 
                where f.visibilityScript is not null''', TsProcAppFolder.class)
                .getResultList()
        tx.commit()
    } catch (Exception e) {
        logger.error("Exception while getting app folders to update", e)
    } finally {
        tx.end()
    }
    if (CollectionUtils.isNotEmpty(procAppFolders)) {
        procAppFolders.each { f ->
            appFolderMigrationBean.updateVisibilityScript(f)
        }
        logger.info("Updated VisibilityScript of ${procAppFolders.size()} app folders")
    }
})