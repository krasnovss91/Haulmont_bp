/*
 * Copyright (c) 2019 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.app.ConfigStorageAPI
import com.haulmont.cuba.core.entity.Config
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.mobile.rest.MobileRestSettingsInitializer
import com.haulmont.thesis.core.app.mobile.rest.app.metadata.MobileClientMetadataManager
import com.haulmont.thesis.core.app.mobile.rest.dto.CardMetadataPayload
import com.haulmont.thesis.core.entity.mobile.CardMobileClientMetadata

def newTaskSettingsJson = "{\n" +
        "  \"name\": \"Задача\",\n" +
        "  \"entity_name\": \"tm\$Task\",\n" +
        "  \"properties\": [\n" +
        "    {\n" +
        "      \"property\": \"initiator\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Инициатор\",\n" +
        "        \"en\": \"Initiator\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"executor\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Исполнитель\",\n" +
        "        \"en\": \"Executor\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"taskName\",\n" +
        "      \"required\": true,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"multi_line\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Название\",\n" +
        "        \"en\": \"Name\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"finishDateTimePlan\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Выполнить до\",\n" +
        "        \"en\": \"Complete due\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"taskType\",\n" +
        "      \"readonly\": true,\n" +
        "      \"required\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Тип задачи\",\n" +
        "        \"en\": \"Task type\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"priority\",\n" +
        "      \"required\": true,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Приоритет\",\n" +
        "        \"en\": \"Priority\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"parentCard\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Основание\",\n" +
        "        \"en\": \"Parent card\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"primaryTask\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Зависит от\",\n" +
        "        \"en\": \"Depends on\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"reassignEnabled\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Переназначение возможно\",\n" +
        "        \"en\": \"Reassign enabled\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"refuseEnabled\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Отказ возможен\",\n" +
        "        \"en\": \"Refuse enabled\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"confirmRequired\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Не требует подтверждения выполнения\",\n" +
        "        \"en\": \"Does not require completion confirmation\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"fullDescr\",\n" +
        "      \"required\": false,\n" +
        "      \"multi_line\": true,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Полное описание\",\n" +
        "        \"en\": \"Full description\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"project\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Проект\",\n" +
        "        \"en\": \"Project\"\n" +
        "      }\n" +
        "    }\n" +
        "  ]\n" +
        "}"

def newDocSettingsJson = "{\n" +
        "  \"name\": \"Документ\",\n" +
        "  \"entity_name\": \"df\$SimpleDoc\",\n" +
        "  \"properties\": [\n" +
        "    {\n" +
        "      \"property\": \"cardInitiator\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Инициатор\",\n" +
        "        \"en\": \"Initiator\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"number\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"multi_line\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Номер\",\n" +
        "        \"en\": \"Number\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"date\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Дата\",\n" +
        "        \"en\": \"Date\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"theme\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"multi_line\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Тема\",\n" +
        "        \"en\": \"Theme\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"organization\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Организация\",\n" +
        "        \"en\": \"Organization\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"department\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"query_filter\": \"e.organization.id \\u003d :organization\",\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Подразделение\",\n" +
        "        \"en\": \"Department\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"parentCard\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Основание\",\n" +
        "        \"en\": \"Parent card\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"docCategory\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"query_filter\": \"(e.docKind.id \\u003d :kindId or e.docKind is null) and (e.docType.name\\u003d :entityName)\",\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Категория\",\n" +
        "        \"en\": \"Category\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"docSender\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"От\",\n" +
        "        \"en\": \"Send from\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"docReceiver\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Кому\",\n" +
        "        \"en\": \"Send to\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"docCopyReceiver\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Копия\",\n" +
        "        \"en\": \"Send copy to\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"owner\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Куратор\",\n" +
        "        \"en\": \"Manager\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"comment\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"multi_line\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Содержание\",\n" +
        "        \"en\": \"Comment\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"orderCause\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"multi_line\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Основание для приказа\",\n" +
        "        \"en\": \"Authorizing document\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"orderText\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"multi_line\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Текст приказа\",\n" +
        "        \"en\": \"Body of the order\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"docOfficeData.docOfficeDataAddressees\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"description_script\": \"String title \\u003d entity.getInstanceName()\\r\\nString rowChar \\u003d title ? title.charAt(0).toUpperCase() : \\\"\\\"\\r\\nString description \\u003d \\\"\\u003crowIcon\\u003e\$rowChar\\u003c/rowIcon\\u003e\\\";\\r\\nif (title)\\r\\n    description +\\u003d \\\"\\u003cp\\u003e\\u003cb\\u003e\$title\\u003c/b\\u003e\\u003c/p\\u003e\\\"\\r\\nif (entity.officeContactPersonTo)\\r\\n    description +\\u003d \\\"\\u003cp\\u003e\$entity.officeContactPersonTo.instanceName\\u003c/p\\u003e\\\"\\r\\nreturn description \",\n" +
        "      \"composition_properties\": [\n" +
        "        {\n" +
        "          \"property\": \"addressee\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": true,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Адресат\",\n" +
        "            \"en\": \"Addressee\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"officeContactPersonTo\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": true,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Контактное лицо\",\n" +
        "            \"en\": \"Contact person\"\n" +
        "          }\n" +
        "        }\n" +
        "      ],\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Адресаты\",\n" +
        "        \"en\": \"Addressees\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"docOfficeData.sender\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Отправитель\",\n" +
        "        \"en\": \"Sender\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"signedBy\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Подписано кем\",\n" +
        "        \"en\": \"Signed by\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"project\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Проект\",\n" +
        "        \"en\": \"Project\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"availableForAll\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Документ доступен всем\",\n" +
        "        \"en\": \"Document is available for all\"\n" +
        "      }\n" +
        "    }\n" +
        "  ]\n" +
        "}"

def newContractSettingsJson = "{\n" +
        "  \"name\": \"Договор\",\n" +
        "  \"entity_name\": \"df\$Contract\",\n" +
        "  \"properties\": [\n" +
        "    {\n" +
        "      \"property\": \"cardInitiator\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Инициатор\",\n" +
        "        \"en\": \"Initiator\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"number\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"multi_line\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Номер\",\n" +
        "        \"en\": \"Number\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"date\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Дата\",\n" +
        "        \"en\": \"Date\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"organization\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Организация\",\n" +
        "        \"en\": \"Organization\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"department\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"query_filter\": \"e.organization.id \\u003d :organization\",\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Подразделение\",\n" +
        "        \"en\": \"Department\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"docCategory\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"query_filter\": \"(e.docKind.id \\u003d :kindId or e.docKind is null) and (e.docType.name\\u003d :entityName)\",\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Категория\",\n" +
        "        \"en\": \"Category\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"contractor\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Контрагент\",\n" +
        "        \"en\": \"Contractor\"\n" +
        "      },\n" +
        "      \"types_to_select\": [\n" +
        "        \"df\$Company\",\n" +
        "        \"df\$Individual\"\n" +
        "      ]\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"contactPerson\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"query_filter\": \"e.company.id \\u003d :contractor\",\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Конт. лицо контрагента\",\n" +
        "        \"en\": \"Contractor contact person\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"parentCard\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Основание\",\n" +
        "        \"en\": \"Parent card\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"active\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Активный\",\n" +
        "        \"en\": \"Active\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"owner\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Куратор\",\n" +
        "        \"en\": \"Owner\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"liabilityStart\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Начало обязательств\",\n" +
        "        \"en\": \"Liability starts\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"liabilityEnd\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Окончание обязательств\",\n" +
        "        \"en\": \"Liability ends\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"amount\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Сумма\",\n" +
        "        \"en\": \"Amount\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"currency\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Валюта\",\n" +
        "        \"en\": \"Currency\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"vatInclusive\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"НДС в сумме\",\n" +
        "        \"en\": \"VAT Included\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"vatRate\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Ставка НДС\",\n" +
        "        \"en\": \"VAT Rate\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"vatAmount\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Сумма НДС\",\n" +
        "        \"en\": \"VAT Amount\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"comment\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"multi_line\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Описание\",\n" +
        "        \"en\": \"Description\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"paymentConditions\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"multi_line\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Условия платежа\",\n" +
        "        \"en\": \"Payment conditions\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"project\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Проект\",\n" +
        "        \"en\": \"Project\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"availableForAll\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Договор доступен всем\",\n" +
        "        \"en\": \"Contract is available for all\"\n" +
        "      }\n" +
        "    }\n" +
        "  ]\n" +
        "}"

def newMeetingDocSettingsJson = "{\n" +
        "  \"name\": \"Совещание\",\n" +
        "  \"entity_name\": \"df\$MeetingDoc\",\n" +
        "  \"properties\": [\n" +
        "    {\n" +
        "      \"property\": \"status\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Статус\",\n" +
        "        \"en\": \"Status\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"number\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"multi_line\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Номер\",\n" +
        "        \"en\": \"Meeting ID\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"theme\",\n" +
        "      \"required\": true,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"multi_line\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Тема\",\n" +
        "        \"en\": \"Subject\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"target\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"multi_line\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Цель\",\n" +
        "        \"en\": \"Objective\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"organization\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Организация\",\n" +
        "        \"en\": \"Organization\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"department\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"query_filter\": \"e.organization.id \\u003d :organization\",\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Подразделение\",\n" +
        "        \"en\": \"Department\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"parentCard\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": true,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Основание\",\n" +
        "        \"en\": \"Parent card\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"docCategory\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"query_filter\": \"(e.docKind.id \\u003d :kindId or e.docKind is null) and (e.docType.name\\u003d :entityName)\",\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Категория\",\n" +
        "        \"en\": \"Category\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"dateTime\",\n" +
        "      \"required\": true,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Дата начала совещания\",\n" +
        "        \"en\": \"Date of the meeting\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"duration\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Длительность\",\n" +
        "        \"en\": \"Duration\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"timeUnit\",\n" +
        "      \"required\": true,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Ед. измерения длительности\",\n" +
        "        \"en\": \"Duration time unit\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"place\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"multi_line\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Место проведения\",\n" +
        "        \"en\": \"Place\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"secretary\",\n" +
        "      \"required\": true,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Секретарь\",\n" +
        "        \"en\": \"Secretary\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"chairman\",\n" +
        "      \"required\": true,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Председатель\",\n" +
        "        \"en\": \"Chairman\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"initiator\",\n" +
        "      \"required\": true,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Инициатор\",\n" +
        "        \"en\": \"Initiator\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"meetingComment\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"multi_line\": true,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Комментарий\",\n" +
        "        \"en\": \"Comment\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"availableForAll\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": true,\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Совещание доступно всем\",\n" +
        "        \"en\": \"Meeting doc is available for all\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"meetingQuestions\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": true,\n" +
        "      \"description_script\": \"import com.haulmont.cuba.core.global.AppBeans\\r\\nimport com.haulmont.cuba.core.global.Messages\\r\\nimport com.haulmont.thesis.core.entity.MeetingDoc\\r\\nimport com.haulmont.thesis.core.entity.MeetingQuestion\\r\\nimport org.apache.commons.lang.StringUtils\\r\\n\\r\\nMeetingQuestion mq \\u003d entity\\r\\ndef getMsg \\u003d { String str -\\u003e AppBeans.get(Messages.class).getMessage(MeetingDoc.class, str) }\\r\\ndef wrapParagraph \\u003d { String key, String value -\\u003e \\\"\\u003cp\\u003e\${(key ? getMsg(key) + \\\": \\\" : \\\"\\\") + value}\\u003c/p\\u003e\\\" }\\r\\n\\r\\nString description \\u003d wrapParagraph(null, \\\"\\u003cb\\u003e\$mq.question\\u003c/b\\u003e\\\")\\r\\nif (mq.speaker)\\r\\n    description +\\u003d wrapParagraph(\\\"MeetingQuestion.speaker\\\", \\\"\$mq.speaker.instanceName\\\")\\r\\nif (mq.durationString)\\r\\n    description +\\u003d wrapParagraph(\\\"MeetingQuestion.duration\\\", \\\"\$mq.durationString\\\")\\r\\nif (StringUtils.isNotBlank(mq.comment))\\r\\n    description +\\u003d wrapParagraph(\\\"MeetingQuestion.comment\\\", \\\"\$mq.comment\\\")\\r\\nreturn description;\",\n" +
        "      \"name_pattern\": \"\${question}\",\n" +
        "      \"composition_properties\": [\n" +
        "        {\n" +
        "          \"property\": \"number\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": true,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Номер\",\n" +
        "            \"en\": \"Number\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"question\",\n" +
        "          \"required\": true,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"multi_line\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Вопрос\",\n" +
        "            \"en\": \"Question\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"speaker\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Докладчик\",\n" +
        "            \"en\": \"Speaker\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"duration\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Длительность\",\n" +
        "            \"en\": \"Duration\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"timeUnit\",\n" +
        "          \"required\": true,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Ед. измерения длительности\",\n" +
        "            \"en\": \"Duration time unit\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"comment\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"multi_line\": true,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Комментарий\",\n" +
        "            \"en\": \"Comment\"\n" +
        "          }\n" +
        "        }\n" +
        "      ],\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Повестка\",\n" +
        "        \"en\": \"Agenda\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"solutions\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": true,\n" +
        "      \"description_script\": \"import com.haulmont.cuba.core.global.AppBeans\\r\\nimport com.haulmont.cuba.core.global.Messages\\r\\nimport com.haulmont.thesis.core.entity.Solution\\r\\nimport org.apache.commons.lang.StringUtils\\r\\nimport java.text.SimpleDateFormat\\r\\n\\r\\nSolution solution \\u003d entity;\\r\\ndef messages \\u003d AppBeans.get(Messages.class)\\r\\ndef getMsg \\u003d { String str -\\u003e messages.getMessage(Solution.class, str) }\\r\\ndef wrapParagraph \\u003d { String key, String value -\\u003e \\\"\\u003cp\\u003e\${(key ? getMsg(key) + \\\": \\\" : \\\"\\\") + value}\\u003c/p\\u003e\\\" }\\r\\n\\r\\ndef questionString \\u003d solution.question?.question\\r\\ndef solutionString \\u003d solution.task ? solution.task.taskName : StringUtils.trimToEmpty(solution.solution)\\r\\ndef executor \\u003d solution.task ? solution.task.executor?.instanceName : solution.executor?.instanceName\\r\\ndef comment \\u003d solution.comment\\r\\ndef dueDate \\u003d solution.task ? solution.task.finishDateTimePlan : solution.finishDatePlan\\r\\ndef dueDateString \\u003d dueDate ? new SimpleDateFormat(messages.getMainMessage(\\\"SolutionsDescriptionScript.dueDateFormat\\\")).format(dueDate) : null\\r\\n\\r\\nString description \\u003d \\\"\\\";\\r\\nif (solutionString)\\r\\n    description +\\u003d wrapParagraph(null, \\\"\\u003cb\\u003e\\\" + solutionString + \\\"\\u003c/b\\u003e\\\")\\r\\nif (questionString)\\r\\n    description +\\u003d wrapParagraph(\\\"Solution.question\\\", questionString)\\r\\nif (executor)\\r\\n    description +\\u003d wrapParagraph(\\\"Solution.executor\\\", executor)\\r\\nif (comment)\\r\\n    description +\\u003d wrapParagraph(\\\"Solution.comment\\\", comment)\\r\\nif (dueDateString)\\r\\n    description +\\u003d wrapParagraph(\\\"Solution.finishDatePlan\\\", dueDateString)\\r\\n\\r\\nreturn description\\r\\n\",\n" +
        "      \"view_name\": \"mobile-client-description\",\n" +
        "      \"name_pattern\": \"\${solution}\",\n" +
        "      \"composition_properties\": [\n" +
        "        {\n" +
        "          \"property\": \"question\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"query_filter\": \"e.meetingDoc.id \\u003d :cardId\",\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Вопрос\",\n" +
        "            \"en\": \"Question\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"solution\",\n" +
        "          \"required\": true,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"multi_line\": true,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Решение\",\n" +
        "            \"en\": \"Solution\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"initiator\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"query_filter\": \"e.active \\u003d true and exists(select ur from sec\$UserRole ur where ur.user.id \\u003d e.id and ur.deleteTs is null and ur.role.name \\u003d \\u0027task_initiator\\u0027)\",\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Инициатор\",\n" +
        "            \"en\": \"Initiator\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"executor\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"query_filter\": \"e.active \\u003d true and exists(select ur from sec\$UserRole ur where ur.user.id \\u003d e.id and ur.deleteTs is null and ur.role.name \\u003d \\u0027task_executor\\u0027)\",\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Исполнитель\",\n" +
        "            \"en\": \"Assignee\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"finishDatePlan\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Срок исполнения\",\n" +
        "            \"en\": \"Finish Date Plan\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"comment\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"multi_line\": true,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Комментарий\",\n" +
        "            \"en\": \"Comment\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"controller\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": true,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"query_filter\": \"e.active \\u003d true and exists(select ur from sec\$UserRole ur where ur.user.id \\u003d e.id and ur.deleteTs is null and ur.role.name \\u003d \\u0027task_controller\\u0027)\",\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Контролер\",\n" +
        "            \"en\": \"Reviewer\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"observer\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": true,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"query_filter\": \"e.active \\u003d true and exists(select ur from sec\$UserRole ur where ur.user.id \\u003d e.id and ur.deleteTs is null and ur.role.name \\u003d \\u0027task_observer\\u0027)\",\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Наблюдатель\",\n" +
        "            \"en\": \"Observer\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"project\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": true,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Проект\",\n" +
        "            \"en\": \"Main project\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"taskType\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": true,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Тип задачи\",\n" +
        "            \"en\": \"Task type\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"priority\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": true,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Приоритет задачи\",\n" +
        "            \"en\": \"Task priority\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"task\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": true,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"composition_properties\": [\n" +
        "            {\n" +
        "              \"property\": \"executor\",\n" +
        "              \"required\": false,\n" +
        "              \"readonly\": false,\n" +
        "              \"additional_info\": false,\n" +
        "              \"detailed_info\": false,\n" +
        "              \"loc_name\": {\n" +
        "                \"ru\": \"Исполнитель\",\n" +
        "                \"en\": \"Assignee\"\n" +
        "              }\n" +
        "            },\n" +
        "            {\n" +
        "              \"property\": \"finishDateTimePlan\",\n" +
        "              \"required\": false,\n" +
        "              \"readonly\": false,\n" +
        "              \"additional_info\": false,\n" +
        "              \"detailed_info\": false,\n" +
        "              \"loc_name\": {\n" +
        "                \"ru\": \"Выполнить до (время)\",\n" +
        "                \"en\": \"Due date (Time)\"\n" +
        "              }\n" +
        "            },\n" +
        "            {\n" +
        "              \"property\": \"finishDatePlan\",\n" +
        "              \"required\": false,\n" +
        "              \"readonly\": false,\n" +
        "              \"additional_info\": false,\n" +
        "              \"detailed_info\": false,\n" +
        "              \"loc_name\": {\n" +
        "                \"ru\": \"Выполнить до\",\n" +
        "                \"en\": \"Due date\"\n" +
        "              }\n" +
        "            },\n" +
        "            {\n" +
        "              \"property\": \"description\",\n" +
        "              \"required\": false,\n" +
        "              \"readonly\": false,\n" +
        "              \"additional_info\": false,\n" +
        "              \"detailed_info\": false,\n" +
        "              \"loc_name\": {\n" +
        "                \"ru\": \"Название\",\n" +
        "                \"en\": \"Description\"\n" +
        "              }\n" +
        "            },\n" +
        "            {\n" +
        "              \"property\": \"state\",\n" +
        "              \"required\": false,\n" +
        "              \"readonly\": false,\n" +
        "              \"additional_info\": false,\n" +
        "              \"detailed_info\": false,\n" +
        "              \"loc_name\": {\n" +
        "                \"ru\": \"Состояние\",\n" +
        "                \"en\": \"State\"\n" +
        "              }\n" +
        "            }\n" +
        "          ],\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Задача\",\n" +
        "            \"en\": \"Task\"\n" +
        "          }\n" +
        "        }\n" +
        "      ],\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Решения\",\n" +
        "        \"en\": \"Solutions\"\n" +
        "      }\n" +
        "    },\n" +
        "    {\n" +
        "      \"property\": \"participants\",\n" +
        "      \"required\": false,\n" +
        "      \"readonly\": false,\n" +
        "      \"additional_info\": false,\n" +
        "      \"detailed_info\": false,\n" +
        "      \"description_script\": \"import com.haulmont.cuba.core.global.AppBeans\\r\\nimport com.haulmont.cuba.core.global.Messages\\r\\nimport com.haulmont.thesis.core.entity.MeetingParticipant\\r\\nimport com.haulmont.thesis.core.entity.TsUser\\r\\n\\r\\nMeetingParticipant participant \\u003d entity\\r\\ndef messages \\u003d AppBeans.get(Messages.class)\\r\\nTsUser participantUser \\u003d participant.user as TsUser\\r\\nString avatarId \\u003d participantUser?.employees ? participantUser.employees[0].mobileAvatar?.id?.toString() : \\\"\\\"\\r\\n\\r\\nString type;\\r\\nif (participant.user)\\r\\n    type \\u003d messages.getMainMessage(\\\"ParticipantsDescriptionScript.employee\\\")\\r\\nelse if (participant.contractor || participant.contactPerson)\\r\\n    type \\u003d messages.getMainMessage(\\\"ParticipantsDescriptionScript.contractor\\\")\\r\\nelse\\r\\n    type \\u003d messages.getMainMessage(\\\"ParticipantsDescriptionScript.external\\\")\\r\\n\\r\\ndef description \\u003d \\\"\\u003crowIcon\\u003e\\u003cavatar\\u003e\$avatarId\\u003c/avatar\\u003e\\u003c/rowIcon\\u003e \\u003cp\\u003e\$type\\u003c/p\\u003e \\u003cp\\u003e\\u003cb\\u003e\$participant.instanceName\\u003c/b\\u003e\\u003c/p\\u003e\\\"\\r\\nreturn description as String;\",\n" +
        "      \"view_name\": \"edit\",\n" +
        "      \"name_pattern\": \"\${user}\",\n" +
        "      \"composition_properties\": [\n" +
        "        {\n" +
        "          \"property\": \"user\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": false,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Сотрудник\",\n" +
        "            \"en\": \"User\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"outer\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": true,\n" +
        "          \"additional_info\": false,\n" +
        "          \"multi_line\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Имя\",\n" +
        "            \"en\": \"Name\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"email\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": true,\n" +
        "          \"additional_info\": false,\n" +
        "          \"multi_line\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Email\",\n" +
        "            \"en\": \"Email\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"contractor\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": true,\n" +
        "          \"additional_info\": false,\n" +
        "          \"detailed_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Контрагент\",\n" +
        "            \"en\": \"Contractor\"\n" +
        "          }\n" +
        "        },\n" +
        "        {\n" +
        "          \"property\": \"contactPerson\",\n" +
        "          \"required\": false,\n" +
        "          \"readonly\": true,\n" +
        "          \"additional_info\": false,\n" +
        "          \"loc_name\": {\n" +
        "            \"ru\": \"Контактное лицо\",\n" +
        "            \"en\": \"Contact person\"\n" +
        "          }\n" +
        "        }\n" +
        "      ],\n" +
        "      \"loc_name\": {\n" +
        "        \"ru\": \"Участники\",\n" +
        "        \"en\": \"Members\"\n" +
        "      }\n" +
        "    }\n" +
        "  ]\n" +
        "}"


postUpdate.add({
    def settingsInitializer = AppBeans.get(MobileRestSettingsInitializer.class)
    def mobileClientMetadataManager = AppBeans.get(MobileClientMetadataManager.class)

    def taskMetadataPayload = settingsInitializer.parseCardMetadataPayloadFromJson(newTaskSettingsJson)
    def simpleDocMetadataPayload = settingsInitializer.parseCardMetadataPayloadFromJson(newDocSettingsJson)
    def contractMetadataPayload = settingsInitializer.parseCardMetadataPayloadFromJson(newContractSettingsJson)
    def meetingDocMetadataPayload = settingsInitializer.parseCardMetadataPayloadFromJson(newMeetingDocSettingsJson)

    def explicitlyRemovedProperties = ["df\$Contract"  : ["amountString"],
                                       "df\$MeetingDoc": ["durationString"]]

    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {

            // update folder setting
            def config = em.createQuery("select c from sys\$Config c " +
                    "where c.name = 'thesis.mobile.hiddenAppFolders'", Config.class).getFirstResult()
            if (config != null && config.value) {
                config.value = config.value.replaceAll("AppFolder_doc.new\\|?", "")
                if (!config.value.contains("AppFolder_doc.edmReceived"))
                    config.value = config.value + "|AppFolder_doc.edmReceived"
                if (!config.value.contains("AppFolder_doc.edmSending"))
                    config.value = config.value + "|AppFolder_doc.edmSending"
            }

            for (CardMetadataPayload payload : [taskMetadataPayload, simpleDocMetadataPayload,
                                                contractMetadataPayload, meetingDocMetadataPayload]) {

                CardMobileClientMetadata cardMobileClientMetadata = em.createQuery(
                        "select m from ts\$CardMobileClientMetadata m where m.entityName = :entityName",
                        CardMobileClientMetadata.class)
                        .setParameter("entityName", payload.getEntityName())
                        .getFirstResult();
                if (cardMobileClientMetadata != null) {
                    def existingProperties = mobileClientMetadataManager.parsePropertiesAndCalculatePropertyAttributes(
                            cardMobileClientMetadata)

                    def propertiesNotExistingInNewSettings = existingProperties.findAll { prop ->
                        !payload.getProperties().find { newProp -> newProp.property?.equals(prop.property) } &&
                                (explicitlyRemovedProperties.get(payload.entityName) == null ||
                                        !explicitlyRemovedProperties.get(payload.entityName).contains(prop.property))
                    }

                    payload.getProperties().each { newProperty ->
                        def existingProperty = existingProperties.find { existingProperty ->
                            existingProperty.property?.equals(newProperty.property)
                        }

                        if (existingProperty != null) {
                            newProperty.required = existingProperty.required || newProperty.required
                            newProperty.detailedInfo = existingProperty.detailedInfo
                        }
                    }

                    payload.getProperties().addAll(propertiesNotExistingInNewSettings)
                    String propertiesString = mobileClientMetadataManager.convertCardPropertiesToJson(payload.getProperties())
                    cardMobileClientMetadata.setProperties(propertiesString)
                }
            }
        }
    })

    AppBeans.get(ConfigStorageAPI.class).clearCache()
})