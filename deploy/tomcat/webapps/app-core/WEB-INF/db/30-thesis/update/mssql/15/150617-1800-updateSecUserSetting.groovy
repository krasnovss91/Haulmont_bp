/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.UserSetting

/**
 *
 * @author mishunin
 * @version $Id$
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<UserSetting> userSettings;
    try {
        userSettings = em.createQuery("select us from sec\$UserSetting us where us.name = :name").setParameter("name", "foldersState").getResultList();
        userSettings.each { UserSetting setting ->
            String value = setting.getValue();
            String vPos = value.substring(value.lastIndexOf(',') + 1, value.length());
            int newVPos = vPos.toInteger() / 8
            setting.setValue(value.substring(0, value.lastIndexOf(',') + 1) + newVPos);
        }
        tx.commit();
    } finally {
        tx.end();
    }
})