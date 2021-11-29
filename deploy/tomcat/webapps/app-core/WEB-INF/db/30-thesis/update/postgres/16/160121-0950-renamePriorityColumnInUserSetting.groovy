/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.bali.util.Dom4j
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.UserSetting
import org.apache.commons.collections4.CollectionUtils
import org.apache.commons.lang.StringUtils
import org.dom4j.Document
import org.dom4j.Element

/**
 *
 * @author tsarev
 * @version $Id$
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction()
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager()
    List<UserSetting> userSettings
    List listComponents = Arrays.asList('tm$Task.browse', 'tm$TaskGroup.edit', 'tm$TaskGroupTemplate.edit', 'df$MeetingDoc.edit')
    try {
        userSettings = em.createQuery("select p from sec\$UserSetting p where p.name in :listNames", UserSetting.class).setParameter("listNames", listComponents).getResultList();
        if (CollectionUtils.isNotEmpty(userSettings)) {
            for (UserSetting userSetting : userSettings) {
                Document doc
                if (!StringUtils.isEmpty(userSetting.getValue())) {
                    doc = Dom4j.readDocument(userSetting.getValue());

                    Element root = doc.getRootElement();
                    final Element componentsElem = root.element("components");

                    for (Element compElem : Dom4j.elements(componentsElem, "component")) {
                        if ("tasksTable".equals(compElem.attributeValue("name"))
                                || "cardsTable".equals(compElem.attributeValue("name"))
                                || "taskGroupTasksFrame.tasksTable".equals(compElem.attributeValue("name"))
                                || "solutionFrame.solutionsTable".equals(compElem.attributeValue("name"))) {

                            Element columnsElem = compElem.element("columns");
                            for (Element colElem : Dom4j.elements(columnsElem, "columns")) {
                                if ("priority".equals(colElem.attributeValue("id"))) {
                                    colElem.addAttribute("id", "priority.orderNo")
                                }
                            }
                        }
                    }
                    userSetting.setValue(Dom4j.writeDocument(doc, false))
                    em.merge(userSetting)
                }
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})
