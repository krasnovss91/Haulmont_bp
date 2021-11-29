/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.entity.AppFolder
import com.haulmont.cuba.core.global.AppBeans

/**
 *
 * @author gaponenkov
 * @version $Id$
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<AppFolder> appFolders;
    try {
        appFolders = em.createQuery("select af from sys\$AppFolder af").getResultList();
        appFolders.each { AppFolder appFolder ->
            String xml = appFolder.getFilterXml();
            if (xml != null) {
                xml = xml.replace("com.haulmont.docflow", "com.haulmont.thesis");
                xml = xml.replace("com.haulmont.taskman", "com.haulmont.thesis");
                xml = xml.replace("dk.docType", "{E}.docType");
                xml = xml.replace(">and exists", ">exists");
                appFolder.setFilterXml(xml);
            }
            String quantityScript = appFolder.getQuantityScript();
            if (quantityScript != null) {
                quantityScript = quantityScript.replace("and and exists", "and exists");
                quantityScript = quantityScript.replace("where and", "where")
                appFolder.setQuantityScript(quantityScript);
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})