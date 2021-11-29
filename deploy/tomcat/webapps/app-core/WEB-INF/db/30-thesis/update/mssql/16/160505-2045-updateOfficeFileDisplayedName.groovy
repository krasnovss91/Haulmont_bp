/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.OfficeFileWorker
import com.haulmont.thesis.core.entity.OfficeFile

/**
 *
 * @author feoktistov
 * @version $Id$
 */

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {

            em.createQuery("select o from df\$OfficeFile o").setView(OfficeFile.class, "edit").getResultList().each { OfficeFile entity ->
                OfficeFileWorker officeFileWorker = AppBeans.get(OfficeFileWorker.class);
                officeFileWorker.updateDisplayedName(entity, entity.getNomenclature());
                em.merge(entity);
            }
        }
    })
})