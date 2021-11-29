/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.FilterEntity

/**
 *
 * @author gaponenkov
 * @version $Id$
 */


postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<FilterEntity> filters;
    try {
        filters = em.createQuery("select f from sec\$Filter f").getResultList();
        filters.each { FilterEntity filter ->
            String xml = filter.getXml();
            if (xml != null) {
                xml = xml.replace("com.haulmont.docflow", "com.haulmont.thesis");
                xml = xml.replace("com.haulmont.taskman", "com.haulmont.thesis");
                xml = xml.replace("dk.docType", "{E}.docType");
                filter.setXml(xml);
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})