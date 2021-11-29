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
import com.haulmont.cuba.security.entity.Presentation
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
        TypedQuery<Presentation> query = em.createQuery('select p from sec\$Presentation p where p.componentId in :componentIds', Presentation.class)
        query.setParameter('componentIds', ['[df$SimpleDoc.browse].cardsTable', '[df$SimpleDoc.templateBrowse].cardsTable'])
        List<Presentation> presentations = query.resultList
        for (Presentation presentation : presentations) {
            Document doc
            if (presentation.xml) {
                doc = Dom4j.readDocument(presentation.xml)
            } else {
                doc = DocumentHelper.createDocument()
                doc.rootElement = doc.addElement('presentation')
            }
            Element root = doc.rootElement
            final Element columnsElem = root.element('columns')
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
                if ('[df$SimpleDoc.browse].cardsTable'.equals(presentation.componentId)
                        && 'Расширенная'.equals(presentation.name))
                    departmentNode.addAttribute('visible', 'true')
                else
                    departmentNode.addAttribute('visible', 'false')
                colElements.add((prevColumnIndex + 1), departmentNode)
            }
            presentation.xml = Dom4j.writeDocument(doc, true)
            em.merge(presentation)
        }
    } as Transaction.Runnable)
})