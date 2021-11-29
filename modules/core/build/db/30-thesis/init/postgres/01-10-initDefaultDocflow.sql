CREATE OR REPLACE FUNCTION baseInsert()
RETURNS integer
AS $$
DECLARE
cnt integer = 0;
initDefaultInFirstStart boolean;
BEGIN

cnt = (select count(id) from DF_TYPICAL_RESOLUTION where name = 'На рассмотрение:');
if(cnt = 0) then
insert into DF_TYPICAL_RESOLUTION (id, create_ts, created_by, substituted_creator_id, version, name, text, global)
values (newid(), now(), USER, 'b18e3c10-0328-11e2-969a-fb0e8fd8c622', 1, 'На рассмотрение:', 'На рассмотрение:', TRUE);
end if;

cnt = (select count(id) from DF_TYPICAL_RESOLUTION where name = 'Ознакомить:');
if(cnt = 0) then
insert into DF_TYPICAL_RESOLUTION (id, create_ts, created_by, substituted_creator_id, version, name, text, global)
values (newid(), now(), USER, 'b18e3c10-0328-11e2-969a-fb0e8fd8c622', 1, 'Ознакомить:', 'Ознакомить:', TRUE);
end if;

cnt = (select count(id) from DF_NUMERATOR where id = 'bebc21e2-fce0-40c6-9202-7cffff7cf88e');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script)
values ('bebc21e2-fce0-40c6-9202-7cffff7cf88e', now(), USER, 1, 'Входящий',
'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
String numPrefix = "ВХ-"
if(binding.variables.containsKey("doc")) {
com.haulmont.thesis.core.entity.Department department = doc.getDepartment()
if (department && department.getCode()) {
   numPrefix += department.getCode() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("income")).padLeft(5, "0")'
);
end if;

cnt = (select count(id) from DF_NUMERATOR where id = '5618547c-a4c9-4bfd-a71e-d884cf49df57');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script)
values ('5618547c-a4c9-4bfd-a71e-d884cf49df57', now(), USER, 1, 'Исходящий',
'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
String numPrefix = "ИСХ-"
if(binding.variables.containsKey("doc")) {
com.haulmont.thesis.core.entity.Department department = doc.getDepartment()
if (department && department.getCode()) {
   numPrefix += department.getCode() + "-"
}
}
if(binding.variables.containsKey("docOfficeData")) {
com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
   numPrefix += officeFile.getNomenclature().getIndex() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("outcome")).padLeft(5, "0")'
);
end if;

cnt = (select count(id) from DF_NUMERATOR where id = '36708c7f-e232-4451-a239-3f5a8fa10726');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script)
values ('36708c7f-e232-4451-a239-3f5a8fa10726', now(), USER, 1, 'Внутренний',
'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
String numPrefix = ""
if(binding.variables.containsKey("doc")) {
com.haulmont.thesis.core.entity.DocKind docKind = doc.getDocKind()
if (docKind && docKind.getPrefix()) {
   numPrefix = docKind.getPrefix() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("internal")).padLeft(5, "0")'
);
end if;



--Insert by DocKind--
cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = '9cd678e3-7978-4f53-a503-a36bce3a76d6');
if(cnt = 0) then
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('9cd678e3-7978-4f53-a503-a36bce3a76d6', 'Договор', 'df$Contract', false, now(), USER, 1, 1);

insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml,
numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
values ('9cd678e3-7978-4f53-a503-a36bce3a76d6', '2010-10-28 00:00:00.00', 'admin', 1, 'ae67f5f6-35aa-11df-a04a-3345dd531def',
'<?xml version="1.0" encoding="UTF-8"?>

<fields>
<field name="addressee" visible="true" required="false"/>
<field name="active" visible="true" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="true" required="false"/>
<field name="attachments" visible="true" required="false"/>
<field name="dateTime" visible="true" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="false" required="false"/>
<field name="createDate" visible="true" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="currency" visible="true" required="false"/>
<field name="comment" visible="true" required="false"/>
<field name="officeContactPersonTo" visible="true" required="false"/>
<field name="contactPerson" visible="true" required="false"/>
<field name="contractor" visible="true" required="false"/>
<field name="owner" visible="true" required="false"/>
<field name="vatInclusive" visible="true" required="false"/>
<field name="assignments" visible="true" required="false"/>
<field name="liabilityStart" visible="true" required="false"/>
<field name="organization" visible="true" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="liabilityEnd" visible="true" required="false"/>
<field name="parentCard" visible="true" required="false"/>
<field name="sender" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="true" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="vatRate" visible="true" required="false"/>
<field name="amount" visible="true" required="false"/>
<field name="vatAmount" visible="true" required="false"/>
<field name="paymentConditions" visible="true" required="false"/>
<field name="availableForAll" visible="false" required="false"/>
<field name="resolution" visible="false" required="false"/>
</fields>'
, 1, 1, 'Доп. поля', false, false, false);
end if;

cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = 'c40ea551-d399-4a11-b6be-347ca5f27837');
if(cnt = 0) then
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('c40ea551-d399-4a11-b6be-347ca5f27837', 'Письмо', 'df$SimpleDoc', false, now(), USER, 1, 1);

insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
values ('c40ea551-d399-4a11-b6be-347ca5f27837', '2010-10-28 00:00:00.00', 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', true,
'<?xml version="1.0" encoding="UTF-8"?>

<fields>
<field name="addressee" visible="true" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="true" required="false"/>
<field name="attachments" visible="true" required="false"/>
<field name="dateTime" visible="true" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="true" required="false"/>
<field name="createDate" visible="true" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="comment" visible="true" required="false"/>
<field name="officeContactPersonTo" visible="true" required="false"/>
<field name="owner" visible="true" required="false"/>
<field name="assignments" visible="true" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="parentCard" visible="true" required="false"/>
<field name="sender" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="true" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="availableForAll" visible="false" required="false"/>
<field name="theme" visible="true" required="false"/>
<field name="orderCause" visible="false" required="false"/>
<field name="orderText" visible="false" required="false"/>
<field name="organization" visible="true" required="false"/>
<field name="docSender" visible="false" required="false"/>
<field name="docReceiver" visible="false" required="false"/>
<field name="docCopyReceiver" visible="false" required="false"/>
<field name="contractor" visible="false" required="false"/>
</fields>'
, 1, 1, 'Доп. поля', false, false, false);
end if;

cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = '3c59f74c-fe98-11e2-9e49-a30cc182d375');
if(cnt = 0) then
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('3c59f74c-fe98-11e2-9e49-a30cc182d375', 'Дополнительное соглашение', 'df$Contract', false, now(), USER, 1, 1);

insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml, numerator_type,
category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
values ('3c59f74c-fe98-11e2-9e49-a30cc182d375', '2010-10-28 00:00:00.00', 'admin', 1, 'ae67f5f6-35aa-11df-a04a-3345dd531def',
'<?xml version="1.0" encoding="UTF-8"?>

<fields>
<field name="addressee" visible="true" required="false"/>
<field name="active" visible="true" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="true" required="false"/>
<field name="attachments" visible="true" required="false"/>
<field name="dateTime" visible="true" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="false" required="false"/>
<field name="createDate" visible="true" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="currency" visible="true" required="false"/>
<field name="comment" visible="true" required="false"/>
<field name="officeContactPersonTo" visible="true" required="false"/>
<field name="contactPerson" visible="true" required="false"/>
<field name="contractor" visible="true" required="false"/>
<field name="owner" visible="true" required="false"/>
<field name="vatInclusive" visible="true" required="false"/>
<field name="assignments" visible="true" required="false"/>
<field name="liabilityStart" visible="true" required="false"/>
<field name="organization" visible="true" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="liabilityEnd" visible="true" required="false"/>
<field name="parentCard" visible="true" required="true"/>
<field name="sender" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="true" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="vatRate" visible="true" required="false"/>
<field name="amount" visible="true" required="false"/>
<field name="vatAmount" visible="true" required="false"/>
<field name="paymentConditions" visible="true" required="false"/>
<field name="availableForAll" visible="false" required="false"/>
<field name="resolution" visible="false" required="false"/>
</fields>'
, 1, 1, 'Доп. поля', false, false, false);
end if;

cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = '648a5b6c-fe98-11e2-89ed-635286aa63eb');
if(cnt = 0) then
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('648a5b6c-fe98-11e2-89ed-635286aa63eb', 'Приложение к договору', 'df$Contract', false, now(), USER, 1, 1);

insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml, numerator_type,
category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
values ('648a5b6c-fe98-11e2-89ed-635286aa63eb', '2010-10-28 00:00:00.00', 'admin', 1, 'ae67f5f6-35aa-11df-a04a-3345dd531def',
'<?xml version="1.0" encoding="UTF-8"?>

<fields>
<field name="addressee" visible="true" required="false"/>
<field name="active" visible="true" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="true" required="false"/>
<field name="attachments" visible="true" required="false"/>
<field name="dateTime" visible="true" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="false" required="false"/>
<field name="createDate" visible="true" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="currency" visible="true" required="false"/>
<field name="comment" visible="true" required="false"/>
<field name="officeContactPersonTo" visible="true" required="false"/>
<field name="contactPerson" visible="true" required="false"/>
<field name="contractor" visible="true" required="false"/>
<field name="owner" visible="true" required="false"/>
<field name="vatInclusive" visible="true" required="false"/>
<field name="assignments" visible="true" required="false"/>
<field name="liabilityStart" visible="true" required="false"/>
<field name="organization" visible="true" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="liabilityEnd" visible="true" required="false"/>
<field name="parentCard" visible="true" required="true"/>
<field name="sender" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="true" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="vatRate" visible="true" required="false"/>
<field name="amount" visible="true" required="false"/>
<field name="vatAmount" visible="true" required="false"/>
<field name="paymentConditions" visible="true" required="false"/>
<field name="availableForAll" visible="false" required="false"/>
<field name="resolution" visible="false" required="false"/>
</fields>'
, 1, 1, 'Доп. поля', false, false, false);
end if;

cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = '34370700-fe69-11e2-9d98-abe6f3d1eedc');
if(cnt = 0) then
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('34370700-fe69-11e2-9d98-abe6f3d1eedc', 'Приказ', 'df$SimpleDoc', false, now(), USER, 1, 1);

insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
values ('34370700-fe69-11e2-9d98-abe6f3d1eedc', now(), 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', true,
'<?xml version="1.0" encoding="UTF-8"?>

<fields>
<field name="addressee" visible="false" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="false" required="false"/>
<field name="attachments" visible="false" required="false"/>
<field name="dateTime" visible="false" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="true" required="false"/>
<field name="createDate" visible="false" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="comment" visible="false" required="false"/>
<field name="officeContactPersonTo" visible="false" required="false"/>
<field name="owner" visible="false" required="false"/>
<field name="assignments" visible="false" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="sender" visible="true" required="false"/>
<field name="parentCard" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="false" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="availableForAll" visible="false" required="false"/>
<field name="theme" visible="true" required="false"/>
<field name="orderCause" visible="true" required="false"/>
<field name="orderText" visible="true" required="false"/>
<field name="organization" visible="true" required="false"/>
<field name="docSender" visible="false" required="false"/>
<field name="docReceiver" visible="false" required="false"/>
<field name="docCopyReceiver" visible="false" required="false"/>
<field name="contractor" visible="false" required="false"/>
</fields>'
, 1, 1, 'Доп. поля', false, false, false);
end if;

cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = '24e40c08-fe87-11e2-8c8a-3354b77dcb1f');
if(cnt = 0) then
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('24e40c08-fe87-11e2-8c8a-3354b77dcb1f', 'Служебная записка', 'df$SimpleDoc', false, now(), USER, 1, 1);

insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
values ('24e40c08-fe87-11e2-8c8a-3354b77dcb1f', now(), 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', true,
'<?xml version="1.0" encoding="UTF-8"?>

<fields>
<field name="addressee" visible="false" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="false" required="false"/>
<field name="attachments" visible="false" required="false"/>
<field name="dateTime" visible="false" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="true" required="false"/>
<field name="createDate" visible="false" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="comment" visible="true" required="false"/>
<field name="officeContactPersonTo" visible="false" required="false"/>
<field name="owner" visible="false" required="false"/>
<field name="assignments" visible="false" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="sender" visible="true" required="false"/>
<field name="parentCard" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="false" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="availableForAll" visible="false" required="false"/>
<field name="theme" visible="true" required="false"/>
<field name="orderCause" visible="false" required="false"/>
<field name="orderText" visible="false" required="false"/>
<field name="organization" visible="true" required="false"/>
<field name="docSender" visible="true" required="false"/>
<field name="docReceiver" visible="true" required="false"/>
<field name="docCopyReceiver" visible="true" required="false"/>
<field name="contractor" visible="false" required="false"/>
</fields>'
, 1, 1, 'Доп. поля', false, false, false);
end if;

cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = '44f912b6-fe8e-11e2-a6b7-5bb93c75e36b');
if(cnt = 0) then
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('44f912b6-fe8e-11e2-a6b7-5bb93c75e36b', 'Регламент', 'df$SimpleDoc', false, now(), USER, 1, 1);

insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
values ('44f912b6-fe8e-11e2-a6b7-5bb93c75e36b', now(), 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', true,
'<?xml version="1.0" encoding="UTF-8"?>

<fields>
<field name="addressee" visible="false" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="false" required="false"/>
<field name="attachments" visible="false" required="false"/>
<field name="dateTime" visible="false" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="true" required="false"/>
<field name="createDate" visible="false" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="comment" visible="true" required="false"/>
<field name="officeContactPersonTo" visible="false" required="false"/>
<field name="owner" visible="false" required="false"/>
<field name="assignments" visible="false" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="parentCard" visible="true" required="false"/>
<field name="sender" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="false" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="availableForAll" visible="false" required="false"/>
<field name="theme" visible="true" required="false"/>
<field name="orderCause" visible="false" required="false"/>
<field name="orderText" visible="false" required="false"/>
<field name="organization" visible="true" required="false"/>
<field name="docSender" visible="false" required="false"/>
<field name="docReceiver" visible="false" required="false"/>
<field name="docCopyReceiver" visible="false" required="false"/>
<field name="contractor" visible="false" required="false"/>
</fields>'
, 1, 1, 'Доп. поля', false, false, false);
end if;

cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = '7f1b0314-fe8e-11e2-85d5-f7a577d85b9f');
if(cnt = 0) then
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('7f1b0314-fe8e-11e2-85d5-f7a577d85b9f', 'Инструкция', 'df$SimpleDoc', false, now(), USER, 1, 1);

insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
values ('7f1b0314-fe8e-11e2-85d5-f7a577d85b9f', now(), 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', true,
'<?xml version="1.0" encoding="UTF-8"?>

<fields>
<field name="addressee" visible="false" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="false" required="false"/>
<field name="attachments" visible="false" required="false"/>
<field name="dateTime" visible="false" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="true" required="false"/>
<field name="createDate" visible="false" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="comment" visible="true" required="false"/>
<field name="officeContactPersonTo" visible="false" required="false"/>
<field name="owner" visible="false" required="false"/>
<field name="assignments" visible="false" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="parentCard" visible="true" required="false"/>
<field name="sender" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="false" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="availableForAll" visible="false" required="false"/>
<field name="theme" visible="true" required="false"/>
<field name="orderCause" visible="false" required="false"/>
<field name="orderText" visible="false" required="false"/>
<field name="organization" visible="true" required="false"/>
<field name="docSender" visible="false" required="false"/>
<field name="docReceiver" visible="false" required="false"/>
<field name="docCopyReceiver" visible="false" required="false"/>
<field name="contractor" visible="false" required="false"/>
</fields>'
, 1, 1, 'Доп. поля', false, false, false);
end if;

cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = '9415792f-c473-cbeb-d150-8ae687c4dcd2');
if(cnt = 0) then
    insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
    values ('9415792f-c473-cbeb-d150-8ae687c4dcd2', 'Совещание', 'df$MeetingDoc', false, now(), USER, 1, 1);

    insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml,
    numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
    values ('9415792f-c473-cbeb-d150-8ae687c4dcd2', '2015-05-01 00:00:00.00', 'admin', 1, '5aa5ef34-af44-11df-b1c6-af3783a11da6',
    '<?xml version="1.0" encoding="UTF-8"?>

     <fields>
       <field name="responseToDoc" visible="true" required="false" signed="false"/>
       <field name="dateTime" visible="true" required="true" signed="false"/>
       <field name="duration" visible="true" required="false" signed="false"/>
       <field name="availableForAll" visible="false" required="false" signed="false"/>
       <field name="initiator" visible="true" required="true" signed="false"/>
       <field name="officeExecutor" visible="true" required="false" signed="false"/>
       <field name="employeeExecutor" visible="true" required="false" signed="false"/>
       <field name="docCategory" visible="true" required="false" signed="false"/>
       <field name="owner" visible="true" required="false" signed="false"/>
       <field name="place" visible="true" required="false" signed="false"/>
       <field name="name" visible="true" required="true" signed="false"/>
       <field name="number" visible="true" required="false" signed="false"/>
       <field name="organization" visible="true" required="false" signed="false"/>
       <field name="parentCard" visible="true" required="false" signed="false"/>
       <field name="sender" visible="true" required="false" signed="false"/>
       <field name="meetingQuestions" visible="true" required="false" signed="false"/>
       <field name="officeSignedBy" visible="true" required="false" signed="false"/>
       <field name="department" visible="true" required="false" signed="false"/>
       <field name="postTrackingNumber" visible="true" required="false" signed="false"/>
       <field name="chairman" visible="true" required="true" signed="false"/>
       <field name="projects" visible="false" required="false" signed="false"/>
       <field name="resolution" visible="true" required="false" signed="false"/>
       <field name="solutions" visible="true" required="false" signed="false"/>
       <field name="secretary" visible="true" required="true" signed="false"/>
       <field name="comment" visible="true" required="false" signed="false"/>
       <field name="receivingMethod" visible="true" required="false" signed="false"/>
       <field name="finishDatePlan" visible="true" required="false" signed="false"/>
       <field name="theme" visible="true" required="true" signed="false"/>
       <field name="members" visible="true" required="false" signed="false"/>
       <field name="target" visible="true" required="false" signed="false"/>
       <field name="parentCardAccess" visible="false" required="false" signed="false"/>
       <field name="contractor" visible="false" required="false" signed="false"/>
     </fields>'
    , 1, 1, 'Доп. поля', false, false, false);
end if;

cnt = (select count(id) from DF_CATEGORY where id = '56a88e8c-6ab2-427a-97fc-5897005fe8a1');
if(cnt = 0) then
insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('56a88e8c-6ab2-427a-97fc-5897005fe8a1', '2010-10-28 00:00:00.00', 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 'Основная');
end if;

cnt = (select count(id) from DF_CATEGORY where id = 'ce1e9051-ca5c-4341-a523-74c694a9635d');
if(cnt = 0) then
insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('ce1e9051-ca5c-4341-a523-74c694a9635d', '2013-10-02 00:00:00.00', 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 'Основной вид деятельности');
end if;

cnt = (select count(id) from DF_CATEGORY where id = 'fa88ac80-13ea-486b-b247-602818672fe5');
if(cnt = 0) then
insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('fa88ac80-13ea-486b-b247-602818672fe5', '2013-10-02 00:00:00.00', 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 'Административно-хозяйственная деятельность');
end if;

cnt = (select count(id) from DF_CATEGORY where id = '196fb6fc-efad-4143-808f-248d727d91f7');
if(cnt = 0) then
insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('196fb6fc-efad-4143-808f-248d727d91f7', '2013-10-02 00:00:00.00', 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 'По кадрам');
end if;

cnt = (select count(id) from DF_ORGANIZATION where id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
if(cnt = 0) then
insert into DF_ORGANIZATION (id, create_ts, created_by, version, name, has_attachments) values ('a851beaf-6890-4ab2-b847-b7a810c4c2b9', '2010-10-28 00:00:00.00', 'admin', 1, 'Наша организация', false);
update sec_user set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
update df_category set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
update DF_TYPICAL_RESOLUTION set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
update TM_PROJECT_GROUP set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
end if;

cnt = (select count(id) from DF_DOC_RECEIVING_METHOD where id = 'ba3e811b-f0dc-4cc8-a119-4e76ff5555b9');
if(cnt = 0) then
insert into DF_DOC_RECEIVING_METHOD (id, create_ts, created_by, version, name) values ('ba3e811b-f0dc-4cc8-a119-4e76ff5555b9', '2010-10-28 00:00:00.00', 'admin', 1, 'Почтовая доставка');
end if;

cnt = (select count(id) from DF_OFFICE_FILE_NOMENCLATURE where id = '301f91e9-2968-4fc6-ba4e-e3a3ea09d46c');
if(cnt = 0) then
insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('301f91e9-2968-4fc6-ba4e-e3a3ea09d46c', '2010-10-28 00:00:00.00', 'admin', 1, 'Входящие', 2021, FALSE, 1, 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
end if;

cnt = (select count(id) from DF_OFFICE_FILE_NOMENCLATURE where id = 'd32b5d42-e202-4df5-89ee-9d6111d6d637');
if(cnt = 0) then
insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('d32b5d42-e202-4df5-89ee-9d6111d6d637', '2010-10-28 00:00:00.00', 'admin', 1, 'Исходящие', 2021, FALSE, 1, 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
end if;

cnt = (select count(id) from DF_OFFICE_FILE_NOMENCLATURE where id = '159ab5b8-fb54-4ea6-a6ba-b485fb885010');
if(cnt = 0) then
insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('159ab5b8-fb54-4ea6-a6ba-b485fb885010', '2010-10-28 00:00:00.00', 'admin', 1, 'Внутренние', 2021, FALSE, 1, 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = '215c66b8-ef2e-6608-bd5d-59c3bae94e5e');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script_enabled,numerator_format, periodicity, number_initial_value ) values ('215c66b8-ef2e-6608-bd5d-59c3bae94e5e', '2010-10-28 00:00:00.00', 'admin', 1, 'Совещания',
false,'[number(5)]','Y',1);
end if;

cnt = (select count(id) from DF_NUMERATOR where id = 'b3997576-456d-49e8-964a-24a247d4753d');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('b3997576-456d-49e8-964a-24a247d4753d', '2010-10-28 00:00:00.00', 'admin', 1, 'Документы и договоры',
'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
String numPrefix = ""
if(binding.variables.containsKey("docOfficeData")) {
com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
   numPrefix = officeFile.getNomenclature().getIndex() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("innernumbers")).padLeft(5, "0")');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = 'c91d9e66-0034-11e3-8ca5-3f77160974ff');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('c91d9e66-0034-11e3-8ca5-3f77160974ff', '2010-10-28 00:00:00.00', 'admin', 1, 'Приложение к договору',
E'import com.haulmont.cuba.core.app.DataService
import com.haulmont.cuba.core.global.LoadContext
import com.haulmont.thesis.core.entity.Doc
import com.haulmont.thesis.core.entity.DocOfficeData
import org.apache.commons.lang.StringUtils
import org.apache.commons.lang.math.NumberUtils

DataService dataService = com.haulmont.cuba.core.global.AppBeans.get(DataService.NAME);
String numPrefix = "";

if (binding.variables.containsKey("docOfficeData")) {
    com.haulmont.thesis.core.entity.OfficeFile officeFile = ((DocOfficeData) binding.getProperty("docOfficeData")).getOfficeFile();
    if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
        numPrefix = officeFile.getNomenclature().getIndex() + "-"
    }
}

LoadContext<Doc> ctx = new LoadContext<>(Doc.class);
ctx.setQueryString("""select doc1 from df\\$Doc doc1 where doc1.docKind.id=:docKindId
       and doc1.parentCard.id=:parentCardId and doc1.parentCard is not null and doc1.id<>:exclId and doc1.templateName is null and doc1.versionOf is null""");
ctx.getQuery().setParameter("docKindId",binding.getVariable("entity").getDocKind())
        .setParameter("parentCardId",binding.getVariable("entity").getParentCard())
        .setParameter("exclId",binding.getVariable("entity").getId());
List<Doc> docs = dataService.loadList(ctx);

String currentNumberStr = null;
Integer currentNumber = 0;
Integer maxNumber = 0;

for (int i=1; i <= docs.size(); i++) {
    currentNumberStr = docs.get(i-1).getNumber();
    currentNumberStr = currentNumberStr.substring(currentNumberStr.lastIndexOf("-") + 1);

    if (NumberUtils.isDigits(currentNumberStr)) {
        currentNumber = Integer.parseInt(currentNumberStr);
        if (maxNumber < currentNumber) {
            maxNumber = currentNumber;
        }
    }
}
return (numPrefix + (maxNumber + 1)).padLeft(5, "0");');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = 'f31de086-0034-11e3-b761-873aa0372209');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('f31de086-0034-11e3-b761-873aa0372209', '2010-10-28 00:00:00.00', 'admin', 1, 'Дополнительное соглашение',
E'import com.haulmont.cuba.core.app.DataService
import com.haulmont.cuba.core.global.LoadContext
import com.haulmont.thesis.core.entity.Doc
import com.haulmont.thesis.core.entity.DocOfficeData
import org.apache.commons.lang.StringUtils
import org.apache.commons.lang.math.NumberUtils

DataService dataService = com.haulmont.cuba.core.global.AppBeans.get(DataService.NAME);
String numPrefix = "";

if (binding.variables.containsKey("docOfficeData")) {
    com.haulmont.thesis.core.entity.OfficeFile officeFile = ((DocOfficeData) binding.getProperty("docOfficeData")).getOfficeFile();
    if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
        numPrefix = officeFile.getNomenclature().getIndex() + "-"
    }
}

LoadContext<Doc> ctx = new LoadContext<>(Doc.class);
ctx.setQueryString("""select doc1 from df\\$Doc doc1 where doc1.docKind.id=:docKindId
       and doc1.parentCard.id=:parentCardId and doc1.parentCard is not null and doc1.id<>:exclId and doc1.templateName is null and doc1.versionOf is null""");
ctx.getQuery().setParameter("docKindId",binding.getVariable("entity").getDocKind())
        .setParameter("parentCardId",binding.getVariable("entity").getParentCard())
        .setParameter("exclId",binding.getVariable("entity").getId());
List<Doc> docs = dataService.loadList(ctx);

String currentNumberStr = null;
Integer currentNumber = 0;
Integer maxNumber = 0;

for (int i=1; i <= docs.size(); i++) {
    currentNumberStr = docs.get(i-1).getNumber();
    currentNumberStr = currentNumberStr.substring(currentNumberStr.lastIndexOf("-") + 1);

    if (NumberUtils.isDigits(currentNumberStr)) {
        currentNumber = Integer.parseInt(currentNumberStr);
        if (maxNumber < currentNumber) {
            maxNumber = currentNumber;
        }
    }
}
return (numPrefix + (maxNumber + 1)).padLeft(5, "0");');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = '70dfe954-fe9d-11e2-96e0-1f9c56fc4e22');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('70dfe954-fe9d-11e2-96e0-1f9c56fc4e22', '2010-10-28 00:00:00.00', 'admin', 1, 'Письмо',
'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
String numPrefix = ""
if (binding.variables.containsKey("docOfficeData")) {
    com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
    if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
        numPrefix = officeFile.getNomenclature().getIndex() + "-"
    }
}
return numPrefix + String.valueOf(un.getNextNumber("letternumbers")).padLeft(5, "0")');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = 'ab30b1b4-fe9e-11e2-9003-c79b48b9667d');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('ab30b1b4-fe9e-11e2-9003-c79b48b9667d', '2010-10-28 00:00:00.00', 'admin', 1, 'Приказ',
'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
String numPrefix = ""
if (binding.variables.containsKey("docOfficeData")) {
    com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
    if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
        numPrefix = officeFile.getNomenclature().getIndex() + "-"
    }
}
return numPrefix + String.valueOf(un.getNextNumber("ordernumbers")).padLeft(5, "0")');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = 'b8ee4d84-fe9e-11e2-8a75-2ff0c334cf13');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('b8ee4d84-fe9e-11e2-8a75-2ff0c334cf13', '2010-10-28 00:00:00.00', 'admin', 1, 'Регламент',
'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
String numPrefix = ""
if (binding.variables.containsKey("docOfficeData")) {
    com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
    if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
        numPrefix = officeFile.getNomenclature().getIndex() + "-"
    }
}
return numPrefix + String.valueOf(un.getNextNumber("regulationsnumbers")).padLeft(5, "0")');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = 'c3b2f4a4-fe9e-11e2-a39a-83fe0d6b8db7');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('c3b2f4a4-fe9e-11e2-a39a-83fe0d6b8db7', '2010-10-28 00:00:00.00', 'admin', 1, 'Инструкция',
'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
String numPrefix = ""
if (binding.variables.containsKey("docOfficeData")) {
    com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
    if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
        numPrefix = officeFile.getNomenclature().getIndex() + "-"
    }
}
return numPrefix + String.valueOf(un.getNextNumber("instructionnumbers")).padLeft(5, "0")');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = 'd062c9f4-fe9e-11e2-a3fc-cf13c8fd96f7');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('d062c9f4-fe9e-11e2-a3fc-cf13c8fd96f7', '2010-10-28 00:00:00.00', 'admin', 1, 'Служебная записка',
'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
String numPrefix = ""
if (binding.variables.containsKey("docOfficeData")) {
    com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
    if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
        numPrefix = officeFile.getNomenclature().getIndex() + "-"
    }
}
return numPrefix + String.valueOf(un.getNextNumber("memorandumnumbers")).padLeft(5, "0")');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = '31dd46b2-2c00-11e3-bbe5-ef5c4a9d25e0');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('31dd46b2-2c00-11e3-bbe5-ef5c4a9d25e0', '2010-10-28 00:00:00.00', 'admin', 1, 'Вложения',
'String docNum= "док_"
if(binding.variables.containsKey("resNum")) {
    docNum = docNum + resNum.getRegNumber()
}
return docNum');
end if;

initDefaultInFirstStart = (select cast(value_ as boolean) from SYS_CONFIG where name='thesis.initDefaultInFirstStart');
if(initDefaultInFirstStart is null or initDefaultInFirstStart = TRUE) then
    update DF_DOC_KIND set numerator_id='70dfe954-fe9d-11e2-96e0-1f9c56fc4e22' where category_id='c40ea551-d399-4a11-b6be-347ca5f27837';
    update DF_DOC_KIND set numerator_id='ab30b1b4-fe9e-11e2-9003-c79b48b9667d' where category_id='34370700-fe69-11e2-9d98-abe6f3d1eedc';
    update DF_DOC_KIND set numerator_id='b8ee4d84-fe9e-11e2-8a75-2ff0c334cf13' where category_id='44f912b6-fe8e-11e2-a6b7-5bb93c75e36b';
    update DF_DOC_KIND set numerator_id='c3b2f4a4-fe9e-11e2-a39a-83fe0d6b8db7' where category_id='7f1b0314-fe8e-11e2-85d5-f7a577d85b9f';
    update DF_DOC_KIND set numerator_id='d062c9f4-fe9e-11e2-a3fc-cf13c8fd96f7' where category_id='24e40c08-fe87-11e2-8c8a-3354b77dcb1f';
    update DF_DOC_KIND set numerator_id='c91d9e66-0034-11e3-8ca5-3f77160974ff' where category_id='648a5b6c-fe98-11e2-89ed-635286aa63eb';
    update DF_DOC_KIND set numerator_id='f31de086-0034-11e3-b761-873aa0372209' where category_id='3c59f74c-fe98-11e2-9e49-a30cc182d375';
    update DF_DOC_KIND set numerator_id='b3997576-456d-49e8-964a-24a247d4753d' where category_id='9cd678e3-7978-4f53-a503-a36bce3a76d6';
    update DF_DOC_KIND set numerator_id='215c66b8-ef2e-6608-bd5d-59c3bae94e5e' where category_id='9415792f-c473-cbeb-d150-8ae687c4dcd2';
end if;

cnt = (select count(id) from DF_OFFICE_FILE where id = 'a14d4159-c1ec-4b08-8c19-27b77544201b');
if(cnt = 0) then
insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id) values ('a14d4159-c1ec-4b08-8c19-27b77544201b', '2010-10-28 00:00:00.00', 'admin', 1, 1, 10, '159ab5b8-fb54-4ea6-a6ba-b485fb885010', 'b3997576-456d-49e8-964a-24a247d4753d');
end if;

cnt = (select count(id) from DF_OFFICE_FILE where id = 'e4698cbc-7fdd-4bc7-b011-1d7ccb80ae37');
if(cnt = 0) then
insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id) values ('e4698cbc-7fdd-4bc7-b011-1d7ccb80ae37', '2010-10-28 00:00:00.00', 'admin', 1, 1, 10, '301f91e9-2968-4fc6-ba4e-e3a3ea09d46c', 'b3997576-456d-49e8-964a-24a247d4753d');
end if;

cnt = (select count(id) from DF_OFFICE_FILE where id = 'fc69f0e9-4b0b-465a-88a6-47805e32e099');
if(cnt = 0) then
insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id) values ('fc69f0e9-4b0b-465a-88a6-47805e32e099', '2010-10-28 00:00:00.00', 'admin', 1, 1, 10, 'd32b5d42-e202-4df5-89ee-9d6111d6d637', 'b3997576-456d-49e8-964a-24a247d4753d');
end if;

cnt = (select count(df_office_file_id) from df_off_file_nomencl_relation where delete_ts is null);
if(cnt = 0) then
insert into df_off_file_nomencl_relation (ID, DF_OFFICE_FILE_ID, DF_OFFICE_FILE_NOMENCLATURE_ID)
select newId(), ooff.id, nom.id from DF_OFFICE_FILE ooff
inner join DF_OFFICE_FILE_NOMENCLATURE nom on ooff.office_file_nomenclature_id = nom.id;
end if;

update DF_OFFICE_FILE set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null and id in ('a14d4159-c1ec-4b08-8c19-27b77544201b', 'e4698cbc-7fdd-4bc7-b011-1d7ccb80ae37', 'fc69f0e9-4b0b-465a-88a6-47805e32e099');

return 0;
END;
$$
LANGUAGE plpgsql;
^
select baseInsert();
^
drop function if exists baseInsert()^

update DF_DOC_KIND set numerator_id = ('B3997576-456D-49E8-964A-24A247D4753D') where numerator_id is null^

update df_numerator set script_enabled = true where script_enabled is null  and script is not null^

create or replace function insertIndexCurrency()
returns void
as $$
begin
   if not exists ( select *
       from   pg_class c
       join   pg_namespace n ON n.oid = c.relnamespace
       where  c.relname = 'idx_df_currency_uniqueness'
       ) then
        create unique index IDX_DF_CURRENCY_UNIQUENESS on DF_CURRENCY (DIGITAL_CODE) where DELETE_TS IS NULL;
   end if;
end
$$ language plpgsql^
select insertIndexCurrency()^
drop function insertIndexCurrency()^

update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Ознакомление"},{"language":"en","caption":"Submit for Review"}]}' where JBPM_PROCESS_KEY = 'Acquaintance' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Резолюция"},{"language":"en","caption":"Resolution"}]}' where JBPM_PROCESS_KEY = 'Resolution' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Регистрация"},{"language":"en","caption":"Registration"}]}' where JBPM_PROCESS_KEY = 'Registration' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Согласование"},{"language":"en","caption":"Submit for Approval"}]}' where JBPM_PROCESS_KEY = 'Endorsement' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Согласование протокола"},{"language":"en","caption":"Review protocol"}]}' where JBPM_PROCESS_KEY = 'ProtocolEndorsement' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Согласование повестки"},{"language":"en","caption":"Review agenda"}]}' where JBPM_PROCESS_KEY = 'AgendaEndorsement' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Управление задачами"},{"language":"en","caption":"Task management"}]}' where JBPM_PROCESS_KEY = 'TaskManagement' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Обработка входящего из ЭДО"},{"language":"en","caption":"EDM inbound processing"}]}' where JBPM_PROCESS_KEY = 'EdmReceiving' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Обработка входящего пакета из ЭДО"},{"language":"en","caption":"EDM inbound package processing"}]}' where JBPM_PROCESS_KEY = 'EdmPackageReceiving' and updated_by is null^

update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Совещания"},{"language":"en","caption":"Meetings"}]}' where ID = '215C66B8-EF2E-6608-BD5D-59C3BAE94E5E' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Вложения"},{"language":"en","caption":"Attachments"}]}' where ID = '31DD46B2-2C00-11E3-BBE5-EF5C4A9D25E0' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Документы и договоры"},{"language":"en","caption":"Documents and contracts"}]}' where ID = 'B3997576-456D-49E8-964A-24A247D4753D' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Приложение к договору"},{"language":"en","caption":"Annex to a contract"}]}' where ID = 'C91D9E66-0034-11E3-8CA5-3F77160974FF' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Дополнительное соглашение"},{"language":"en","caption":"Supplementary agreement"}]}' where ID = 'F31DE086-0034-11E3-B761-873AA0372209' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Инструкция"},{"language":"en","caption":"Instruction"}]}' where ID = 'C3B2F4A4-FE9E-11E2-A39A-83FE0D6B8DB7' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Письмо"},{"language":"en","caption":"Letter"}]}' where ID = '70DFE954-FE9D-11E2-96E0-1F9C56FC4E22' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Приказ"},{"language":"en","caption":"Order"}]}' where ID = 'AB30B1B4-FE9E-11E2-9003-C79B48B9667D' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Регламент"},{"language":"en","caption":"Regulations"}]}' where ID = 'B8EE4D84-FE9E-11E2-8A75-2FF0C334CF13' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Служебная записка"},{"language":"en","caption":"Memorandum"}]}' where ID = 'D062C9F4-FE9E-11E2-A3FC-CF13C8FD96F7' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Входящий"},{"language":"en","caption":"Income"}]}' where ID = 'BEBC21E2-FCE0-40C6-9202-7CFFFF7CF88E' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Исходящий"},{"language":"en","caption":"Outcome"}]}' where ID = '5618547C-A4C9-4BFD-A71E-D884CF49DF57' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Внутренний"},{"language":"en","caption":"Internal"}]}' where ID = '36708C7F-E232-4451-A239-3F5A8FA10726' and updated_by is null^