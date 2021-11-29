/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.TypedQuery
import com.haulmont.cuba.core.app.FileStorageService
import com.haulmont.cuba.core.entity.FileDescriptor
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.thesis.core.app.PhotoTools
import com.haulmont.thesis.core.entity.Employee
import org.apache.commons.lang.exception.ExceptionUtils
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

/**
 * @author kandalin
 * @version $Id$
 */
postUpdate.add({
    Log log = LogFactory.getLog(DbUpdater.class)
    Transaction tx = AppBeans.get(Persistence.class).createTransaction()
    try {
        EntityManager em = AppBeans.get(Persistence.class).getEntityManager()
        FileStorageService fileStorageService = AppBeans.get(FileStorageService.class)
        PhotoTools photoTools = AppBeans.get(PhotoTools.class)

        TypedQuery<Employee> query = em.createQuery("select e from df\$Employee e where e.photo is not null", Employee.class)
        query.setViewName("withPhoto")
        List<Employee> employees = query.getResultList()

        for (Employee employee : employees) {
            FileDescriptor photo = employee.getPhoto()
            try {
                if (fileStorageService.fileExists(photo)) {
                    FileDescriptor mobileAvatar = photoTools.createMobileAvatar(photo)
                    if (mobileAvatar != null) {
                        employee.setMobileAvatar(mobileAvatar)
                        em.persist(mobileAvatar)
                        em.merge(employee)
                    }
                }
            } catch (Exception ex) {
                log.error(ExceptionUtils.getStackTrace(ex))
            }
        }
        tx.commit()
    } finally {
        tx.end()
    }
})