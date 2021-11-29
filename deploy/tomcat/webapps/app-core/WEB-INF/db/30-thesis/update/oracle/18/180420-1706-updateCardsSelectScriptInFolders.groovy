/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.folders.AppFolderBuilder
import com.haulmont.thesis.core.entity.TsProcAppFolder

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.NAME)
    Transaction tx = persistence.createTransaction()
    try {
        List<TsProcAppFolder> procAppFolders = persistence.getEntityManager().createQuery('''
            select f from ts$TsProcAppFolder f 
                where f.procAppFolderXml is not null
                and f.cardsSelectScript is null''', TsProcAppFolder.class)
                .getResultList()

        procAppFolders.each { f ->
            def root = new XmlSlurper().parseText(f.procAppFolderXml)

            AppFolderBuilder builder = new AppFolderBuilder()
            builder.entity = root.entity
            root.conditions.condition.each { c ->
                builder.addCondition(c.proc.text(), c.states.text().split(','))
            }
            f.cardsSelectScript = builder.generateCardsSelectScript()
        }
        tx.commit()
    } finally {
        tx.end()
    }
})