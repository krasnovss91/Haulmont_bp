/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.haulmont.thesis.core.importer.scripts

import com.haulmont.cuba.core.entity.Entity
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Configuration
import com.haulmont.cuba.core.global.View
import com.haulmont.thesis.core.config.DefaultEntityConfig
import com.haulmont.thesis.core.entity.*
import org.apache.commons.lang.StringUtils
import org.apache.commons.lang.exception.ExceptionUtils

class ContractImportScript extends DocImportScript {

    @Override
    List<Entity> fillEntity(Map<String, Object> properties) {
        entityList = super.fillEntity(properties)

        setContractor(properties)
        setContractPerson(properties)
        setCurrencyValues(properties)

        return entityList
    }

    void setContractor(Map<String, Object> properties) {
        String contractorName = properties.get("contractor")
        Correspondent contractor
        if (StringUtils.isNotBlank(contractorName)) {
            contractor = (Correspondent) getEntityByField("contractor", contractorName)
            if (contractor == null) {
                contractor = createCorrespondent("contractor", contractorName)
            }
            setPropertyValue("contractor", contractor)
            entityList.add(contractor)
        }
    }

    void setContractPerson(Map<String, Object> properties) {
        String contactPersonName = properties.get("contactPerson")
        ContactPerson contactPerson
        if (StringUtils.isNotBlank(contactPersonName)) {
            contactPerson = (ContactPerson) loadContactPersonByValue(contactPersonName)
            if (contactPerson == null) {
                contactPerson = metadata.create(ContactPerson.class)
                contactPerson.setName(contactPersonName)
                String[] nameParts = contactPersonName.split("\\s+")
                if (nameParts.length >= 2) {
                    contactPerson.setFirstName(nameParts[0])
                    contactPerson.setLastName(nameParts[1])

                } else {
                    contactPerson.setLastName(contactPersonName)
                }
            }
            if (((Contract) doc).getContractor() != null && ((Contract) doc).getContractor() instanceof Company) {
                Company company = entityList.get(entityList.indexOf(((Contract) doc).getContractor()))
                if (company != null) {
                    contactPerson.setCompany(company)
                    setPropertyValue("contactPerson", contactPerson)
                    entityList.add(contactPerson)
                }
            }
        }
    }

    static ContactPerson loadContactPersonByValue(String value) {
        return persistence.getEntityManager().createQuery("select c from df\$ContactPerson c where c.name = :name", ContactPerson.class)
                .setParameter("name", value)
                .setView(new View(ContactPerson.class).addProperty("company").addProperty("name"))
                .getFirstResult()
    }

    void setCurrencyValues(Map<String, Object> properties) {
        Currency currency
        String currencyName = properties.get("currency")
        if (StringUtils.isNotBlank(currencyName)) {
            currency = (Currency) getCurrency(currencyName)
            if (currency == null) {
                currency = metadata.create(Currency.class)
                currency.setName(currencyName)
                currency.setCode(currencyName)
                currency.setDigitalCode(findFreeDigitalCode())
                persistence.entityManager.persist(currency)
            }
        } else {
            Configuration configuration = AppBeans.get(Configuration.NAME)
            currency = configuration.getConfig(DefaultEntityConfig.class).getCurrencyDefault()
        }

        setPropertyValue("currency", currency)
        entityList.add(currency)
    }

    protected String findFreeDigitalCode() {
        List<String> currencies = persistence.getEntityManager().createQuery("select c.digitalCode from df\$Currency c").getResultList()

        int i = 1
        boolean found = false
        while (!found) {
            String code = String.format("%03d", i)
            found = !currencies.contains(code)
            if (!found) i++
        }

        return String.format("%03d", i)
    }

    Currency getCurrency(String currencyCode) {
        try {
            return persistence.getEntityManager().createQuery("select c from df\$Currency c where c.code = :currencyCode", Currency.class)
                    .setParameter("currencyCode", currencyCode)
                    .getFirstResult()
        }
        catch (Exception e) {
            com.haulmont.chile.core.model.MetaClass docCategoryMetaClass = metadata.getSession().getClass(Currency.class)
            progressInfo.setError(messages.formatMessage("com.haulmont.thesis.core.importer.scripts", "incorrectFieldValue",
                    messageTools.getPropertyCaption(docCategoryMetaClass, "code")))
            log.error(ExceptionUtils.getStackTrace(e))
        }
        return null

    }


    @Override
    Doc createEntity() {
        return metadata.create(Contract.class)
    }

    List<String> getExcludedProperty() {
        List<String> result = super.getExcludedProperty()
        result.add("contractor")
        result.add("contactPerson")
        result.add("currency")
        return result
    }

    DocKind getDefaultDocKind() {
        Configuration configuration = AppBeans.get(Configuration.NAME)
        DefaultEntityConfig defaultEntityConfig = configuration.getConfig(DefaultEntityConfig.class)
        return defaultEntityConfig.getDefaultContractDocKind()
    }

    @Override
    void setSpecialSimpleValues(Doc doc) {
        Contract contract = (Contract) doc

        contract.setLiabilityStart((Date) properties.get("liabilityStart"))
        contract.setLiabilityEnd((Date) properties.get("liabilityEnd"))
        contract.setAmount((BigDecimal) properties.get("amount"))
        contract.setVatInclusive(Boolean.valueOf((String) properties.get("vatInclusive")))
        contract.setVatRate((BigDecimal) properties.get("vatRate"))
        contract.setVatAmount((BigDecimal) properties.get("vatAmount"))
        contract.setPaymentConditions((String) properties.get("paymentConditions"))
        contract.setActive(Boolean.valueOf((String) properties.get("active")))

    }

}
