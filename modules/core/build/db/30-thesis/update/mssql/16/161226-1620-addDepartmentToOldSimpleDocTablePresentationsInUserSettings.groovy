/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.bali.util.Dom4j
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.TypedQuery
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.UserSetting
import org.dom4j.Document
import org.dom4j.DocumentHelper
import org.dom4j.Element

/**
 *
 * @author yakovchenko
 * @version $Id$
 */

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute({ EntityManager em ->
        TypedQuery<UserSetting> query = em.createQuery('select p from sec\$UserSetting p where p.name in :names', UserSetting.class)
        query.setParameter('names', ['df$SimpleDoc.browse', 'df$SimpleDoc.templateBrowse'])
        List<UserSetting> userSettings = query.resultList
        for (UserSetting userSetting : userSettings) {
            Document doc
            if (userSetting.value) {
                doc = Dom4j.readDocument(userSetting.value)
            }
            Element root = doc.rootElement
            final Element componentsElem = root.element('components')
            for (Element compElem : Dom4j.elements(componentsElem, 'component')) {
                if ('cardsTable'.equals(compElem.attributeValue('name'))) {
                    final Element columnsElem = compElem.element('columns')
                    List<Element> colElements = Dom4j.elements(columnsElem, 'columns')
                    int prevColumnIndex = colElements.size() - 1
                    boolean haveDepartment = false
                    for (int i = 0; i < colElements.size(); i++) {
                        Element colElem = colElements.get(i)
                        if ('organization'.equals(colElem.attributeValue('id'))) {
                            prevColumnIndex = i
                        } else if ('department'.equals(colElem.attributeValue('id'))) {
                            haveDepartment = true
                            break
                        }
                    }
                    if (!haveDepartment) {
                        Element departmentNode = DocumentHelper.createElement('columns')
                        departmentNode.addAttribute('id', 'department')
                        departmentNode.addAttribute('visible', 'false')
                        colElements.add((prevColumnIndex + 1), departmentNode)
                    }
                }
            }
            userSetting.value = Dom4j.writeDocument(doc, true)
            em.merge(userSetting)
        }
    } as Transaction.Runnable)
})