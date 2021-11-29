/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.mobile.rest.app.metadata.MobileClientMetadataManager
import com.haulmont.thesis.core.app.mobile.rest.dto.CardProperty
import com.haulmont.thesis.core.entity.mobile.CardMobileClientMetadata

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {
            em.setSoftDeletion(false)
            def mobileClientMetadataManager = AppBeans.get(MobileClientMetadataManager.class)
            CardMobileClientMetadata cardMobileClientMetadata = em.createQuery(
                    'select m from ts$CardMobileClientMetadata m where m.entityName = :entityName',
                    CardMobileClientMetadata.class)
                    .setParameter("entityName", "df\$MeetingDoc")
                    .getFirstResult()
            if (cardMobileClientMetadata == null)
                return

            List<CardProperty> cardProperties = mobileClientMetadataManager.parsePropertiesAndCalculatePropertyAttributes(
                    cardMobileClientMetadata)

            CardProperty participantsProp = cardProperties.find { it.property == "participants" }
            if (participantsProp) {
                CardProperty userProp = participantsProp.relatedProperties.find { it.property == "user" }
                userProp.setRequired(true)
            }

            String propertiesJson = mobileClientMetadataManager.convertCardPropertiesToJson(cardProperties)
            cardMobileClientMetadata.setProperties(propertiesJson)

            em.setSoftDeletion(true)
        }
    })
})