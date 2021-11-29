^
CREATE OR REPLACE FUNCTION rename_column_if_exists(tableName text, columnName text, newColumnName text)
RETURNS void AS
$BODY$
BEGIN
    if exists (select * from INFORMATION_SCHEMA.COLUMNS c where c.TABLE_NAME = lower(tableName) and c.COLUMN_NAME = lower(columnName))
    then
        execute('alter table ' || tableName || ' rename column ' || columnName || ' to ' || newColumnName);
    end if;
END;
$BODY$
LANGUAGE plpgsql^

select rename_column_if_exists('df_organization', 'comment', 'comment_');
select rename_column_if_exists('df_contractor', 'comment', 'comment_');
select rename_column_if_exists('df_contact_person', 'comment', 'comment_');
select rename_column_if_exists('df_contractor_account', 'comment', 'comment_');
select rename_column_if_exists('df_organization_account', 'comment', 'comment_');
select rename_column_if_exists('df_office_file_nomenclature', 'comment', 'comment_');
select rename_column_if_exists('df_office_file', 'comment', 'comment_');
select rename_column_if_exists('df_employee', 'comment', 'comment_');
select rename_column_if_exists('df_employee', 'number', 'number_');
select rename_column_if_exists('df_doc', 'number', 'number_');
select rename_column_if_exists('df_doc', 'comment', 'comment_');
select rename_column_if_exists('df_doc', 'date', 'date_');
select rename_column_if_exists('df_doc_transfer_log', 'comment', 'comment_');
select rename_column_if_exists('df_reservation_number', 'comment', 'comment_');
select rename_column_if_exists('df_reservation_number', 'number', 'number_');
select rename_column_if_exists('ts_office_file_transfer_log', 'comment', 'comment_');
select rename_column_if_exists('tm_task_group', 'number', 'number_');
select rename_column_if_exists('df_simple_doc', 'portal_publish_error_description', 'portal_publish_error_desc');

drop function rename_column_if_exists(text, text, text)^

^
CREATE OR REPLACE FUNCTION rename_index(character varying, character varying)
  RETURNS void AS
$BODY$
DECLARE
     old_name alias for $1;
     new_name alias for $2;
BEGIN
    if exists ( select * from pg_class c join pg_namespace n ON n.oid = c.relnamespace where c.relname = old_name)
    then
        execute('ALTER INDEX ' || old_name || ' RENAME TO ' || new_name);
    end if;
END;
$BODY$
LANGUAGE plpgsql^

select rename_index('IDX_TM_TASK_PATTERN_GROUP_TASK_PATTERN_U','IDX_TM_TPG_TASK_PATTERN_U')^
select rename_index('IDX_DF_DOC_TEMPLATE_VERSION_DATE','IDX_DOC_TEMPLATE_VERSION_DATE')^
select rename_index('IDX_DF_DOC_TEMPLATE_VERSION_NUMBER','IDX_DOC_TEMPLATE_VERSION_NUM')^
select rename_index('IDX_DF_ACCOUNTING_APP_INTEGRATION_LOG','IDX_DFAIL_INTEGRATION_LOG')^
select rename_index('IDX_DF_ACCOUNTING_APP_INTEGRATION_LOG_CHANGES_SET_ID_INTEGRATION_STATE','IDX_DFAIL_CHANGES_SET_STATE')^
select rename_index('IDX_DF_APP_INTEGRATION_LINK_ENTITY_ENTITY_NAME_ENTITY_ID','IDX_DFAILE_ENT_NAME_ENT_ID')^
select rename_index('IDX_DF_APP_INTEGRATION_LINK_ENTITY_ENTITY_NAME_EXTERNAL_ID','IDX_DFAILE_ENT_NAME_EXTERNAL')^
select rename_index('IDX_DF_DOC_OFFICE_DATA_ADDRESSEE_DOD','IDX_DDODA_DOC_OFFICE_DATA')^
select rename_index('IDX_TS_CARD_ACL_TEMPLATE_WF_CARD','IDX_TS_CARD_ACL_TEMPLATE_CARD')^
select rename_index('IDX_TS_CARD_ACL_DF_ORGANIZATION','IDX_TS_CARD_ACL_ORGANIZATION')^
select rename_index('IDX_DF_SHORT_URL_LONG_URL_DELETE_TS','IDX_DSU_LONG_URL_DELETE_TS')^
select rename_index('IDX_DF_SHORT_URL_SHORT_URL_DELETE_TS','IDX_DSU_SHORT_URL_DELETE_TS')^
select rename_index('IDX_DF_EDP_RELATION_EMPLOYEE','IDX_DEDP_EMPLOYEE')^
select rename_index('IDX_DF_EDP_RELATION_DEPARTMENT_DELETE_TS','IDX_DEDP_DELETE_TS')^
select rename_index('IDX_TS_IMPORT_ENTITY_INFO_IMPORT_ID','IDX_TIEI_IMPORT_ID')^
select rename_index('IDX_SEC_SCREEN_HISTORY_CREATE_TS_USER_ID','IDX_SEC_SCREEN_HISTORY_CR_US')^
select rename_index('IDX_DF_MEETING_QUESTION_MEETING_DOC','IDX_DMQ_MEETING_DOC')^
select rename_index('IDX_DF_MEETING_QUESTION_SPEAKER','IDX_DMQ_SPEAKER')^
select rename_index('IDX_DF_MEETING_PARTICIPANT_MEETING_DOC','IDX_DMP_MEETING_DOC')^
select rename_index('IDX_DF_MEETING_PARTICIPANT_CONTACTOR','IDX_DMP_CONTACTOR')^
select rename_index('IDX_DF_MEETING_PARTICIPANT_USER','IDX_DMP_USER')^
select rename_index('IDX_DF_MEETING_PARTICIPANT_CONTRACTOR','IDX_DMP_CONTRACTOR')^
select rename_index('IDX_TS_CALENDAR_EVENT_ITEM_PARENT_ENTITY_ID','IDX_TCEI_PARENT_ENTITY_ID')^
select rename_index('IDX_TS_CALENDAR_EVENT_ITEM_CARD_ID','IDX_TCEI_CARD_ID')^
select rename_index('IDX_TS_CALENDAR_EVENT_PARTICIPANT_USER_ID','IDX_TCEP_USER_ID')^
select rename_index('idx_df_doc_transfer_log_doc_office_data','idx_ddtl_doc_office_data')^
select rename_index('idx_df_doc_office_data_response_to_doc','idx_ddod_response_to_doc')^
select rename_index('idx_ts_remote_card_state_unique','idx_trc_state_unique')^
select rename_index('IDX_WF_ATTACHMENT_CORRESPONDENT_ID','IDX_WA_CORRESPONDENT_ID')^
select rename_index('IDX_WF_ATTACHMENT_ORGANIZATION_ID','IDX_WA_ORGANIZATION_ID')^
select rename_index('IDX_WF_ATTACHMENT_RECOGNIZED_FILE_ID','IDX_WA_RECOGNIZED_FILE_ID')^
select rename_index('IDX_WF_ATTACHMENT_TASK_GROUP_ID','IDX_WA_TASK_GROUP_ID')^
select rename_index('idx_wf_card_info_activity_execution_id','idx_wci_activity_execution_id')^

drop function rename_index(character varying, character varying)^

^
CREATE OR REPLACE FUNCTION drop_constraint_if_exists(tableName text, constraintName text)
RETURNS void AS
$BODY$
BEGIN
    if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS c where c.TABLE_NAME = lower(tableName) and c.CONSTRAINT_NAME = lower(constraintName))
    then
        execute('alter table ' || tableName || ' drop constraint ' || constraintName);
    end if;
END;
$BODY$
LANGUAGE plpgsql^

select drop_constraint_if_exists('DF_CORRESPONDENT', 'FK_DF_CORRESPONDENT_ORGANIZATION');
alter table DF_CORRESPONDENT add constraint FK_DF_CORRESPONDENT_ORGANIZAT foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID);

select drop_constraint_if_exists('DF_CONTRACTOR_ACCOUNT', 'FK_DF_CONTRACTOR_ACCOUNT_CONTRACTOR');
alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_CONT foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID);

select drop_constraint_if_exists('DF_CONTRACTOR_ACCOUNT', 'FK_DF_CONTRACTOR_ACCOUNT_CURRENCY');
alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_CURR foreign key (CURRENCY_ID) references DF_CURRENCY (ID);

select drop_constraint_if_exists('DF_CONTRACTOR_ACCOUNT', 'FK_DF_CONTRACTOR_ACCOUNT_DF_BANK');
alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_DF_B foreign key (INDIRECT_CALC_BANK_ID) references DF_BANK (ID);

select drop_constraint_if_exists('DF_ORGANIZATION_ACCOUNT', 'FK_DF_ORGANIZATION_ACCOUNT_CONTRACTOR');
alter table DF_ORGANIZATION_ACCOUNT add constraint FK_DF_ORGANIZATION_ACCOUNT_CO foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID);

select drop_constraint_if_exists('DF_ORGANIZATION_ACCOUNT', 'FK_DF_ORGANIZATION_ACCOUNT_CURRENCY');
alter table DF_ORGANIZATION_ACCOUNT add constraint FK_DF_ORGANIZATION_ACCOUNT_CU foreign key (CURRENCY_ID) references DF_CURRENCY (ID);

select drop_constraint_if_exists('DF_ORGANIZATION_ACCOUNT', 'FK_DF_ORGANIZATION_ACCOUNT_DF_BANK');
alter table DF_ORGANIZATION_ACCOUNT add constraint DF_ORGANIZATION_ACCOUNT_DF_BA foreign key (INDIRECT_CALC_BANK_ID) references DF_BANK (ID);

select drop_constraint_if_exists('DF_OFFICE_FILE_NOMENCLATURE', 'FK_DF_OFFICE_FILE_NOMENCLATURE_ORGANIZATION');
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OF_NOMENCL_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID);

select drop_constraint_if_exists('DF_OFFICE_FILE_NOMENCLATURE', 'FK_DF_OFFICE_FILE_NOMENCLATURE_NOMENCLATURE');
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OF_NOMENCL_NOMENCLATURE foreign key (PARENT_NOMENCLATURE_ID) references DF_OFFICE_FILE_NOMENCLATURE(ID);

select drop_constraint_if_exists('DF_OFFICE_FILE_NOMENCLATURE', 'FK_DF_OFFICE_FILE_NOMENCLATURE_DEPARTMENT');
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OF_NOMENCL_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT (CORRESPONDENT_ID);

select drop_constraint_if_exists('DF_OFFICE_FILE_NOMENCLATURE', 'FK_DF_OFFICE_FILE_NOMENCLATURE_TO_SEC_USER');
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OF_NOMENCL_TO_SEC_USER foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID);

select drop_constraint_if_exists('DF_OFFICE_FILE_NOMENCLATURE_RELATION', 'DF_OFFICE_FILE_OFFICE_FILE_NOMENCLATURE_OFFICE_FILE');
select drop_constraint_if_exists('DF_OFFICE_FILE_NOMENCLATURE_RELATION', 'DF_OFFICE_FILE_NOMENCLATURE_RELATION_OFFICE_FILE');
alter table DF_OFFICE_FILE_NOMENCLATURE_RELATION add constraint DF_OF_N_RELATION_OFFICE_FILE foreign key (DF_OFFICE_FILE_ID) references DF_OFFICE_FILE(ID);

select drop_constraint_if_exists('DF_OFFICE_FILE_NOMENCLATURE_RELATION', 'DF_OFFICE_FILE_OFFICE_FILE_NOMENCLATURE_NOMENCLATURE');
select drop_constraint_if_exists('DF_OFFICE_FILE_NOMENCLATURE_RELATION', 'DF_OFFICE_FILE_NOMENCLATURE_RELATION_NOMENCLATURE');
alter table DF_OFFICE_FILE_NOMENCLATURE_RELATION add constraint DF_OF_N_RELATION_NOMENCLATURE foreign key (DF_OFFICE_FILE_NOMENCLATURE_ID) references DF_OFFICE_FILE_NOMENCLATURE(ID);

select drop_constraint_if_exists('DF_DOC_EXTRA_FIELD', 'DF_DOC_EXTRA_FIELD_CARD_ID_EXTRA_FIELD_ID_KEY');
alter table DF_DOC_EXTRA_FIELD add constraint FK_DF_DOC_EXTRA_FIELD_CARD_ID unique(CARD_ID, FIELD_NAME);

select drop_constraint_if_exists('DF_DOC_OFFICE_DATA', 'FK_DF_DOC_OFFICE_DATA_DOC_RECEIVING_METHOD');
alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_DOC_RECEIVING_METHOD foreign key (DOC_RECEIVING_METHOD_ID) references DF_DOC_RECEIVING_METHOD(ID);

select drop_constraint_if_exists('DF_DOC_OFFICE_DATA', 'FK_DF_DOC_OFFICE_DATA_RESPONSE_TO_DOC');
alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_RESPONSE_TO_DOC foreign key (RESPONSE_TO_DOC_ID) references DF_DOC(CARD_ID);

select drop_constraint_if_exists('DF_DOC_OFFICE_DATA', 'FK_DF_DOC_OFFICE_DATA_OFFICE_FILE');
alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID);

select drop_constraint_if_exists('DF_DOC_OFFICE_DATA', 'FK_DF_DOC_OFFICE_DATA_OFFICE_EXECUTOR');
alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_OFFICE_EXECUTOR foreign key (OFFICE_EXECUTOR_ID) references DF_CONTACT_PERSON (ID);

select drop_constraint_if_exists('DF_DOC_OFFICE_DATA', 'FK_DF_DOC_OFFICE_DATA_OFFICE_SIGNED_BY');
alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_OFFICE_SIGNED_BY foreign key (OFFICE_SIGNED_BY_ID) references DF_CONTACT_PERSON (ID);

select drop_constraint_if_exists('DF_DOC_OFFICE_DATA', 'FK_DF_DOC_OFFICE_DATA_EMPLOYEE_EXECUTOR');
alter table DF_DOC_OFFICE_DATA add constraint DF_DDOFD_EMPLOYEE_EXECUTOR foreign key (EMPLOYEE_EXECUTOR_ID) references DF_EMPLOYEE(CORRESPONDENT_ID);

select drop_constraint_if_exists('DF_DOC_OFFICE_DATA', 'FK_DF_DOC_OFFICE_DATA_EMPLOYEE_SIGNED_BY');
alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_EMPLOYEE_SIGNED_BY foreign key (EMPLOYEE_SIGNED_BY_ID) references DF_EMPLOYEE (CORRESPONDENT_ID);

select drop_constraint_if_exists('TM_SCHEDULE_TASK', 'FK_TM_SCHEDULE_TASK_TO_SEC_USER');
alter table TM_SCHEDULE_TASK add constraint FK_TM_SCHED_TASK_TO_SEC_USER foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID);

select drop_constraint_if_exists('TM_TASK', 'FK_TM_TASK_SCHEDULE_TASK_ID');
alter table TM_TASK add constraint FK_TM_TASK_SCHED_TASK_ID foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID);

select drop_constraint_if_exists('TM_SCHEDULE_TASK', 'FK_TM_SCHEDULE_TASK_ORGANIZATION');
alter table TM_SCHEDULE_TASK add constraint FK_TM_SCHED_TASK_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID);

select drop_constraint_if_exists('TM_SCHEDULE_TRIGGER', 'FK_TM_SCHEDULE_TRIGGER_SCHEDULE_TASK');
alter table TM_SCHEDULE_TRIGGER add constraint FK_TM_S_TRIGGER_SCHEDULE_TASK foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID);

select drop_constraint_if_exists('TM_SCHEDULE_ACTION', 'FK_TM_SCHEDULE_ACTION_SCHEDULE_TASK');
alter table TM_SCHEDULE_ACTION add constraint FK_TM_SA_SCHEDULE_TASK foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID);

select drop_constraint_if_exists('TM_SCHEDULE_ACTION', 'FK_TM_SCHEDULE_ACTION_SCHEDULE_ACTION_TYPE');
alter table TM_SCHEDULE_ACTION add constraint FK_TM_SA_SCHEDULE_ACTION_TYPE foreign key (SCHEDULE_ACTION_TYPE_ID) references TM_SCHEDULE_ACTION_TYPE(ID);

select drop_constraint_if_exists('TM_START_TASK_SCHEDULE_ACTION', 'FK_TM_START_TASK_SCHEDULE_ACTION_SCHEDULE_ACTION');
alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TM_STSA_SCHEDULE_ACTION foreign key (SCHEDULE_ACTION_ID) references TM_SCHEDULE_ACTION(ID);

select drop_constraint_if_exists('TM_START_TASK_SCHEDULE_ACTION', 'FK_TM_START_TASK_SCHEDULE_ACTION_TASK_PATTERN');
alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TM_STSA_TASK_PATTERN foreign key (TASK_PATTERN_ID) references TM_TASK_PATTERN(CARD_ID);

select drop_constraint_if_exists('TM_SCHEDULE_ACTION_LOG', 'FK_TM_TM_SCHEDULE_ACTION_LOG_SCHEDULE_ACTION');
alter table TM_SCHEDULE_ACTION_LOG add constraint FK_TM_SAL_SCHEDULE_ACTION foreign key (SCHEDULE_ACTION_ID) references TM_SCHEDULE_ACTION(ID);

select drop_constraint_if_exists('DF_TYPICAL_RESOLUTION', 'FK_DF_TYPICAL_RESOLUTION_CREATOR');
alter table DF_TYPICAL_RESOLUTION add constraint FK_DF_TR_CREATOR foreign key (CREATOR_ID) references SEC_USER(ID);

select drop_constraint_if_exists('TS_CARD_ACL', 'FK_TS_CARD_ACL_TEMPLATE_WF_CARD');
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_TEMPLATE_CARD foreign key (TEMPLATE_ID) references WF_CARD(ID);

select drop_constraint_if_exists('DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION', 'FK_DF_EMPLOYEE_DEPARTMENT_RELATION_ACCOUNT_DF_EMPLOYEE');
alter table DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION add constraint FK_DEDP_ACCOUNT_DF_EMPLOYEE foreign key (EMPLOYEE_ID) references DF_EMPLOYEE(correspondent_id);

select drop_constraint_if_exists('DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION', 'FK_DF_EMPLOYEE_DEPARTMENT_RELATION_DF_DEPARTMENT');
alter table DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION add constraint FK_DEDP_DF_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT(CORRESPONDENT_ID);

select drop_constraint_if_exists('DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION', 'FK_DF_EMPLOYEE_DEPARTMENT_RELATION_ACCOUNT_DF_POSITION');
alter table DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION add constraint FK_DEDP_ACCOUNT_DF_POSITION foreign key (POSITION_ID) references DF_POSITION(ID);

select drop_constraint_if_exists('DF_IMPORT_DATA_TYPE', 'FK_DF_IMPORT_DATA_TYPE_SCRIPT_FILE');
alter table DF_IMPORT_DATA_TYPE add constraint FK_DIDT_SCRIPT_FILE foreign key (SCRIPT_FILE_ID) references SYS_FILE (ID);

select drop_constraint_if_exists('DF_IMPORT_DATA_TYPE', 'FK_DF_IMPORT_DATA_TYPE_PATTERN_FILE');
alter table DF_IMPORT_DATA_TYPE add constraint FK_DIDT_PATTERN_FILE foreign key (PATTERN_FILE_ID) references SYS_FILE (ID);

select drop_constraint_if_exists('DF_IMPORT_DATA_ATTR', 'FK_DF_IMPORT_DATA_ATTR_DATA_TYPE');
alter table DF_IMPORT_DATA_ATTR add constraint FK_DIDA_DATA_TYPE foreign key (IMPORT_DATA_TYPE_ID) references DF_IMPORT_DATA_TYPE(ID);

select drop_constraint_if_exists('TM_LAZY_LOAD_ATTACHMENT', 'TM_LAZY_LOAD_ATTACHMENT_FILE_ID');
alter table TM_LAZY_LOAD_ATTACHMENT add constraint TM_LAZY_LOAD_ATTACHM_FILE_ID foreign key (FILE_ID) references SYS_FILE (ID);

select drop_constraint_if_exists('DF_SUB_CARD_INFO', 'FK_DF_SUB_CARD_INFO_PARENT_CARD');
alter table DF_SUB_CARD_INFO add constraint FK_DSCI_PARENT_CARD foreign key (PARENT_CARD_ID) references WF_CARD(ID);

select drop_constraint_if_exists('DF_SUB_CARD_INFO', 'FK_DF_SUB_CARD_INFO_RESOLUTION_ASSIGNMENT');
alter table DF_SUB_CARD_INFO add constraint FK_DSCI_RESOLUTION_ASSIGNMENT foreign key (RESOLUTION_ASSIGNMENT_ID) references WF_ASSIGNMENT(ID);

select drop_constraint_if_exists('DF_SUB_CARD_INFO', 'FK_DF_SUB_CARD_INFO_SUB_CARD_CREATED_ASSIGNMENT');
alter table DF_SUB_CARD_INFO add constraint FK_DSCI_CREATED_ASSIGNMENT foreign key (SUB_CARD_CREATED_ASSIGNMENT_ID) references WF_ASSIGNMENT(ID);

select drop_constraint_if_exists('DF_RESERVATION_NUMBER', 'FK_DF_RESERVATION_NUMBER_OFFICE_FILE');
alter table DF_RESERVATION_NUMBER add constraint FK_DRN_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID);

select drop_constraint_if_exists('DF_RESERVATION_NUMBER', 'FK_DF_RESERVATION_NUMBER_NUMERATOR');
alter table DF_RESERVATION_NUMBER add constraint FK_DRN_NUMERATOR foreign key (NUMERATOR_ID) references DF_NUMERATOR(ID);

select drop_constraint_if_exists('DF_RESERVATION_NUMBER', 'FK_DF_RESERVATION_NUMBER_DOC');
alter table DF_RESERVATION_NUMBER add constraint FK_DRN_NUMBER_DOC foreign key (DOC_ID) references DF_DOC(CARD_ID);

select drop_constraint_if_exists('DF_RESERVATION_NUMBER', 'FK_DF_RESERVATION_NUMBER_ATTACH');
alter table DF_RESERVATION_NUMBER add constraint FK_DRN_ATTACH foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID);

select drop_constraint_if_exists('DF_RESERVATION_NUMBER', 'FK_DF_RESERVATION_NUMBER_ORGANIZATION');
alter table DF_RESERVATION_NUMBER add constraint FK_DRN_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID);

select drop_constraint_if_exists('DF_MEETING_QUESTION', 'FK_DF_MEETING_QUESTION_SPEAKER_ID');
alter table DF_MEETING_QUESTION add constraint FK_DMQ_SPEAKER_ID foreign key (SPEAKER_ID) references SEC_USER(ID);

select drop_constraint_if_exists('DF_MEETING_QUESTION', 'FK_DF_MEETING_QUESTION_MEETING_DOC_ID');
alter table DF_MEETING_QUESTION add constraint FK_DMQ_MEETING_DOC_ID foreign key (MEETING_DOC_ID) references DF_MEETING_DOC(CARD_ID);

select drop_constraint_if_exists('DF_MEETING_PARTICIPANT', 'FK_DF_MEETING_PARTICIPANT_USER_ID');
alter table DF_MEETING_PARTICIPANT add constraint FK_DMP_USER_ID foreign key (USER_ID) references SEC_USER(ID);

select drop_constraint_if_exists('DF_MEETING_PARTICIPANT', 'FK_DF_MEETING_PARTICIPANT_CONTACT_PERSON_ID');
alter table DF_MEETING_PARTICIPANT add constraint FK_DMP_CONTACT_PERSON_ID foreign key (CONTACT_PERSON_ID) references DF_CONTACT_PERSON(ID);

select drop_constraint_if_exists('DF_MEETING_PARTICIPANT', 'FK_DF_MEETING_PARTICIPANT_CONTRACTOR_ID');
alter table DF_MEETING_PARTICIPANT add constraint FK_DMP_CONTRACTOR_ID foreign key (CONTRACTOR_ID) references DF_CONTRACTOR(CORRESPONDENT_ID);

select drop_constraint_if_exists('TS_CALENDAR_LINK', 'FK_TS_CALENDAR_LINK_TO_SEC_USER');
alter table TS_CALENDAR_LINK add constraint FK_TCL_TO_SEC_USER foreign key (USER_ID) references SEC_USER(ID);

select drop_constraint_if_exists('TS_CALENDAR_EVENT_ITEM', 'FK_TS_CALENDAR_EVENT_ITEM_TO_WF_CARD');
alter table TS_CALENDAR_EVENT_ITEM add constraint FK_TCEI_TO_WF_CARD foreign key (CARD_ID) references WF_CARD(ID);

select drop_constraint_if_exists('TS_CALENDAR_EVENT_PARTICIPANT', 'FK_TS_CALENDAR_EVENT_PARTICIPANT_TO_SEC_USER');
alter table TS_CALENDAR_EVENT_PARTICIPANT add constraint FK_TCEP_TO_SEC_USER foreign key (USER_ID) references SEC_USER(ID);

select drop_constraint_if_exists('TS_CALENDAR_EVENT_PARTICIPANT', 'FK_TS_CALENDAR_EVENT_PARTICIPANT_TO_CALENDAR_EVENT_ITEM');
alter table TS_CALENDAR_EVENT_PARTICIPANT add constraint FK_TCEP_TO_CALENDAR_EVENT_ITEM foreign key (CALENDAR_EVENT_ITEM_ID) references TS_CALENDAR_EVENT_ITEM(ID);

select drop_constraint_if_exists('DF_TYPICAL_RESOLUTION', 'FK_DF_TYPICAL_RESOLUTION_ORGANIZATION');
alter table DF_TYPICAL_RESOLUTION add constraint FK_DTR_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID);

select drop_constraint_if_exists('TM_PROJECT_GROUP', 'FK_TM_PROJECT_GROUP_ORGANIZATION');
alter table TM_PROJECT_GROUP add constraint FK_TPG_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID);

select drop_constraint_if_exists('TM_START_TASK_SCHEDULE_ACTION', 'FK_TM_START_TASK_SCHEDULE_ACTION_ORGANIZATION');
alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TSTSA_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID);

select drop_constraint_if_exists('TM_TASK_PATTERN', 'FK_TM_TASK_PATTERN_ORGANIZATION');
alter table TM_TASK_PATTERN add constraint FK_TTP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID);

select drop_constraint_if_exists('TM_TASK_PATTERN_GROUP', 'FK_TM_TASK_PATTERN_GROUP_ORGANIZATION');
alter table TM_TASK_PATTERN_GROUP add constraint FK_TTPG_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID);

select drop_constraint_if_exists('WF_CARD_COMMENT', 'FK_TS_CARD_COMMENT_WF_CARD_ATTACHMENT');
alter table WF_CARD_COMMENT add constraint FK_TCC_WF_CARD_ATTACHMENT foreign key (CARD_ATTACHMENT_ID) references WF_ATTACHMENT(ID);

select drop_constraint_if_exists('WF_CARD_COMMENT', 'FK_TS_CARD_COMMENT_WF_ASSIGNMENT');
alter table WF_CARD_COMMENT add constraint FK_TCC_WF_ASSIGNMENT foreign key (ASSIGNMENT_ID) references WF_ASSIGNMENT(ID);

select drop_constraint_if_exists('TM_TASK_GROUP', 'FK_TM_TASK_GROUP_SUBSTITUTED_CREATOR');
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_SUBST_CREATOR foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID);

select drop_constraint_if_exists('TM_PROJECT_GROUP', 'FK_TM_PROJECT_GROUP_PROJECT_GROUP');
alter table TM_PROJECT_GROUP add constraint FK_TM_PROJECT_GROUP_PRO_GROUP foreign key (PARENT_PROJECT_GROUP_ID) references TM_PROJECT_GROUP(ID);

select drop_constraint_if_exists('DF_MEETING_PARTICIPANT', 'FK_DF_MEETING_PARTICIPANT_MEETING_DOC_ID');
select drop_constraint_if_exists('DF_MEETING_PARTICIPANT', 'FK_DF_MEETING_PARTICIPANT_DOC_ID');
alter table DF_MEETING_PARTICIPANT add constraint FK_DMP_MEETING_DOC_ID foreign key (MEETING_DOC_ID) references DF_MEETING_DOC(CARD_ID);

drop function drop_constraint_if_exists(text, text)^

ALTER TABLE tm_task_pattern_group_task_pattern RENAME TO tm_task_pattern_group_task_pat;
ALTER TABLE df_office_file_nomenclature_relation RENAME TO df_off_file_nomencl_relation;
ALTER TABLE df_employee_department_position_relation RENAME TO df_employee_department_pos;
ALTER FUNCTION create_or_update_sec_permission(character varying, character varying, integer, integer) RENAME TO create_or_update_sec_permissi;
ALTER FUNCTION assign_card_creator_default_process_actor(character varying, character varying) RENAME TO assign_card_creator_default;