import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans

Persistence persistence = AppBeans.get(Persistence.NAME);
Transaction tx = persistence.getTransaction();
try {
    persistence.entityManager.createNativeQuery('update SEC_PERMISSION set VALUE_ = VALUE').executeUpdate()
    persistence.entityManager.createNativeQuery('alter table SEC_PERMISSION drop column VALUE').executeUpdate()
    tx.commit();
} catch (Exception ignore) {
} finally {
    tx.end();
}