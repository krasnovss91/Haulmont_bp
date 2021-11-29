/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */


import com.google.common.base.Predicate
import com.google.common.collect.Iterables
import com.google.common.collect.Lists
import com.google.common.collect.Maps
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Messages
import com.haulmont.thesis.core.app.LocaleProvider
import com.haulmont.thesis.core.app.mobile.rest.app.metadata.MobileClientMetadataManager
import com.haulmont.thesis.core.app.mobile.rest.dto.CardProperty
import com.haulmont.thesis.core.entity.Doc
import com.haulmont.thesis.core.entity.mobile.CardMobileClientMetadata
import org.apache.commons.collections.CollectionUtils

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {
            List<CardMobileClientMetadata> metadataToUpdate = em.createQuery(
                    "select m from ts\$CardMobileClientMetadata m where m.entityName in :entityNames",
                    CardMobileClientMetadata.class)
                    .setParameter("entityNames", Lists.newArrayList("df\$SimpleDoc", "df\$Contract"))
                    .getResultList()

            if (CollectionUtils.isEmpty(metadataToUpdate))
                return

            metadataToUpdate.each { mobileClientCardMetadata ->
                def mobileClientMetadataManager = AppBeans.get(MobileClientMetadataManager.class)
                def messages = AppBeans.get(Messages.class)

                List<CardProperty> cardProperties = mobileClientMetadataManager.parsePropertiesAndCalculatePropertyAttributes(
                        mobileClientCardMetadata)

                cardProperties = Lists.newArrayList(Iterables.filter(cardProperties, new Predicate<CardProperty>() {
                    @Override
                    boolean apply(CardProperty cardProperty) {
                        return !cardProperty.getProperty().equals("resolution") && !cardProperty.getProperty().equals("finishDatePlan")
                    }
                }))

                CardProperty resolutionCardProperty = new CardProperty()
                resolutionCardProperty.setProperty("resolution")
                resolutionCardProperty.setReadonly(true)
                resolutionCardProperty.setMultiLine(true)
                Map<String, Object> resolutionLocName = Maps.newLinkedHashMap()
                resolutionLocName.put("ru", messages.getMessage(Doc.class, "Doc.resolution", LocaleProvider.get("ru")))
                resolutionLocName.put("en", messages.getMessage(Doc.class, "Doc.resolution", LocaleProvider.get("en")))
                resolutionCardProperty.setLocName(resolutionLocName)

                CardProperty finishDatePlanCardProperty = new CardProperty()
                finishDatePlanCardProperty.setProperty("finishDatePlan")
                finishDatePlanCardProperty.setReadonly(true)
                Map<String, Object> finishDatePlanLocName = Maps.newLinkedHashMap()
                finishDatePlanLocName.put("ru", messages.getMessage(Doc.class, "Doc.finishDatePlan", LocaleProvider.get("ru")))
                finishDatePlanLocName.put("en", messages.getMessage(Doc.class, "Doc.finishDatePlan", LocaleProvider.get("en")))
                finishDatePlanCardProperty.setLocName(finishDatePlanLocName)

                cardProperties.add(0, resolutionCardProperty)
                cardProperties.add(1, finishDatePlanCardProperty)

                String propertiesJson = mobileClientMetadataManager.convertCardPropertiesToJson(cardProperties)
                mobileClientCardMetadata.setProperties(propertiesJson)
            }
        }
    })
})