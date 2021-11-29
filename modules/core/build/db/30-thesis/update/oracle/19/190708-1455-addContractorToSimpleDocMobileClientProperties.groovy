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
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.thesis.core.app.LocaleProvider
import com.haulmont.thesis.core.app.mobile.rest.app.metadata.MobileClientMetadataManager
import com.haulmont.thesis.core.app.mobile.rest.dto.CardProperty
import com.haulmont.thesis.core.entity.Company
import com.haulmont.thesis.core.entity.Doc
import com.haulmont.thesis.core.entity.Individual
import com.haulmont.thesis.core.entity.mobile.CardMobileClientMetadata

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {
            CardMobileClientMetadata simpleDocMobileClientMetadata = em.createQuery(
                    "select m from ts\$CardMobileClientMetadata m where m.entityName = :entityName",
                    CardMobileClientMetadata.class)
                    .setParameter("entityName", "df\$SimpleDoc")
                    .getFirstResult()

            if (simpleDocMobileClientMetadata != null) {
                def mobileClientMetadataManager = AppBeans.get(MobileClientMetadataManager.class)
                def messages = AppBeans.get(Messages.class)
                def metadata = AppBeans.get(Metadata.class)

                List<CardProperty> cardProperties = mobileClientMetadataManager.parsePropertiesAndCalculatePropertyAttributes(
                        simpleDocMobileClientMetadata)

                cardProperties = Lists.newArrayList(Iterables.filter(cardProperties, new Predicate<CardProperty>() {
                    @Override
                    boolean apply(CardProperty cardProperty) {
                        return !cardProperty.getProperty().equals("contractor")
                    }
                }))

                CardProperty contractorCardProperty = new CardProperty()
                contractorCardProperty.setProperty("contractor")
                contractorCardProperty.setTypesToSelect(
                        Lists.newArrayList(metadata.getClass(Company.class).getName(), metadata.getClass(Individual.class).getName())
                )
                Map<String, Object> contractorLocName = Maps.newLinkedHashMap()
                contractorLocName.put("ru", messages.getMessage(Doc.class, "Doc.contractor", LocaleProvider.get("ru")))
                contractorLocName.put("en", messages.getMessage(Doc.class, "Doc.contractor", LocaleProvider.get("en")))
                contractorCardProperty.setLocName(contractorLocName)

                def index = Iterables.indexOf(cardProperties, new Predicate<CardProperty>() {
                    @Override
                    boolean apply(CardProperty cardProperty) {
                        return cardProperty.getProperty().equals("department")
                    }
                })
                index = index == -1 ? cardProperties.size() : index + 1

                cardProperties.add(index, contractorCardProperty)

                String propertiesJson = mobileClientMetadataManager.convertCardPropertiesToJson(cardProperties)
                simpleDocMobileClientMetadata.setProperties(propertiesJson)
            }
        }
    })
})