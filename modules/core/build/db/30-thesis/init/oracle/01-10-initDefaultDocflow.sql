CREATE OR REPLACE FUNCTION baseInsert
RETURN integer IS
    cnt integer;
    initDefaultInFirstStart CHAR(5);
    props1 clob;
    props2 clob;
    PRAGMA AUTONOMOUS_TRANSACTION;  -- start anonymous transaction
BEGIN
    cnt := 0;
    select count(id) into cnt from DF_TYPICAL_RESOLUTION where name = 'На рассмотрение:';
    if (cnt = 0) then
        insert into DF_TYPICAL_RESOLUTION (id, create_ts, created_by, substituted_creator_id, version, name, text, global)
        values (newid(), CURRENT_TIMESTAMP, USER, 'b18e3c10032811e2969afb0e8fd8c622', 1, 'На рассмотрение:', 'На рассмотрение:', 1);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_TYPICAL_RESOLUTION where name = 'Ознакомить:';
    if (cnt = 0) then
        insert into DF_TYPICAL_RESOLUTION (id, create_ts, created_by, substituted_creator_id, version, name, text, global)
        values (newid(), CURRENT_TIMESTAMP, USER, 'b18e3c10032811e2969afb0e8fd8c622', 1, 'Ознакомить:', 'Ознакомить:', 1);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = 'bebc21e2fce040c692027cffff7cf88e';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script)
        values ('bebc21e2fce040c692027cffff7cf88e', CURRENT_TIMESTAMP, USER, 1, 'Входящий',
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
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = '5618547ca4c94bfda71ed884cf49df57';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script)
        values ('5618547ca4c94bfda71ed884cf49df57', CURRENT_TIMESTAMP, USER, 1, 'Исходящий',
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
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = '36708c7fe2324451a2393f5a8fa10726';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script)
        values ('36708c7fe2324451a2393f5a8fa10726', CURRENT_TIMESTAMP, USER, 1, 'Внутренний',
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
        COMMIT;     -- commit anonymous transaction
    end if;



    --Insert by DocKind--
    select count(CATEGORY_ID) into cnt from DF_DOC_KIND where category_id = '9cd678e379784f53a503a36bce3a76d6';
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('9cd678e379784f53a503a36bce3a76d6', 'Договор', 'df$Contract', 0, CURRENT_TIMESTAMP, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml,
        numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('9cd678e379784f53a503a36bce3a76d6', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'ae67f5f635aa11dfa04a3345dd531def',
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
        , 1, 1, 'Доп. поля', 0, 0, 0);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(CATEGORY_ID) into cnt from DF_DOC_KIND where category_id = 'c40ea551d3994a11b6be347ca5f27837';
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('c40ea551d3994a11b6be347ca5f27837', 'Письмо', 'df$SimpleDoc', 0, CURRENT_TIMESTAMP, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
        numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('c40ea551d3994a11b6be347ca5f27837', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '1665ef302b4411dfb1c6bf8783a93da6', 1,
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
        , 1, 1, 'Доп. поля', 0, 0, 0);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(CATEGORY_ID) into cnt from DF_DOC_KIND where category_id = '3c59f74cfe9811e29e49a30cc182d375';
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('3c59f74cfe9811e29e49a30cc182d375', 'Дополнительное соглашение', 'df$Contract', 0, CURRENT_TIMESTAMP, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml, numerator_type,
        category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('3c59f74cfe9811e29e49a30cc182d375', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'ae67f5f635aa11dfa04a3345dd531def',
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
        , 1, 1, 'Доп. поля', 0, 0, 0);
        COMMIT;     -- commit anonymous transaction
    end if;


    select count(CATEGORY_ID) into cnt from DF_DOC_KIND where category_id = '648a5b6cfe9811e289ed635286aa63eb';
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('648a5b6cfe9811e289ed635286aa63eb', 'Приложение к договору', 'df$Contract', 0, CURRENT_TIMESTAMP, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml, numerator_type,
        category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('648a5b6cfe9811e289ed635286aa63eb', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'ae67f5f635aa11dfa04a3345dd531def',
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
        , 1, 1, 'Доп. поля', 0, 0, 0);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(CATEGORY_ID) into cnt from DF_DOC_KIND where category_id = '34370700fe6911e29d98abe6f3d1eedc';
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('34370700fe6911e29d98abe6f3d1eedc', 'Приказ', 'df$SimpleDoc', 0, CURRENT_TIMESTAMP, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
        numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('34370700fe6911e29d98abe6f3d1eedc', CURRENT_TIMESTAMP, 'admin', 1, '1665ef302b4411dfb1c6bf8783a93da6', 1,
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
        , 1, 1, 'Доп. поля', 0, 0, 0);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(CATEGORY_ID) into cnt from DF_DOC_KIND where category_id = '24e40c08fe8711e28c8a3354b77dcb1f';
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('24e40c08fe8711e28c8a3354b77dcb1f', 'Служебная записка', 'df$SimpleDoc', 0, CURRENT_TIMESTAMP, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
        numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('24e40c08fe8711e28c8a3354b77dcb1f', CURRENT_TIMESTAMP, 'admin', 1, '1665ef302b4411dfb1c6bf8783a93da6', 1,
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
        , 1, 1, 'Доп. поля', 0, 0, 0);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(CATEGORY_ID) into cnt from DF_DOC_KIND where category_id = '44f912b6fe8e11e2a6b75bb93c75e36b';
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('44f912b6fe8e11e2a6b75bb93c75e36b', 'Регламент', 'df$SimpleDoc', 0, CURRENT_TIMESTAMP, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
        numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('44f912b6fe8e11e2a6b75bb93c75e36b', CURRENT_TIMESTAMP, 'admin', 1, '1665ef302b4411dfb1c6bf8783a93da6', 1,
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
        , 1, 1, 'Доп. поля', 0, 0, 0);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(CATEGORY_ID) into cnt from DF_DOC_KIND where category_id = '7f1b0314fe8e11e285d5f7a577d85b9f';
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('7f1b0314fe8e11e285d5f7a577d85b9f', 'Инструкция', 'df$SimpleDoc', 0, CURRENT_TIMESTAMP, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
        numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('7f1b0314fe8e11e285d5f7a577d85b9f', CURRENT_TIMESTAMP, 'admin', 1, '1665ef302b4411dfb1c6bf8783a93da6', 1,
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
        , 1, 1, 'Доп. поля', 0, 0, 0);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(CATEGORY_ID) into cnt from DF_DOC_KIND where category_id = '9415792fc473cbebd1508ae687c4dcd2';
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('9415792fc473cbebd1508ae687c4dcd2', 'Совещание', 'df$MeetingDoc', 0, CURRENT_TIMESTAMP, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml,
        numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('9415792fc473cbebd1508ae687c4dcd2', TO_TIMESTAMP('2015-05-01 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '5aa5ef34af4411dfb1c6af3783a11da6',
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
        , 1, 1, 'Доп. поля', 0, 0, 0);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_CATEGORY where id = '56a88e8c6ab2427a97fc5897005fe8a1';
    if (cnt = 0) then
        insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('56a88e8c6ab2427a97fc5897005fe8a1', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '1665ef302b4411dfb1c6bf8783a93da6', 'Основная');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_CATEGORY where id = 'ce1e9051ca5c4341a52374c694a9635d';
    if (cnt = 0) then
        insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('ce1e9051ca5c4341a52374c694a9635d', TO_TIMESTAMP('2013-10-02 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '1665ef302b4411dfb1c6bf8783a93da6', 'Основной вид деятельности');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_CATEGORY where id = 'fa88ac8013ea486bb247602818672fe5';
    if (cnt = 0) then
        insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('fa88ac8013ea486bb247602818672fe5', TO_TIMESTAMP('2013-10-02 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '1665ef302b4411dfb1c6bf8783a93da6', 'Административно-хозяйственная деятельность');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_CATEGORY where id = '196fb6fcefad4143808f248d727d91f7';
    if (cnt = 0) then
        insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('196fb6fcefad4143808f248d727d91f7', TO_TIMESTAMP('2013-10-02 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '1665ef302b4411dfb1c6bf8783a93da6', 'По кадрам');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_ORGANIZATION where id = 'a851beaf68904ab2b847b7a810c4c2b9';
    if (cnt = 0) then
        insert into DF_ORGANIZATION (id, create_ts, created_by, version, name, has_attachments) values ('a851beaf68904ab2b847b7a810c4c2b9', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Наша организация', 0);
        update sec_user set organization_id = 'a851beaf68904ab2b847b7a810c4c2b9' where organization_id is null;
        update df_category set organization_id = 'a851beaf68904ab2b847b7a810c4c2b9' where organization_id is null;
        update DF_TYPICAL_RESOLUTION set organization_id = 'a851beaf68904ab2b847b7a810c4c2b9' where organization_id is null;
        update TM_PROJECT_GROUP set organization_id = 'a851beaf68904ab2b847b7a810c4c2b9' where organization_id is null;
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_DOC_RECEIVING_METHOD where id = 'ba3e811bf0dc4cc8a1194e76ff5555b9';
        if (cnt = 0) then
        insert into DF_DOC_RECEIVING_METHOD (id, create_ts, created_by, version, name) values ('ba3e811bf0dc4cc8a1194e76ff5555b9', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Почтовая доставка');
        COMMIT;     -- commit anonymous transaction
    end if;


    select count(id) into cnt from DF_OFFICE_FILE_NOMENCLATURE where id = '301f91e929684fc6ba4ee3a3ea09d46c';
    if (cnt = 0) then
        insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('301f91e929684fc6ba4ee3a3ea09d46c', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Входящие', 2021, 0, 1, 'a851beaf68904ab2b847b7a810c4c2b9');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_OFFICE_FILE_NOMENCLATURE where id = 'd32b5d42e2024df589ee9d6111d6d637';
    if (cnt = 0) then
        insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('d32b5d42e2024df589ee9d6111d6d637', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Исходящие', 2021, 0, 1, 'a851beaf68904ab2b847b7a810c4c2b9');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_OFFICE_FILE_NOMENCLATURE where id = '159ab5b8fb544ea6a6bab485fb885010';
    if (cnt = 0) then
        insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('159ab5b8fb544ea6a6bab485fb885010', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Внутренние', 2021, 0, 1, 'a851beaf68904ab2b847b7a810c4c2b9');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = '215c66b8ef2e6608bd5d59c3bae94e5e';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script_enabled,numerator_format, periodicity, number_initial_value ) values ('215c66b8ef2e6608bd5d59c3bae94e5e', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Совещания',
        0,'[number(5)]','Y',1);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = 'b3997576456d49e8964a24a247d4753d';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('b3997576456d49e8964a24a247d4753d', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Документы и договоры',
        'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
        String numPrefix = ""
        if(binding.variables.containsKey("docOfficeData")) {
        com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
        if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
           numPrefix = officeFile.getNomenclature().getIndex() + "-"
        }
        }
        return numPrefix +String.valueOf( un.getNextNumber("innernumbers")).padLeft(5, "0")');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = 'c91d9e66003411e38ca53f77160974ff';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('c91d9e66003411e38ca53f77160974ff', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Приложение к договору',
        'import com.haulmont.cuba.core.app.DataService
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
         ctx.setQueryString("""select doc1 from df\$Doc doc1 where doc1.docKind.id=:docKindId
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
         COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = 'f31de086003411e3b761873aa0372209';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('f31de086003411e3b761873aa0372209', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Дополнительное соглашение',
        'import com.haulmont.cuba.core.app.DataService
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
         ctx.setQueryString("""select doc1 from df\$Doc doc1 where doc1.docKind.id=:docKindId
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
         COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = '70dfe954fe9d11e296e01f9c56fc4e22';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('70dfe954fe9d11e296e01f9c56fc4e22', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Письмо',
        'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
        String numPrefix = ""
        if (binding.variables.containsKey("docOfficeData")) {
            com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
            if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
                numPrefix = officeFile.getNomenclature().getIndex() + "-"
            }
        }
        return numPrefix + String.valueOf(un.getNextNumber("letternumbers")).padLeft(5, "0")');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = 'ab30b1b4fe9e11e29003c79b48b9667d';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('ab30b1b4fe9e11e29003c79b48b9667d', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Приказ',
        'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
        String numPrefix = ""
        if (binding.variables.containsKey("docOfficeData")) {
            com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
            if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
                numPrefix = officeFile.getNomenclature().getIndex() + "-"
            }
        }
        return numPrefix + String.valueOf(un.getNextNumber("ordernumbers")).padLeft(5, "0")');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = 'b8ee4d84fe9e11e28a752ff0c334cf13';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('b8ee4d84fe9e11e28a752ff0c334cf13', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Регламент',
        'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
        String numPrefix = ""
        if (binding.variables.containsKey("docOfficeData")) {
            com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
            if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
                numPrefix = officeFile.getNomenclature().getIndex() + "-"
            }
        }
        return numPrefix + String.valueOf(un.getNextNumber("regulationsnumbers")).padLeft(5, "0")');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = 'c3b2f4a4fe9e11e2a39a83fe0d6b8db7';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('c3b2f4a4fe9e11e2a39a83fe0d6b8db7', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Инструкция',
        'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
        String numPrefix = ""
        if (binding.variables.containsKey("docOfficeData")) {
            com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
            if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
                numPrefix = officeFile.getNomenclature().getIndex() + "-"
            }
        }
        return numPrefix + String.valueOf(un.getNextNumber("instructionnumbers")).padLeft(5, "0")');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = 'd062c9f4fe9e11e2a3fccf13c8fd96f7';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('d062c9f4fe9e11e2a3fccf13c8fd96f7', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Служебная записка',
        'def un = com.haulmont.cuba.core.global.AppBeans.get("cuba_UniqueNumbers")
        String numPrefix = ""
        if (binding.variables.containsKey("docOfficeData")) {
            com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
            if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
                numPrefix = officeFile.getNomenclature().getIndex() + "-"
            }
        }
        return numPrefix + String.valueOf(un.getNextNumber("memorandumnumbers")).padLeft(5, "0")');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_NUMERATOR where id = '31dd46b22c0011e3bbe5ef5c4a9d25e0';
    if (cnt = 0) then
        insert into DF_NUMERATOR (id, create_ts, created_by, version, code, script) values ('31dd46b22c0011e3bbe5ef5c4a9d25e0', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'Вложения',
        'String docNum= "док_"
        if (binding.variables.containsKey("resNum")) {
            docNum = docNum + resNum.getRegNumber()
        }
        return docNum');
        COMMIT;     -- commit anonymous transaction
    end if;

    BEGIN
        select value_ into initDefaultInFirstStart from SYS_CONFIG where name='thesis.initDefaultInFirstStart';
        if (initDefaultInFirstStart = 'true') then -- or if initDefaultInFirstStart is null
            update DF_DOC_KIND set numerator_id='70dfe954fe9d11e296e01f9c56fc4e22' where category_id='c40ea551d3994a11b6be347ca5f27837';
            update DF_DOC_KIND set numerator_id='ab30b1b4fe9e11e29003c79b48b9667d' where category_id='34370700fe6911e29d98abe6f3d1eedc';
            update DF_DOC_KIND set numerator_id='b8ee4d84fe9e11e28a752ff0c334cf13' where category_id='44f912b6fe8e11e2a6b75bb93c75e36b';
            update DF_DOC_KIND set numerator_id='c3b2f4a4fe9e11e2a39a83fe0d6b8db7' where category_id='7f1b0314fe8e11e285d5f7a577d85b9f';
            update DF_DOC_KIND set numerator_id='d062c9f4fe9e11e2a3fccf13c8fd96f7' where category_id='24e40c08fe8711e28c8a3354b77dcb1f';
            update DF_DOC_KIND set numerator_id='c91d9e66003411e38ca53f77160974ff' where category_id='648a5b6cfe9811e289ed635286aa63eb';
            update DF_DOC_KIND set numerator_id='f31de086003411e3b761873aa0372209' where category_id='3c59f74cfe9811e29e49a30cc182d375';
            update DF_DOC_KIND set numerator_id='b3997576456d49e8964a24a247d4753d' where category_id='9cd678e379784f53a503a36bce3a76d6';
            update DF_DOC_KIND set numerator_id='215c66b8ef2e6608bd5d59c3bae94e5e' where category_id='9415792fc473cbebd1508ae687c4dcd2';
            COMMIT;     -- commit anonymous transaction
        end if;
    EXCEPTION
        WHEN NO_DATA_FOUND
        THEN update DF_DOC_KIND set numerator_id='70dfe954fe9d11e296e01f9c56fc4e22' where category_id='c40ea551d3994a11b6be347ca5f27837';
            update DF_DOC_KIND set numerator_id='ab30b1b4fe9e11e29003c79b48b9667d' where category_id='34370700fe6911e29d98abe6f3d1eedc';
            update DF_DOC_KIND set numerator_id='b8ee4d84fe9e11e28a752ff0c334cf13' where category_id='44f912b6fe8e11e2a6b75bb93c75e36b';
            update DF_DOC_KIND set numerator_id='c3b2f4a4fe9e11e2a39a83fe0d6b8db7' where category_id='7f1b0314fe8e11e285d5f7a577d85b9f';
            update DF_DOC_KIND set numerator_id='d062c9f4fe9e11e2a3fccf13c8fd96f7' where category_id='24e40c08fe8711e28c8a3354b77dcb1f';
            update DF_DOC_KIND set numerator_id='c91d9e66003411e38ca53f77160974ff' where category_id='648a5b6cfe9811e289ed635286aa63eb';
            update DF_DOC_KIND set numerator_id='f31de086003411e3b761873aa0372209' where category_id='3c59f74cfe9811e29e49a30cc182d375';
            update DF_DOC_KIND set numerator_id='b3997576456d49e8964a24a247d4753d' where category_id='9cd678e379784f53a503a36bce3a76d6';
            update DF_DOC_KIND set numerator_id='215c66b8ef2e6608bd5d59c3bae94e5e' where category_id='9415792fc473cbebd1508ae687c4dcd2';
            COMMIT;     -- commit anonymous transaction
    END;

    select count(id) into cnt from DF_OFFICE_FILE where id = 'a14d4159c1ec4b088c1927b77544201b';
    if (cnt = 0) then
        insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id) values ('a14d4159c1ec4b088c1927b77544201b', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 1, 10, '159ab5b8fb544ea6a6bab485fb885010', 'b3997576456d49e8964a24a247d4753d');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_OFFICE_FILE where id = 'e4698cbc7fdd4bc7b0111d7ccb80ae37';
    if (cnt = 0) then
        insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id) values ('e4698cbc7fdd4bc7b0111d7ccb80ae37', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 1, 10, '301f91e929684fc6ba4ee3a3ea09d46c', 'b3997576456d49e8964a24a247d4753d');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from DF_OFFICE_FILE where id = 'fc69f0e94b0b465a88a647805e32e099';
    if (cnt = 0) then
        insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id) values ('fc69f0e94b0b465a88a647805e32e099', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 1, 10, 'd32b5d42e2024df589ee9d6111d6d637', 'b3997576456d49e8964a24a247d4753d');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(df_office_file_id) into cnt from DF_OFF_FILE_NOMENCL_RELATION where delete_ts is null;
    if (cnt = 0) then
        insert into DF_OFF_FILE_NOMENCL_RELATION (ID, DF_OFFICE_FILE_ID, DF_OFFICE_FILE_NOMENCLATURE_ID)
        select newId(), ooff.id, nom.id from DF_OFFICE_FILE ooff
        inner join DF_OFFICE_FILE_NOMENCLATURE nom on ooff.office_file_nomenclature_id = nom.id;
        COMMIT;     -- commit anonymous transaction
    end if;

    update DF_OFFICE_FILE set organization_id = 'a851beaf68904ab2b847b7a810c4c2b9' where organization_id is null and id in ('a14d4159c1ec4b088c1927b77544201b', 'e4698cbc7fdd4bc7b0111d7ccb80ae37', 'fc69f0e94b0b465a88a647805e32e099');
    COMMIT;     -- commit anonymous transaction

    return 0;
END baseInsert;^

select baseInsert() from dual^


DECLARE
    func_does_not_exist EXCEPTION;
    PRAGMA exception_init(func_does_not_exist, -04043);
BEGIN
    EXECUTE IMMEDIATE 'drop function baseInsert';
EXCEPTION
    WHEN func_does_not_exist THEN NULL;
END;^

update DF_DOC_KIND set numerator_id = ('b3997576456d49e8964a24a247d4753d') where numerator_id is null^

update df_numerator set script_enabled = 1 where script_enabled is null  and script is not null^

CREATE OR REPLACE PROCEDURE insertIndexCurrency IS
    already_exists exception;
    pragma exception_init(already_exists, -955);
BEGIN
    EXECUTE IMMEDIATE 'create index IDX_DF_CURRENCY_UNIQUENESS on DF_CURRENCY(DIGITAL_CODE)';
EXCEPTION
    WHEN already_exists THEN NULL;
END insertIndexCurrency;^

BEGIN
    insertIndexCurrency;
END;^


DECLARE
    func_does_not_exist EXCEPTION;
    PRAGMA exception_init(func_does_not_exist, -04043);
BEGIN
    EXECUTE IMMEDIATE 'drop procedure insertIndexCurrency';
EXCEPTION
    WHEN func_does_not_exist THEN NULL;
END;^

update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Ознакомление"},{"language":"en","caption":"Submit for Review"}]}' where JBPM_PROCESS_KEY = 'Acquaintance' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Резолюция"},{"language":"en","caption":"Resolution"}]}' where JBPM_PROCESS_KEY = 'Resolution' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Регистрация"},{"language":"en","caption":"Registration"}]}' where JBPM_PROCESS_KEY = 'Registration' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Согласование"},{"language":"en","caption":"Submit for Approval"}]}' where JBPM_PROCESS_KEY = 'Endorsement' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Согласование протокола"},{"language":"en","caption":"Review protocol"}]}' where JBPM_PROCESS_KEY = 'ProtocolEndorsement' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Согласование повестки"},{"language":"en","caption":"Review agenda"}]}' where JBPM_PROCESS_KEY = 'AgendaEndorsement' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Управление задачами"},{"language":"en","caption":"Task management"}]}' where JBPM_PROCESS_KEY = 'TaskManagement' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Обработка входящего из ЭДО"},{"language":"en","caption":"EDM inbound processing"}]}' where JBPM_PROCESS_KEY = 'EdmReceiving' and updated_by is null^
update WF_PROC set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Обработка входящего пакета из ЭДО"},{"language":"en","caption":"EDM inbound package processing"}]}' where JBPM_PROCESS_KEY = 'EdmPackageReceiving' and updated_by is null^

update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Совещания"},{"language":"en","caption":"Meetings"}]}' where ID = '215c66b8ef2e6608bd5d59c3bae94e5e' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Вложения"},{"language":"en","caption":"Attachments"}]}' where ID = '31dd46b22c0011e3bbe5ef5c4a9d25e0' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Документы и договоры"},{"language":"en","caption":"Documents and contracts"}]}' where ID = 'b3997576456d49e8964a24a247d4753d' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Приложение к договору"},{"language":"en","caption":"Annex to a contract"}]}' where ID = 'c91d9e66003411e38ca53f77160974ff' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Дополнительное соглашение"},{"language":"en","caption":"Supplementary agreement"}]}' where ID = 'f31de086003411e3b761873aa0372209' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Инструкция"},{"language":"en","caption":"Instruction"}]}' where ID = 'c3b2f4a4fe9e11e2a39a83fe0d6b8db7' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Письмо"},{"language":"en","caption":"Letter"}]}' where ID = '70dfe954fe9d11e296e01f9c56fc4e22' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Приказ"},{"language":"en","caption":"Order"}]}' where ID = 'ab30b1b4fe9e11e29003c79b48b9667d' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Регламент"},{"language":"en","caption":"Regulations"}]}' where ID = 'b8ee4d84fe9e11e28a752ff0c334cf13' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Служебная записка"},{"language":"en","caption":"Memorandum"}]}' where ID = 'd062c9f4fe9e11e2a3fccf13c8fd96f7' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Входящий"},{"language":"en","caption":"Income"}]}' where ID = 'bebc21e2fce040c692027cffff7cf88e' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Исходящий"},{"language":"en","caption":"Outcome"}]}' where ID = '5618547ca4c94bfda71ed884cf49df57' and updated_by is null^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Внутренний"},{"language":"en","caption":"Internal"}]}' where ID = '36708c7fe2324451a2393f5a8fa10726' and updated_by is null^