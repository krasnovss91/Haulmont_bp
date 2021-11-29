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
import com.haulmont.cuba.core.sys.AppContext
import com.haulmont.thesis.core.app.ConfigPropertiesService
import com.haulmont.thesis.core.app.SignatureConstants
import com.haulmont.thesis.core.entity.Doc
import com.haulmont.workflow.core.entity.Attachment
import org.apache.commons.collections4.CollectionUtils
import org.apache.commons.lang.StringUtils
import org.dom4j.Document
import org.dom4j.Element

/**
 *
 * @author mishunin
 * @version $Id$
 */

postUpdate.add({

    String defaultSign = AppContext.getProperty("thesis.signatureSupport")
    if (defaultSign == null)
        defaultSign = SignatureConstants.STANDARD_NAME

    ConfigPropertiesService configPropertiesService = AppBeans.get(ConfigPropertiesService.NAME)
    String pathApp = StringUtils.removeEnd(AppContext.getProperty("cuba.confDir"), "-core") + "/local.web-app.properties";
    String pathAppCore = AppContext.getProperty("cuba.confDir") + "/local.app.properties";
    Map<String, Object> configParametersApp = configPropertiesService.readConfig("file:///" + pathAppCore);
    Map<String, Object> configParametersWebApp = configPropertiesService.readConfig("file:///" + pathApp);
    configParametersApp.put("thesis.userSignatureTypeDefault", defaultSign)
    configParametersWebApp.put("thesis.userSignatureTypeDefault", defaultSign)

    configPropertiesService.writeConfig(pathAppCore, configParametersApp);
    configPropertiesService.writeConfig(pathApp, configParametersWebApp);

    Persistence persistence = AppBeans.get(Persistence.class)
    Transaction tx = persistence.getTransaction()
    try {

        EntityManager em = persistence.getEntityManager();
        em.setSoftDeletion(false)

        TypedQuery<Doc> docsQuery = em.createQuery("select d from df\$Doc d where d.signatures is not NULL", Doc.class)
        List<Doc> signedDocs = docsQuery.getResultList()
        if (CollectionUtils.isNotEmpty(signedDocs)) {
            for (Doc doc : signedDocs) {
                Document xml = Dom4j.readDocument(doc.signatures)
                Element rootElem = xml.getRootElement()
                for (Element element : Dom4j.elements(rootElem, "signatureEntry")) {
                    Element signatureType = element.addElement("signatureType")
                    signatureType.setText(defaultSign)
                }
                StringWriter writer = new StringWriter();
                Dom4j.writeDocument(xml, true, writer);

                doc.signatures = writer.toString()
                em.merge(doc)
            }
        }

        TypedQuery<Attachment> attachmentQuery = em.createQuery("select a from wf\$Attachment a where a.signatures is not NULL", Attachment.class)
        List<Attachment> signedAttachments = attachmentQuery.getResultList()

        if (CollectionUtils.isNotEmpty(signedAttachments)) {
            for (Attachment attachment : signedAttachments) {
                Document xml = Dom4j.readDocument(attachment.signatures)
                Element rootElem = xml.getRootElement()
                for (Element element : Dom4j.elements(rootElem, "signatureEntry")) {
                    Element signatureType = element.addElement("signatureType")
                    signatureType.setText(defaultSign)
                }
                StringWriter writer = new StringWriter()
                Dom4j.writeDocument(xml, true, writer)

                attachment.signatures = writer.toString()
                em.merge(attachment)
            }
        }

        tx.commit();
    } finally {
        tx.end();
    }
})