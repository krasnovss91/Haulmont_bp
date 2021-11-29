import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.reports.ReportingBean
import com.haulmont.reports.entity.Report
import com.haulmont.reports.listener.ReportDetachListener

Persistence persistence = AppBeans.get(Persistence.NAME);
ReportingBean reportingBean = AppBeans.get(ReportingBean.NAME);
ReportDetachListener reportDetachListener = AppBeans.get('report_ReportDetachListener');

Transaction tx = persistence.getTransaction();
try {
    persistence.entityManager.createQuery('select r from ts$Report r', Report).resultList.each {
        reportDetachListener.onBeforeDetach(it, persistence.entityManager)
        reportingBean.storeIndexFields(it)
    }
    tx.commit();
} finally {
    tx.end();
}