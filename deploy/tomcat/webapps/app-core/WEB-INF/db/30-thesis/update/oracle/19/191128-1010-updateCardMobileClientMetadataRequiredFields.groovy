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
            def metadataNotRequiredFieldsMap = [
                    'tm$Task'      : ['priority'],
                    'df$MeetingDoc': ['theme', 'dateTime', 'timeUnit', 'secretary', 'chairman', 'initiator']
            ]
            def mobileClientMetadataManager = AppBeans.get(MobileClientMetadataManager.class)

            metadataNotRequiredFieldsMap.each { entry ->
                String entityName = entry.key
                CardMobileClientMetadata cardMobileClientMetadata = em.createQuery(
                        'select m from ts$CardMobileClientMetadata m where m.entityName = :entityName',
                        CardMobileClientMetadata.class)
                        .setParameter("entityName", entityName)
                        .getFirstResult()
                if (cardMobileClientMetadata == null)
                    return

                List<String> notRequiredProperties = entry.value
                List<CardProperty> cardProperties = mobileClientMetadataManager.parsePropertiesAndCalculatePropertyAttributes(
                        cardMobileClientMetadata)
                cardProperties.each { cardProperty ->
                    if (notRequiredProperties.contains(cardProperty.property))
                        cardProperty.required = false
                }

                String propertiesJson = mobileClientMetadataManager.convertCardPropertiesToJson(cardProperties)
                cardMobileClientMetadata.setProperties(propertiesJson)
            }
            em.setSoftDeletion(true)
        }
    })
})