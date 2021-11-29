EXEC sp_rename 'DF_SIMPLE_DOC.PORTAL_PUBLISH_ERROR_DESCRIPTION', 'PORTAL_PUBLISH_ERROR_DESC', 'COLUMN';
EXEC sp_rename 'DF_ORGANIZATION.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_CONTRACTOR.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_CONTACT_PERSON.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_CONTRACTOR_ACCOUNT.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_ORGANIZATION_ACCOUNT.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_OFFICE_FILE_NOMENCLATURE.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_OFFICE_FILE.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_EMPLOYEE.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_EMPLOYEE.NUMBER', 'NUMBER_', 'COLUMN';
EXEC sp_rename 'DF_DOC.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_DOC.NUMBER', 'NUMBER_', 'COLUMN';
EXEC sp_rename 'DF_DOC.DATE', 'DATE_', 'COLUMN';
EXEC sp_rename 'DF_DOC_TRANSFER_LOG.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_RESERVATION_NUMBER.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'DF_RESERVATION_NUMBER.NUMBER', 'NUMBER_', 'COLUMN';
EXEC sp_rename 'TS_OFFICE_FILE_TRANSFER_LOG.COMMENT', 'COMMENT_', 'COLUMN';
EXEC sp_rename 'TM_TASK_GROUP.NUMBER', 'NUMBER_', 'COLUMN';

EXEC sp_rename 'dbo.FK_DF_CORRESPONDENT_ORGANIZATION', 'FK_DF_CORRESPONDENT_ORGANIZAT', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_CONTRACTOR_ACCOUNT_CONTRACTOR', 'FK_DF_CONTRACTOR_ACCOUNT_CONT', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_CONTRACTOR_ACCOUNT_CURRENCY', 'FK_DF_CONTRACTOR_ACCOUNT_CURR', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_CONTRACTOR_ACCOUNT_DF_BANK', 'FK_DF_CONTRACTOR_ACCOUNT_DF_B', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_ORGANIZATION_ACCOUNT_CONTRACTOR', 'FK_DF_ORGANIZATION_ACCOUNT_CO', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_ORGANIZATION_ACCOUNT_CURRENCY', 'FK_DF_ORGANIZATION_ACCOUNT_CU', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_ORGANIZATION_ACCOUNT_DF_BANK', 'DF_ORGANIZATION_ACCOUNT_DF_BA', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_OFFICE_FILE_NOMENCLATURE_ORGANIZATION', 'FK_DF_OF_NOMENCL_ORGANIZATION', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_OFFICE_FILE_NOMENCLATURE_NOMENCLATURE', 'FK_DF_OF_NOMENCL_NOMENCLATURE', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_OFFICE_FILE_NOMENCLATURE_DEPARTMENT', 'FK_DF_OF_NOMENCL_DEPARTMENT', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_OFFICE_FILE_NOMENCLATURE_TO_SEC_USER', 'FK_DF_OF_NOMENCL_TO_SEC_USER', 'OBJECT';
EXEC sp_rename 'dbo.DF_OFFICE_FILE_NOMENCLATURE_RELATION_OFFICE_FILE', 'DF_OF_N_RELATION_OFFICE_FILE', 'OBJECT';
EXEC sp_rename 'dbo.DF_OFFICE_FILE_NOMENCLATURE_RELATION_NOMENCLATURE', 'DF_OF_N_RELATION_NOMENCLATURE', 'OBJECT';
EXEC sp_rename 'dbo.df_doc_extra_field_card_id_extra_field_id_key', 'fk_df_doc_extra_field_card_id', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_DOC_OFFICE_DATA_DOC_RECEIVING_METHOD', 'FK_DDOFD_DOC_RECEIVING_METHOD', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_DOC_OFFICE_DATA_RESPONSE_TO_DOC', 'FK_DDOFD_RESPONSE_TO_DOC', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_DOC_OFFICE_DATA_OFFICE_FILE', 'FK_DDOFD_OFFICE_FILE', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_DOC_OFFICE_DATA_OFFICE_EXECUTOR', 'FK_DDOFD_OFFICE_EXECUTOR', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_DOC_OFFICE_DATA_OFFICE_SIGNED_BY', 'FK_DDOFD_OFFICE_SIGNED_BY', 'OBJECT';
EXEC sp_rename 'dbo.DF_DOC_OFFICE_DATA_EMPLOYEE_EXECUTOR', 'DF_DDOFD_EMPLOYEE_EXECUTOR', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_DOC_OFFICE_DATA_EMPLOYEE_SIGNED_BY', 'FK_DDOFD_EMPLOYEE_SIGNED_BY', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_SCHEDULE_TASK_TO_SEC_USER', 'FK_TM_SCHED_TASK_TO_SEC_USER', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_TASK_SCHEDULE_TASK_ID', 'FK_TM_TASK_SCHED_TASK_ID', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_SCHEDULE_TASK_ORGANIZATION', 'FK_TM_SCHED_TASK_ORGANIZATION', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_SCHEDULE_TRIGGER_SCHEDULE_TASK', 'FK_TM_S_TRIGGER_SCHEDULE_TASK', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_SCHEDULE_ACTION_SCHEDULE_TASK', 'FK_TM_SA_SCHEDULE_TASK', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_SCHEDULE_ACTION_SCHEDULE_ACTION_TYPE', 'FK_TM_SA_SCHEDULE_ACTION_TYPE', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_START_TASK_SCHEDULE_ACTION_SCHEDULE_ACTION', 'FK_TM_STSA_SCHEDULE_ACTION', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_START_TASK_SCHEDULE_ACTION_TASK_PATTERN', 'FK_TM_STSA_TASK_PATTERN', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_TM_SCHEDULE_ACTION_LOG_SCHEDULE_ACTION', 'FK_TM_SAL_SCHEDULE_ACTION', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_TYPICAL_RESOLUTION_CREATOR', 'FK_DF_TR_CREATOR', 'OBJECT';
EXEC sp_rename 'dbo.FK_TS_CARD_ACL_TEMPLATE_WF_CARD', 'FK_TS_CARD_ACL_TEMPLATE_CARD', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_EMPLOYEE_DEPARTMENT_RELATION_ACCOUNT_DF_EMPLOYEE', 'FK_DEDP_ACCOUNT_DF_EMPLOYEE', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_EMPLOYEE_DEPARTMENT_RELATION_DF_DEPARTMENT', 'FK_DEDP_DF_DEPARTMENT', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_EMPLOYEE_DEPARTMENT_RELATION_ACCOUNT_DF_POSITION', 'FK_DEDP_ACCOUNT_DF_POSITION', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_IMPORT_DATA_TYPE_SCRIPT_FILE', 'FK_DIDT_SCRIPT_FILE', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_IMPORT_DATA_TYPE_PATTERN_FILE', 'FK_DIDT_PATTERN_FILE', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_IMPORT_DATA_ATTR_DATA_TYPE', 'FK_DIDA_DATA_TYPE', 'OBJECT';
EXEC sp_rename 'dbo.TM_LAZY_LOAD_ATTACHMENT_FILE_ID', 'TM_LAZY_LOAD_ATTACHM_FILE_ID', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_SUB_CARD_INFO_PARENT_CARD', 'FK_DSCI_PARENT_CARD', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_SUB_CARD_INFO_RESOLUTION_ASSIGNMENT', 'FK_DSCI_RESOLUTION_ASSIGNMENT', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_SUB_CARD_INFO_SUB_CARD_CREATED_ASSIGNMENT', 'FK_DSCI_CREATED_ASSIGNMENT', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_RESERVATION_NUMBER_OFFICE_FILE', 'FK_DRN_OFFICE_FILE', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_RESERVATION_NUMBER_NUMERATOR', 'FK_DRN_NUMERATOR', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_RESERVATION_NUMBER_DOC', 'FK_DRN_NUMBER_DOC', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_RESERVATION_NUMBER_ATTACH', 'FK_DRN_ATTACH', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_RESERVATION_NUMBER_ORGANIZATION', 'FK_DRN_ORGANIZATION', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_MEETING_QUESTION_SPEAKER_ID', 'FK_DMQ_SPEAKER_ID', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_MEETING_QUESTION_MEETING_DOC_ID', 'FK_DMQ_MEETING_DOC_ID', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_MEETING_PARTICIPANT_USER_ID', 'FK_DMP_USER_ID', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_MEETING_PARTICIPANT_CONTACT_PERSON_ID', 'FK_DMP_CONTACT_PERSON_ID', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_MEETING_PARTICIPANT_DOC_ID', 'FK_DMP_MEETING_DOC_ID', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_MEETING_PARTICIPANT_CONTRACTOR_ID', 'FK_DMP_CONTRACTOR_ID', 'OBJECT';
EXEC sp_rename 'dbo.FK_TS_CALENDAR_LINK_TO_SEC_USER', 'FK_TCL_TO_SEC_USER', 'OBJECT';
EXEC sp_rename 'dbo.FK_TS_CALENDAR_EVENT_ITEM_TO_WF_CARD', 'FK_TCEI_TO_WF_CARD', 'OBJECT';
EXEC sp_rename 'dbo.FK_TS_CALENDAR_EVENT_PARTICIPANT_TO_SEC_USER', 'FK_TCEP_TO_SEC_USER', 'OBJECT';
EXEC sp_rename 'dbo.FK_TS_CALENDAR_EVENT_PARTICIPANT_TO_CALENDAR_EVENT_ITEM', 'FK_TCEP_TO_CALENDAR_EVENT_ITEM', 'OBJECT';
EXEC sp_rename 'dbo.FK_DF_TYPICAL_RESOLUTION_ORGANIZATION', 'FK_DTR_ORGANIZATION', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_PROJECT_GROUP_ORGANIZATION', 'FK_TPG_ORGANIZATION', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_START_TASK_SCHEDULE_ACTION_ORGANIZATION', 'FK_TSTSA_ORGANIZATION', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_TASK_PATTERN_ORGANIZATION', 'FK_TTP_ORGANIZATION', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_TASK_PATTERN_GROUP_ORGANIZATION', 'FK_TTPG_ORGANIZATION', 'OBJECT';
EXEC sp_rename 'dbo.FK_TS_CARD_COMMENT_WF_CARD_ATTACHMENT', 'FK_TCC_WF_CARD_ATTACHMENT', 'OBJECT';
EXEC sp_rename 'dbo.FK_TS_CARD_COMMENT_WF_ASSIGNMENT', 'FK_TCC_WF_ASSIGNMENT', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_TASK_GROUP_SUBSTITUTED_CREATOR', 'FK_TM_TASK_GROUP_SUBST_CREATOR', 'OBJECT';
EXEC sp_rename 'dbo.FK_TM_PROJECT_GROUP_PROJECT_GROUP', 'FK_TM_PROJECT_GROUP_PRO_GROUP', 'OBJECT';

EXEC sp_rename 'TM_TASK_PATTERN_GROUP_TASK_PATTERN.IDX_TM_TASK_PATTERN_GROUP_TASK_PATTERN_U', 'IDX_TM_TPG_TASK_PATTERN_U', 'INDEX';
EXEC sp_rename 'DF_DOC.IDX_DF_DOC_TEMPLATE_VERSION_DATE', 'IDX_DOC_TEMPLATE_VERSION_DATE', 'INDEX';
EXEC sp_rename 'DF_DOC.IDX_DF_DOC_TEMPLATE_VERSION_NUMBER', 'IDX_DOC_TEMPLATE_VERSION_NUM', 'INDEX';
EXEC sp_rename 'DF_APP_INTEGRATION_LOG.IDX_DF_ACCOUNTING_APP_INTEGRATION_LOG', 'IDX_DFAIL_INTEGRATION_LOG', 'INDEX';
EXEC sp_rename 'DF_APP_INTEGRATION_LOG.IDX_DF_ACCOUNTING_APP_INTEGRATION_LOG_CHANGES_SET_ID_INTEGRATION_STATE', 'IDX_DFAIL_CHANGES_SET_STATE', 'INDEX';
EXEC sp_rename 'DF_APP_INTEGRATION_LINK_ENTITY.IDX_DF_APP_INTEGRATION_LINK_ENTITY_ENTITY_NAME_ENTITY_ID', 'IDX_DFAILE_ENT_NAME_ENT_ID', 'INDEX';
EXEC sp_rename 'DF_APP_INTEGRATION_LINK_ENTITY.IDX_DF_APP_INTEGRATION_LINK_ENTITY_ENTITY_NAME_EXTERNAL_ID', 'IDX_DFAILE_ENT_NAME_EXTERNAL', 'INDEX';
EXEC sp_rename 'DF_DOC_OFFICE_DATA_ADDRESSEE.IDX_DF_DOC_OFFICE_DATA_ADDRESSEE_DOD', 'IDX_DDODA_DOC_OFFICE_DATA', 'INDEX';
EXEC sp_rename 'TS_CARD_ACL.IDX_TS_CARD_ACL_TEMPLATE_WF_CARD', 'IDX_TS_CARD_ACL_TEMPLATE_CARD', 'INDEX';
EXEC sp_rename 'TS_CARD_ACL.IDX_TS_CARD_ACL_DF_ORGANIZATION', 'IDX_TS_CARD_ACL_ORGANIZATION', 'INDEX';
EXEC sp_rename 'DF_SHORT_URL.IDX_DF_SHORT_URL_LONG_URL_DELETE_TS', 'IDX_DSU_LONG_URL_DELETE_TS', 'INDEX';
EXEC sp_rename 'DF_SHORT_URL.IDX_DF_SHORT_URL_SHORT_URL_DELETE_TS', 'IDX_DSU_SHORT_URL_DELETE_TS', 'INDEX';
EXEC sp_rename 'DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION.IDX_DF_EDP_RELATION_EMPLOYEE', 'IDX_DEDP_EMPLOYEE', 'INDEX';
EXEC sp_rename 'DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION.IDX_DF_EDP_RELATION_DEPARTMENT_DELETE_TS', 'IDX_DEDP_DELETE_TS', 'INDEX';
EXEC sp_rename 'TS_IMPORT_ENTITY_INFO.IDX_TS_IMPORT_ENTITY_INFO_IMPORT_ID', 'IDX_TIEI_IMPORT_ID', 'INDEX';
--EXEC sp_rename 'SEC_SCREEN_HISTORY.IDX_SEC_SCREEN_HISTORY_CREATE_TS_USER_ID', 'IDX_SEC_SCREEN_HISTORY_CR_US', 'INDEX';
EXEC sp_rename 'DF_MEETING_QUESTION.IDX_DF_MEETING_QUESTION_MEETING_DOC', 'IDX_DMQ_MEETING_DOC', 'INDEX';
EXEC sp_rename 'DF_MEETING_QUESTION.IDX_DF_MEETING_QUESTION_SPEAKER', 'IDX_DMQ_SPEAKER', 'INDEX';
EXEC sp_rename 'DF_MEETING_PARTICIPANT.IDX_DF_MEETING_PARTICIPANT_MEETING_DOC', 'IDX_DMP_MEETING_DOC', 'INDEX';
EXEC sp_rename 'DF_MEETING_PARTICIPANT.IDX_DF_MEETING_PARTICIPANT_CONTACTOR', 'IDX_DMP_CONTACTOR', 'INDEX';
EXEC sp_rename 'DF_MEETING_PARTICIPANT.IDX_DF_MEETING_PARTICIPANT_USER', 'IDX_DMP_USER', 'INDEX';
EXEC sp_rename 'DF_MEETING_PARTICIPANT.IDX_DF_MEETING_PARTICIPANT_CONTRACTOR', 'IDX_DMP_CONTRACTOR', 'INDEX';
EXEC sp_rename 'TS_CALENDAR_EVENT_ITEM.IDX_TS_CALENDAR_EVENT_ITEM_PARENT_ENTITY_ID', 'IDX_TCEI_PARENT_ENTITY_ID', 'INDEX';
EXEC sp_rename 'TS_CALENDAR_EVENT_ITEM.IDX_TS_CALENDAR_EVENT_ITEM_CARD_ID', 'IDX_TCEI_CARD_ID', 'INDEX';
EXEC sp_rename 'TS_CALENDAR_EVENT_PARTICIPANT.IDX_TS_CALENDAR_EVENT_PARTICIPANT_USER_ID', 'IDX_TCEP_USER_ID', 'INDEX';
EXEC sp_rename 'df_doc_transfer_log.idx_df_doc_transfer_log_doc_office_data', 'idx_ddtl_doc_office_data', 'INDEX';
EXEC sp_rename 'df_doc_office_data.idx_df_doc_office_data_response_to_doc', 'idx_ddod_response_to_doc', 'INDEX';
EXEC sp_rename 'ts_remote_card_state.idx_ts_remote_card_state_unique', 'idx_trc_state_unique', 'INDEX';
EXEC sp_rename 'wf_attachment.IDX_WF_ATTACHMENT_CORRESPONDENT_ID', 'IDX_WA_CORRESPONDENT_ID', 'INDEX';
EXEC sp_rename 'wf_attachment.IDX_WF_ATTACHMENT_ORGANIZATION_ID', 'IDX_WA_ORGANIZATION_ID', 'INDEX';
EXEC sp_rename 'wf_attachment.IDX_WF_ATTACHMENT_RECOGNIZED_FILE_ID', 'IDX_WA_RECOGNIZED_FILE_ID', 'INDEX';
EXEC sp_rename 'wf_attachment.IDX_WF_ATTACHMENT_TASK_GROUP_ID', 'IDX_WA_TASK_GROUP_ID', 'INDEX';
begin
  IF EXISTS (SELECT *  FROM sys.indexes  WHERE name='idx_wf_card_info_activity_execution_id'
    AND object_id = OBJECT_ID('WF_CARD_INFO'))
  begin
    EXEC sp_rename 'WF_CARD_INFO.idx_wf_card_info_activity_execution_id', 'idx_wci_activity_execution_id', 'INDEX';
 end
end;

DROP PROCEDURE CREATE_OR_UPDATE_SEC_PERMISSION;^
CREATE PROCEDURE CREATE_OR_UPDATE_SEC_PERMISSI
  @r_name varchar(255), -- sec_role.name
  @p_target varchar(100), -- sec_permission.target
  @p_type integer,  -- sec_permission.PERMISSION_TYPE
  @p_value integer  -- sec_permission.value
AS
BEGIN
	DECLARE @p_id uniqueidentifier;
	DECLARE @temp_id uniqueidentifier;
    Select @p_id = NULL;
    select TOP 1 @p_id = p.id from SEC_PERMISSION p
        join SEC_ROLE r on r.id = p.role_id
        where r.name = @r_name and p.target = @p_target;
--   return p_id;
   if  @p_id is not null  begin
        update SEC_PERMISSION set  PERMISSION_TYPE = @p_type, value = @p_value where id = @p_id;
        PRINT 'SEC_PERMISSION record was updated';
    end else begin
        select @temp_id = (select id from sec_role where name=@r_name);
        insert into SEC_PERMISSION (
          id,
          create_ts,
          created_by,
          version,
          PERMISSION_TYPE,
          target,
          value,
          role_id
        ) values (
          newid(),
          current_timestamp,
          USER,
          1,
          @p_type,
          @p_target,
          @p_value,
          @temp_id
        );
        PRINT 'SEC_PERMISSION record was created';
    end;
END;^


DROP PROCEDURE ASSIGN_CARD_CREATOR_DEFAULT_PROCESS_ACTOR;^
CREATE PROCEDURE ASSIGN_CARD_CREATOR_DEFAULT
  @proc_role_code varchar(50), -- sec_role.name
  @proc_code varchar(255) -- sec_permission.target
AS
BEGIN
	DECLARE @proc_role_id uniqueidentifier;
	DECLARE @is_multi_user tinyint;

    if(@proc_role_code is null or @proc_code is null)
    begin
        return 'Process and role codes must not be null';
    end;
    else
    begin
    	select top 1 @proc_role_id = pr.ID, @is_multi_user = pr.IS_MULTI_USER from WF_PROC_ROLE pr join WF_PROC p on p.ID = pr.PROC_ID
    	where pr.CODE = @proc_role_code and p.CODE = @proc_code and pr.DELETE_TS is null;

        if (@proc_role_id is not null)
        begin
            if(@is_multi_user = 1
                and exists (select ID from WF_DEFAULT_PROC_ACTOR where PROC_ROLE_ID = @proc_role_id and USER_ID is null
                and STRATEGY_ID = 'ts_CardAuthorProcessActorStrategy' and DELETE_TS is null))
            begin
                print 'Process role already have creator process actor';
                return 1;
            end;

            if(@is_multi_user = 0 and (select count(*) from WF_DEFAULT_PROC_ACTOR where PROC_ROLE_ID = @proc_role_id and DELETE_TS is null) > 0)
            begin
                print 'Process role multi assignment disabled and it already has default actor';
                return 1;
            end;

            insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, VERSION, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID)
            values (newid(), current_timestamp, 'admin', 1, @proc_role_id, 1, 'ts_CardAuthorProcessActorStrategy');
            print 'Creator default process actor has been successfully created';
            return 0;
        end;
        else
        begin
             print 'Can not find corresponded process role';
             return 1;
        end;
    end;
END;
^

EXEC sp_rename 'TM_TASK_PATTERN_GROUP_TASK_PATTERN', 'TM_TASK_PATTERN_GROUP_TASK_PAT';
EXEC sp_rename 'DF_OFFICE_FILE_NOMENCLATURE_RELATION', 'DF_OFF_FILE_NOMENCL_RELATION';

DROP VIEW [dbo].[df_department_membership];
EXEC sp_rename 'DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION', 'DF_EMPLOYEE_DEPARTMENT_POS';^
CREATE VIEW [dbo].[df_department_membership] WITH SCHEMABINDING  AS
WITH hdep (correspondent_id, parent_department_id , level, top_level_id) AS
          (
           SELECT correspondent_id, parent_department_id, 0 as level, top_level_id = correspondent_id
         FROM [dbo].df_department
         UNION ALL
         SELECT d1.correspondent_id, d1.parent_department_id,  level + 1, d2.top_level_id
         FROM [dbo].df_department as d1 INNER JOIN hdep as d2 ON d1.parent_department_id = d2.correspondent_id
          )
select distinct cast(null as uniqueidentifier) as id,e.user_id, h.correspondent_id as department_id
from hdep h join  [dbo].df_employee_department_pos edr
on edr.department_id=h.top_level_id and edr.delete_ts is null
	join [dbo].df_employee e
	on e.correspondent_id = edr.employee_id
	and e.user_id is not null
	and (h.top_level_id=h.correspondent_id
	     or exists (
			select r.id from [dbo].sec_role r join [dbo].sec_user_role ur
			on r.id=ur.role_id
			and ur.user_id=e.user_id
			and ur.delete_ts is null
			and r.name = 'DepartmentChief'));^