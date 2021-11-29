insert into SEC_ROLE (ID, CREATE_TS, VERSION, NAME, ROLE_TYPE)
values ('0c018061b26f4de2a5bedff348347f93', current_timestamp, 0, 'Administrators', 10)^

insert into SEC_USER_ROLE (ID, CREATE_TS, VERSION, USER_ID, ROLE_ID)
values ('c838be0a96d04ef4a7c0dff348347f93', current_timestamp, 0, '608859871b61424794c7dff348347f93', '0c018061b26f4de2a5bedff348347f93')^

delete from SEC_USER_ROLE where USER_ID = '608859871b61424794c7dff348347f93' and ROLE_NAME= 'system-full-access'^

update SEC_USER set PASSWORD = 'cc2229d1b8a052423d9e1c9ef0113b850086586a', PASSWORD_ENCRYPTION = 'sha1' where id = '608859871b61424794c7dff348347f93'^

------------------------------------------------------------------------------------------------------------

alter table SEC_USER_SUBSTITUTION add NOTIFY_BY_CARD_INFO char(1)^
alter table SEC_USER_SUBSTITUTION add NOTIFY_BY_EMAIL char(1)^
alter table SEC_USER_SUBSTITUTION add OVERDUE char(1)^

------------------------------------------------------------------------------------------------------------

alter table SYS_CATEGORY_ATTR modify DEFAULT_DOUBLE float^

------------------------------------------------------------------------------------------------------------

alter table WF_CARD add SIGNATURES clob^

------------------------------------------------------------------------------------------------------------

create table TM_TASK_TYPE (
    CATEGORY_ID varchar2(32 char),
    CATEGORY_ATTRS_PLACE integer,
    CODE varchar2(50 char),
    DESCRIPTION varchar2(200 char),
    FIELDS_XML clob, -- decrease from 7000 to 4000
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    TAB_NAME varchar2(30 char),
    primary key (CATEGORY_ID)
)^

alter table TM_TASK_TYPE add constraint TM_TASK_TYPE_CATEGORY_ID foreign key (CATEGORY_ID) references SYS_CATEGORY(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_TASK_GROUP (
    ID varchar2(32 char),
    NAME varchar2(500 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    VERSION integer default 1 not null,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    DATE_MEET date,
    NUMBER_ varchar2(50 char),
    THEME varchar2(100 char),
    GOAL varchar2(100 char),
    TEXT_PARTICIPANTS clob, -- decrease
    PARENT_CARD_ID varchar2(32 char),
    TASK_GROUP_TYPE varchar2(50 char),
    CHAIRMAN_ID varchar2(32 char),
    SECRETARY_ID varchar2(32 char),
    INITIATOR_ID varchar2(32 char),
    CREATOR_ID varchar2(32 char),
    SUBSTITUTED_CREATOR_ID varchar2(32 char),
    IS_TEMPLATE char(1),
    TEMPLATE_NAME varchar2(200 char),
    DISCUSSED varchar2(400 char),
    ORGANIZATION_ID varchar2(32 char),
    GLOBAL char(1),
    primary key (ID)
)^

alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_CHAIRMAN foreign key (CHAIRMAN_ID) references SEC_USER(ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_SECRETARY foreign key (SECRETARY_ID) references SEC_USER(ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_INITIATOR foreign key (INITIATOR_ID) references SEC_USER(ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_CREATOR foreign key (CREATOR_ID) references SEC_USER(ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_SUBST_CREATOR foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^ -- renamed: FK_TM_TASK_GROUP_SUBSTITUTED_CREATOR
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_PARENT_CARD foreign key (PARENT_CARD_ID) references WF_CARD(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_PRIORITY (
    ID varchar2(32 char),
    NAME varchar2(50 char),
    ORDER_NO numeric(3),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    primary key (ID)
)^

------------------------------------------------------------------------------------------------------------

create table TM_PROJECT_GROUP (
    ID varchar2(32 char),
    NAME varchar2(100 char),
    PARENT_PROJECT_GROUP_ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    ORGANIZATION_ID varchar2(32 char),
    primary key (ID)
)^

alter table TM_PROJECT_GROUP add constraint FK_TM_PROJECT_GROUP_PRO_GROUP foreign key (PARENT_PROJECT_GROUP_ID) references TM_PROJECT_GROUP(ID)^ -- renamed: FK_TM_PROJECT_GROUP_PROJECT_GROUP

------------------------------------------------------------------------------------------------------------

create table TM_PROJECT (
    ID varchar2(32 char),
    NAME varchar2(100 char),
    PROJECT_GROUP_ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    TYPE varchar2(1 char),
    ORGANIZATION_ID varchar2(32 char),
    primary key (ID)
)^

alter table TM_PROJECT add constraint FK_TM_PROJECT_PROJECT_GROUP foreign key (PROJECT_GROUP_ID) references TM_PROJECT_GROUP(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_TASK (
    CARD_ID varchar2(32 char),
    CREATE_DATETIME timestamp,
    CREATE_DATE date,
    NUM varchar2(50 char),
    TASK_NAME varchar2(500 char),
    FULL_DESCR clob,
    HIDDEN char(1),
    PERCENT_COMPLETION numeric(3),
    LABOUR_INTENSITY numeric(5,2),
    DURATION numeric(5,2),
    START_DATETIME_FACT timestamp,
    FINISH_DATE_PLAN date,
    FINISH_DATETIME_PLAN timestamp,
    FINISH_DATE_FACT date,
    FINISH_DATETIME_FACT timestamp,
    TIME_UNIT varchar2(1 char),
    TASK_TYPE_ID varchar2(32 char),
    PRIORITY_ID varchar2(32 char),
    EXECUTOR_ID varchar2(32 char),
    INITIATOR_ID varchar2(32 char),
    START_TASK_TYPE integer,
    CONTROL_ENABLED char(1),
    REFUSE_ENABLED char(1),
    REASSIGN_ENABLED char(1),
    LABOUR_UNIT varchar2(1 char),
    LABOUR_HOUR numeric(7,2),
    CONFIRM_REQUIRED char(1),
    PRIMARY_TASK_ID varchar2(32 char),
    SCHEDULE_TASK_ID varchar2(32 char),
    ORGANIZATION_ID varchar2(32 char),
    PROJECT_ID varchar2(32 char),
    primary key (CARD_ID),

    constraint FK_TM_TASK_PROJECT foreign key (PROJECT_ID) references TM_PROJECT(ID)
)^
alter table TM_TASK add constraint FK_TM_TASK_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TM_TASK add constraint FK_TM_TASK_TASK_TYPE foreign key (TASK_TYPE_ID) references TM_TASK_TYPE(CATEGORY_ID)^
alter table TM_TASK add constraint FK_TM_TASK_PRIORITY foreign key (PRIORITY_ID) references TM_PRIORITY(ID)^
alter table TM_TASK add constraint FK_TM_TASK_EXECUTOR_USER foreign key (EXECUTOR_ID) references SEC_USER(ID)^
alter table TM_TASK add constraint FK_TM_TASK_INITIATOR_USER foreign key (INITIATOR_ID) references SEC_USER(ID)^
alter table TM_TASK add constraint FK_TM_TASK_TASK foreign key (PRIMARY_TASK_ID) references TM_TASK(CARD_ID)^

create index IDX_TM_TASK_CREATE_DATE on TM_TASK (CREATE_DATE)^

------------------------------------------------------------------------------------------------------------

create table TM_TASK_PATTERN_GROUP (
    ID varchar2(32 char),
    NAME varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    ORGANIZATION_ID varchar2(32 char),
    primary key (ID)
)^

------------------------------------------------------------------------------------------------------------

create table TM_TASK_PATTERN (
    PATTERN_NAME varchar2(255 char),
    CARD_ID varchar2(32 char),
    CREATE_DATETIME timestamp,
    CREATE_DATE date,
    NUM varchar2(50 char),
    TASK_NAME varchar2(500 char),
    FULL_DESCR clob,
    HIDDEN char(1),
    PERCENT_COMPLETION numeric(3),
    LABOUR_INTENSITY numeric(5,2),
    DURATION numeric(5,2),
    TIME_UNIT varchar2(1 char),
    LABOUR_UNIT varchar2(1 char),
    START_DATETIME_FACT timestamp,
    FINISH_DATE_PLAN date,
    FINISH_DATETIME_PLAN timestamp,
    FINISH_DATE_FACT date,
    FINISH_DATETIME_FACT timestamp,
    CONTROL_ENABLED char(1),
    REFUSE_ENABLED char(1),
    REASSIGN_ENABLED char(1),
    CONFIRM_REQUIRED char(1),
    START_TASK_TYPE integer,
    TASK_TYPE_ID varchar2(32 char),
    PRIORITY_ID varchar2(32 char),
    GLOBAL char(1),
    ORGANIZATION_ID varchar2(32 char),
    PROJECT_ID varchar2(32 char),
    primary key (CARD_ID),

    constraint FK_TASK_PATTERN_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID)
)^

alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_TASK_TYPE foreign key (TASK_TYPE_ID) references TM_TASK_TYPE(CATEGORY_ID)^
alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_PRIORITY foreign key (PRIORITY_ID) references TM_PRIORITY(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_TASK_PATTERN_GROUP_TASK_PAT ( -- renamed : TM_TASK_PATTERN_GROUP_TASK_PATTERN
    TASK_PATTERN_GROUP_ID varchar2(32 char),
    TASK_PATTERN_ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char)
)^

alter table TM_TASK_PATTERN_GROUP_TASK_PAT add constraint FK_TM_TPG_TP_TASK_PATTERN_GRP
foreign key (TASK_PATTERN_GROUP_ID) references TM_TASK_PATTERN_GROUP(ID)^
alter table TM_TASK_PATTERN_GROUP_TASK_PAT add constraint FK_TM_TPG_TP_TASK_PATTERN
foreign key (TASK_PATTERN_ID) references TM_TASK_PATTERN(CARD_ID)^

create unique index IDX_TM_TPG_TASK_PATTERN_U -- renamed IDX_TM_TASK_PATTERN_GROUP_TASK_PATTERN_U
on TM_TASK_PATTERN_GROUP_TASK_PAT (TASK_PATTERN_GROUP_ID, TASK_PATTERN_ID, DELETE_TS)^

------------------------------------------------------------------------------------------------------------

create table TM_TASK_INFO (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    TASK_ID varchar2(32 char),
    TYPE integer,
    USER_ID varchar2(32 char),
    JBPM_EXECUTION_ID varchar2(255 char),
    ACTIVITY varchar2(255 char),
    primary key (ID)
)^

alter table TM_TASK_INFO add constraint FK_TM_TASK_INFO_TASK foreign key (TASK_ID) references TM_TASK(CARD_ID)^
alter table TM_TASK_INFO add constraint FK_TM_TASK_INFO_USER foreign key (USER_ID) references SEC_USER(ID)^

------------------------------------------------------------------------------------------------------------
create table TS_CARD_ADDITIONAL_INFO (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    CARD_ID varchar2(32 char),
    LAST_ASSIGNMENT_UPDATE_DATE timestamp,
    LAST_CARD_ROLES_UPDATE_DATE timestamp,
    primary key (ID)
)^

alter table TS_CARD_ADDITIONAL_INFO add constraint FK_TS_CARD_ADDIT_INFO_WF_CARD foreign key (CARD_ID) references WF_CARD(ID)^
create index IDX_TS_CARD_ADDIT_INFO_CARD_ID on TS_CARD_ADDITIONAL_INFO (CARD_ID)^

------------------------------------------------------------------------------------------------------------

create table TM_CARD_PROJECT (
    CARD_ID varchar2(32 char),
    PROJECT_ID varchar2(32 char)
)^

alter table TM_CARD_PROJECT add constraint FK_TM_CP_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TM_CARD_PROJECT add constraint FK_TM_CP_PROJECT foreign key (PROJECT_ID) references TM_PROJECT(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_TASK_GROUP_USER (
    USER_ID varchar2(32 char),
    TASK_GROUP_ID varchar2(32 char)
)^

alter table TM_TASK_GROUP_USER add constraint TM_TASK_GROUP_USER_PROFILE foreign key (TASK_GROUP_ID) references TM_TASK_GROUP(ID)^
alter table TM_TASK_GROUP_USER add constraint TM_TASK_GROUP_USER_USER foreign key (USER_ID) references SEC_USER(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_TASK_GROUP_TASK (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    DESCR varchar2(500 char),
    FULL_DESCR clob,
    TASK_TYPE_ID varchar2(32 char),
    PRIORITY_ID varchar2(32 char),
    CONTROLLER_ID varchar2(32 char),
    OBSERVER_ID varchar2(32 char),
    PROJECT_ID varchar2(32 char),
    FINISH_DATE timestamp,
    TASK_ID varchar2(32 char),
    TASK_GROUP_ID varchar2(32 char),
    USER_ID varchar2(32 char),
    INITIATOR_ID varchar2(32 char),
    DURATION numeric(5,2),
    TIME_UNIT varchar2(1 char),
    CREATE_DATETIME timestamp,
    START_DATETIME_FACT timestamp,
    HAS_TASK char(1),
    IS_TASK_FINISHED char(1),
    primary key (ID)
)^

alter table TM_TASK_GROUP_TASK add constraint TM_TASK_GROUP_TASK_PROFILE foreign key (TASK_GROUP_ID) references TM_TASK_GROUP(ID)^
alter table TM_TASK_GROUP_TASK add constraint TM_TASK_GROUP_TASK_TASK foreign key (TASK_ID) references TM_TASK(CARD_ID)^
alter table TM_TASK_GROUP_TASK add constraint TM_TASK_GROUP_TASK_USER foreign key (USER_ID) references SEC_USER(ID)^
alter table TM_TASK_GROUP_TASK add constraint FK_DF_INITIATOR_USER foreign key (INITIATOR_ID) references SEC_USER(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_REMINDER(
    ID varchar2(32 char),
    DURATION integer,
    TIME_UNIT varchar2(1 char),
    REMINDER_DATE timestamp,
    NOTIFIED char(1),
    CARD_ID varchar2(32 char),
    USER_ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    primary key (ID)
)^

alter table TM_REMINDER add constraint FK_TM_REMINDER_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TM_REMINDER add constraint FK_TM_REMINDER_USER foreign key (USER_ID) references SEC_USER(ID)^

------------------------------------------------------------------------------------------------------------

create table DF_NUMERATOR (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    CODE varchar2(255 char),
    LOC_NAME varchar2(2000 char),
    SCRIPT clob,
    SCRIPT_ENABLED char(1),
    NUMERATOR_FORMAT clob,
    PERIODICITY varchar2(1 char),
    NUMBER_INITIAL_VALUE integer default 1,
    primary key (ID)
)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC_KIND (
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    DOC_TYPE_ID varchar2(32 char),
    CODE varchar2(50 char),
    DESCRIPTION varchar2(200 char),
    FIELDS_XML clob,
    NUMERATOR_ID varchar2(32 char),
    NUMERATOR_TYPE integer,
    PREFIX varchar2(100 char),
    CATEGORY_ATTRS_PLACE integer,
    CATEGORY_ID varchar2(32 char),
    USE_ALL_PROCS char(1),
    ORGANIZATION_ID varchar2(32 char),
    TAB_NAME varchar2(30 char),
    CREATE_ONLY_BY_TEMPLATE char(1),
    DISABLE_ADD_PROCESS_ACTORS char(1),
    PORTAL_PUBLISH_ALLOWED char(1),
    AVAILABLE_TO_CREATE_ON_MOB_CL char(1) default 1,
    primary key (CATEGORY_ID)
)^

alter table DF_DOC_KIND add constraint FK_DF_DOC_KIND_NUMERATOR foreign key (NUMERATOR_ID) references DF_NUMERATOR (ID)^
alter table DF_DOC_KIND add constraint DF_DOC_KIND_CATEGORY_ID foreign key (CATEGORY_ID) references SYS_CATEGORY(ID)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC_KIND_WF_PROC (
    CATEGORY_ID varchar2(32 char),
    PROC_ID varchar2(32 char)
)^

alter table DF_DOC_KIND_WF_PROC add constraint DF_DOC_KIND_WF_PROC_C foreign key (CATEGORY_ID) references DF_DOC_KIND(CATEGORY_ID)^
alter table DF_DOC_KIND_WF_PROC add constraint DF_DOC_KIND_WF_PROC_P foreign key (PROC_ID) references WF_PROC(ID)^

------------------------------------------------------------------------------------------------------------

create table TS_CARD_TYPE (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    NAME varchar2(100 char),
    DISCRIMINATOR integer,
    DOC_KIND_ID varchar2(32 char),
    DOC_TEMPLATE_ID varchar2(32 char),
    FIELDS_XML clob,
    primary key (ID)
)^

alter table TS_CARD_TYPE add constraint FK_DF_DOC_TYPE_KIND foreign key (DOC_KIND_ID) references DF_DOC_KIND (CATEGORY_ID)^
alter table DF_DOC_KIND add constraint FK_DF_DOC_KIND_TYPE foreign key (DOC_TYPE_ID) references TS_CARD_TYPE (ID)^
create unique index IDX_TS_CARD_TYPE_NAME_UNIQ on TS_CARD_TYPE (NAME)^

------------------------------------------------------------------------------------------------------------

create table DF_CATEGORY (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    DOC_TYPE_ID varchar2(32 char),
    DOC_KIND_ID varchar2(32 char),
    NAME varchar2(100 char),
    CODE varchar2(100 char),
    ORGANIZATION_ID varchar2(32 char),
    primary key (ID)
)^

alter table DF_CATEGORY add constraint FK_DF_CATEGORY_DOC_KIND foreign key (DOC_KIND_ID) references DF_DOC_KIND (CATEGORY_ID)^
alter table DF_CATEGORY add constraint FK_DF_CATEGORY_DOC_TYPE foreign key (DOC_TYPE_ID) references TS_CARD_TYPE (ID)^

------------------------------------------------------------------------------------------------------------

create table DF_ORGANIZATION (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(200 char),
    FULL_NAME varchar2(200 char),
    INN varchar2(12 char),
    OKPO varchar2(10 char),
    KPP varchar2(9 char),
    POSTAL_ADDRESS varchar2(300 char),
    LEGAL_ADDRESS varchar2(300 char),
    PHONE varchar2(100 char),
    FAX varchar2(100 char),
    EMAIL varchar2(100 char),
    COMMENT_ varchar2(1000 char),
    CODE varchar2(20 char),
    SECRETARY_ID varchar2(32 char),
    HAS_ATTACHMENTS char(1),
    primary key (ID)
)^

alter table DF_ORGANIZATION add constraint FK_DF_ORGANIZATION_SECRETARY foreign key (SECRETARY_ID) references SEC_USER(ID)^
alter table DF_DOC_KIND add constraint fk_DOC_KIND_organization foreign key (organization_id) references DF_ORGANIZATION (id)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC_RECEIVING_METHOD (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(200 char),
    primary key (ID)
)^

------------------------------------------------------------------------------------------------------------

create table DF_CORRESPONDENT (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(255 char),
    TYPE varchar2(1 char),
    ORGANIZATION_ID varchar2(32 char),
    HAS_ATTACHMENTS char(1),
    primary key (ID)
)^

alter table DF_CORRESPONDENT add constraint FK_DF_CORRESPONDENT_ORGANIZAT foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^ -- renamed

------------------------------------------------------------------------------------------------------------

create table DF_CONTRACTOR (
    CORRESPONDENT_ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(200 char),
    INN varchar2(12 char),
    POSTAL_ADDRESS varchar2(300 char),
    LEGAL_ADDRESS varchar2(300 char),
    PHONE varchar2(255 char),
    FAX varchar2(100 char),
    EMAIL varchar2(255 char),
    COMMENT_ varchar2(1000 char),
    WEBSITE varchar2(300 char),
    NON_RESIDENT char(1),
    SUPPLIER char(1),
    CUSTOMER char(1),
    primary key (CORRESPONDENT_ID)
)^

alter table DF_CONTRACTOR add constraint FK_DF_CONTRACTOR_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID)^

------------------------------------------------------------------------------------------------------------

create table DF_COMPANY (
    CONTRACTOR_ID varchar2(32 char),
    FULL_NAME varchar2(500 char),
    OKPO varchar2(10 char),
    OGRN varchar2(15 char),
    KPP varchar2(9 char),
    primary key (CONTRACTOR_ID)
)^

alter table DF_COMPANY add constraint FK_DF_COMPANY_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_INDIVIDUAL (
    CONTRACTOR_ID varchar2(32 char),
    FIRST_NAME varchar2(100 char),
    LAST_NAME varchar2(100 char),
    MIDDLE_NAME varchar2(100 char),
    PASSPORT_NO varchar2(20 char),
    PASSPORT_SERIES varchar2(20 char),
    PASSPORT_GIVEN_BY varchar2(200 char),
    PASSPORT_GIVEN_WHEN date,
    BIRTH_DATE date,
    EGRIP varchar2(15 char),
    primary key (CONTRACTOR_ID)
)^

alter table DF_INDIVIDUAL add constraint FK_DF_INDIVIDUAL_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_CONTACT_PERSON (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(200 char),
    FIRST_NAME varchar2(100 char),
    LAST_NAME varchar2(100 char),
    MIDDLE_NAME varchar2(100 char),
    POSITION varchar2(100 char),
    PHONE varchar2(100 char),
    FAX varchar2(100 char),
    EMAIL varchar2(100 char),
    COMMENT_ varchar2(1000 char),
    COMPANY_ID varchar2(32 char),
    DATIVE_NAME varchar2(300 char),
    DATIVE_POSITION varchar2(100 char),
    SEX varchar2(1 char),
    INITIALS_FIRST char(1),
    primary key (ID)
)^

alter table DF_CONTACT_PERSON add constraint FK_DF_CONTACT_PERSON_COMPANY foreign key (COMPANY_ID) references DF_COMPANY (CONTRACTOR_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_BANK_REGION (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(200 char),
    CODE varchar2(9 char),
    OKATO varchar2(9 char),
    REG_ID varchar2(9 char),
    UPLOAD_FROM_CBR char(1),
    primary key (ID)
)^

------------------------------------------------------------------------------------------------------------

create table DF_BANK (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(200 char),
    BIK varchar2(9 char),
    COR_ACCOUNT varchar2(20 char),
    BANK_REGION_ID varchar2(32 char),
    TYPE varchar2(2 char),
    ADDRESS varchar2(300 char),
    SHORT_NAME varchar2(200 char),
    UPLOAD_FROM_CBR char(1),
    PARENT_BANK_ID varchar2(32 char),
    primary key (ID)
)^

alter table DF_BANK add constraint FK_DF_BANK_BANK_REGION foreign key (BANK_REGION_ID) references DF_BANK_REGION (ID)^
alter table DF_BANK add constraint FK_DF_BANK_PARENT_BANK foreign key (PARENT_BANK_ID) references DF_BANK (ID)^

------------------------------------------------------------------------------------------------------------

create table DF_CURRENCY (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(100 char),
    CODE varchar2(10 char),
    DIGITAL_CODE varchar2(3 char),
    primary key (ID)
)^

------------------------------------------------------------------------------------------------------------

create table DF_CONTRACTOR_ACCOUNT (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NO varchar2(20 char),
    CORRESPONDENT_NO varchar2(20 char),
    COMMENT_ varchar2(1000 char),
    NAME varchar2(200 char),
    CORRESPONDENT varchar2(200 char),
    APPOINTMENT varchar2(500 char),
    CONTRACTOR_ID varchar2(32 char),
    CURRENCY_ID varchar2(32 char),
    BANK_ID varchar2(32 char),
    INDIRECT_CALC_BANK_ID varchar2(32 char),
    TYPE varchar2(1 char),
    primary key (ID)
)^

alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_CONT foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID)^ -- renamed
alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_CURR foreign key (CURRENCY_ID) references DF_CURRENCY (ID)^ -- renamed
alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_BANK foreign key (BANK_ID) references DF_BANK (ID)^
alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_DF_B foreign key (INDIRECT_CALC_BANK_ID) references DF_BANK (ID)^ -- renamed

------------------------------------------------------------------------------------------------------------

create table DF_ORGANIZATION_ACCOUNT (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NO varchar2(20 char),
    CORRESPONDENT_NO varchar2(20 char),
    COMMENT_ varchar2(1000 char),
    NAME varchar2(200 char),
    CORRESPONDENT varchar2(200 char),
    APPOINTMENT varchar2(500 char),
    ORGANIZATION_ID varchar2(32 char),
    CURRENCY_ID varchar2(32 char),
    BANK_ID varchar2(32 char),
    INDIRECT_CALC_BANK_ID varchar2(32 char),
    TYPE varchar2(1 char),
    primary key (ID)
)^

alter table DF_ORGANIZATION_ACCOUNT add constraint FK_DF_ORGANIZATION_ACCOUNT_CO foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^ -- renamed
alter table DF_ORGANIZATION_ACCOUNT add constraint FK_DF_ORGANIZATION_ACCOUNT_CU foreign key (CURRENCY_ID) references DF_CURRENCY (ID)^ -- renamed
alter table DF_ORGANIZATION_ACCOUNT add constraint DF_ORGANIZATION_ACCOUNT_BANK foreign key (BANK_ID) references DF_BANK (ID)^
alter table DF_ORGANIZATION_ACCOUNT add constraint DF_ORGANIZATION_ACCOUNT_DF_BA foreign key (INDIRECT_CALC_BANK_ID) references DF_BANK (ID)^ -- renamed

------------------------------------------------------------------------------------------------------------

create table DF_DEPARTMENT (
    CORRESPONDENT_ID varchar2(32 char),
    CODE varchar2(20 char),
    PARENT_DEPARTMENT_ID varchar2(32 char),
    primary key (CORRESPONDENT_ID)
)^

alter table DF_DEPARTMENT add constraint FK_DF_DEPARTMENT_DEPARTMENT foreign key (PARENT_DEPARTMENT_ID) references DF_DEPARTMENT (CORRESPONDENT_ID)^
alter table DF_DEPARTMENT add constraint FK_DF_DEPARTMENT_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID)^

create index IDX_DF_DEPARTMENT_PARENT on DF_DEPARTMENT(PARENT_DEPARTMENT_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_OFFICE_FILE_NOMENCLATURE (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(200 char),
    INDEX_N varchar2(50 char),
    YEAR numeric(4),
    ARTICLES_LIST varchar2(100 char),
    COMMENT_ clob,
    EC_MARK char(1),
    CATEGORY numeric(1),
    STORAGE_PERIOD numeric(3),
    ORGANIZATION_ID varchar2(32 char),
    PARENT_NOMENCLATURE_ID varchar2(32 char),
    DEPARTMENT_ID varchar2(32 char),
    SUBSTITUTED_CREATOR_ID varchar2(32 char),
    DOC_KIND varchar2(1 char),
    primary key (ID)
)^

alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OF_NOMENCL_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^ -- renamed
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OF_NOMENCL_NOMENCLATURE foreign key (PARENT_NOMENCLATURE_ID) references DF_OFFICE_FILE_NOMENCLATURE(ID)^ -- renamed
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OF_NOMENCL_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT (CORRESPONDENT_ID)^ -- renamed
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OF_NOMENCL_TO_SEC_USER foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^ -- renamed

------------------------------------------------------------------------------------------------------------

create table DF_OFFICE_FILE (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VOLUME_NO varchar2(10 char),
    DATE_FROM date,
    DATE_TO date,
    SHEETS_QTY numeric(5),
    LOCATION varchar2(200 char),
    COMMENT_ clob,
    DISPLAYED_NAME varchar2(500 char),
    STATE integer,
    OFFICE_FILE_NOMENCLATURE_ID varchar2(32 char),
    NUMERATOR_ID varchar2(32 char),
    SUBSTITUTED_CREATOR_ID varchar2(32 char),
    ORGANIZATION_ID varchar2(32 char),
    primary key (ID)
)^

alter table DF_OFFICE_FILE add constraint DF_OFFICE_FILE_NOMENCLATURE foreign key (OFFICE_FILE_NOMENCLATURE_ID) references DF_OFFICE_FILE_NOMENCLATURE(ID)^
alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_NUMERATOR foreign key (NUMERATOR_ID) references DF_NUMERATOR(ID)^
alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_SEC_USER foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^

create unique index IDX_DF_OFFICE_FILE_UNIQ on DF_OFFICE_FILE (VOLUME_NO, OFFICE_FILE_NOMENCLATURE_ID, DELETE_TS)^
create index IDX_OFFICE_FILE_STATE on DF_OFFICE_FILE(state)^

------------------------------------------------------------------------------------------------------------

create table DF_OFF_FILE_NOMENCL_RELATION ( -- renamed: DF_OFFICE_FILE_NOMENCLATURE_RELATION
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),

    DF_OFFICE_FILE_ID varchar2(32 char),
    DF_OFFICE_FILE_NOMENCLATURE_ID varchar2(32 char)
)^

alter table DF_OFF_FILE_NOMENCL_RELATION add constraint DF_OF_N_RELATION_OFFICE_FILE foreign key (DF_OFFICE_FILE_ID) references DF_OFFICE_FILE(ID)^ -- renamed
alter table DF_OFF_FILE_NOMENCL_RELATION add constraint DF_OF_N_RELATION_NOMENCLATURE foreign key (DF_OFFICE_FILE_NOMENCLATURE_ID) references DF_OFFICE_FILE_NOMENCLATURE(ID)^ -- renamed

create index IDX_off_f_nom_rel_OFF_F_ID on DF_OFF_FILE_NOMENCL_RELATION(DF_OFFICE_FILE_ID)^
create index IDX_off_f_nom_rel_OFF_F_NOM_ID on DF_OFF_FILE_NOMENCL_RELATION(DF_OFFICE_FILE_NOMENCLATURE_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_POSITION (
     ID varchar2(32 char),
     CREATE_TS timestamp,
     CREATED_BY varchar2(50 char),
     VERSION integer default 1 not null,
     UPDATE_TS timestamp,
     UPDATED_BY varchar2(50 char),
     DELETE_TS timestamp,
     DELETED_BY varchar2(50 char),
     NAME varchar2(400 char),

     primary key (ID)
)^

create unique index IDX_DF_POSITION_UNIQUENESS on DF_POSITION (upper(NAME), DELETE_TS)^

------------------------------------------------------------------------------------------------------------

create table DF_EMPLOYEE (
    CORRESPONDENT_ID varchar2(32 char),
    NAME varchar2(255 char),
    FIRST_NAME varchar2(255 char),
    LAST_NAME varchar2(255 char),
    MIDDLE_NAME varchar2(255 char),
    POSITION_ID varchar2(32 char),
    PHONE varchar2(100 char),
    FAX varchar2(100 char),
    EMAIL varchar2(100 char),
    COMMENT_ varchar2(1000 char),
    DEPARTMENT_ID varchar2(32 char),
    SEX varchar2(1 char),
    USER_ID varchar2(32 char),
    NUMBER_ varchar2(50 char),
    MOBILE_PHONE varchar2(100 char),
    PHOTO_FILE_ID varchar2(32 char),
    AVATAR_FILE_ID varchar2(32 char),
    MOBILE_AVATAR_FILE_ID varchar2(32 char),
    FACSIMILE_FILE_ID varchar2(32 char),
    BIRTHDAY date,
    EDM_CERTIFICATE_THUMBPRINT varchar2(255 char),
    primary key (CORRESPONDENT_ID)
)^

alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_AVATAR_FILE_ID foreign key (AVATAR_FILE_ID) references SYS_FILE(ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPL_MOB_AVATAR_FILE_ID foreign key (MOBILE_AVATAR_FILE_ID) references SYS_FILE(ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT (CORRESPONDENT_ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_USER foreign key (USER_ID) references SEC_USER (ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_SYS_FILE foreign key (PHOTO_FILE_ID) references SYS_FILE (ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_DF_POSITION foreign key (POSITION_ID) references DF_POSITION(ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_FACSIMILE_F_ID foreign key (FACSIMILE_FILE_ID) references SYS_FILE(ID)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC (
    CARD_ID varchar2(32 char),
    IS_TEMPLATE char(1),
    CREATE_DATE date,
    TEMPLATE_NAME varchar2(200 char),
    VERSION_OF_ID varchar2(32 char),
    DOC_KIND_ID varchar2(32 char),
    CATEGORY_ID varchar2(32 char),
    ORGANIZATION_ID varchar2(32 char),
    NUMBER_ varchar2(50 char),
    DATETIME timestamp,
    DATE_ date,
    OWNER_ID varchar2(32 char),
    DEPARTMENT_ID varchar2(32 char),
    COMMENT_ clob,
    INCOME_DATE date,
    INCOME_NO varchar2(50 char),
    OUTCOME_DATE date,
    OUTCOME_NO varchar2(50 char),
    DOC_OFFICE_DOC_KIND varchar2(1 char),
    RESOLUTION clob,
    REGISTERED char(1),
    DOUBLE_REGISTERED char(1),
    FINISH_DATE_PLAN date,
    OVERDUE char(1),
    GLOBAL char(1),
    REG_NO varchar2(50 char),
    REG_DATE date,
    ENDORSEMENT_START_DATE timestamp,
    ENDORSEMENT_END_DATE timestamp,
    APPROVAL_DATE timestamp,
    ENDORSED char(1),
    AVAILABLE_FOR_ALL char(1),
    THEME varchar2(650 char),
    ARCHIVED char(1),
    PROJECT_ID varchar2(32 char),
    POST_TRACKING_NUMBER varchar2(20 char),
    CONTRACTOR_ID varchar2(32 char),
    AMOUNT numeric(19,2),
    VAT_INCLUSIVE char(1),
    VAT_RATE numeric(19,2),
    VAT_AMOUNT numeric(19,2),
    CURRENCY_ID varchar2(32 char),
    primary key (CARD_ID),

    constraint FK_DF_DOC_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID)
)^

alter table DF_DOC add constraint FK_DF_DOC_CARD foreign key (CARD_ID) references WF_CARD (ID)^

alter table DF_DOC add constraint FK_DF_DOC_VERSION_OF foreign key (VERSION_OF_ID) references WF_CARD (ID)^

alter table DF_DOC add constraint FK_DF_DOC_DOC_KIND foreign key (DOC_KIND_ID) references DF_DOC_KIND (CATEGORY_ID)^

alter table DF_DOC add constraint FK_DF_DOC_CATEGORY foreign key (CATEGORY_ID) references DF_CATEGORY (ID)^

alter table DF_DOC add constraint FK_DF_DOC_EMPLOYEE foreign key (OWNER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^

alter table DF_DOC add constraint FK_DF_DOC_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT (CORRESPONDENT_ID)^

alter table DF_DOC add constraint FK_DF_DOC_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID)^

alter table DF_DOC add constraint FK_DF_DOC_CURRENCY foreign key (CURRENCY_ID) references DF_CURRENCY (ID)^

alter table TS_CARD_TYPE add constraint FK_DF_DOC_TYPE_TEMPLATE foreign key (DOC_TEMPLATE_ID) references DF_DOC(CARD_ID)^

alter table DF_DOC add constraint FK_DF_DOC_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^

create index IDX_DF_DOC_DATE on DF_DOC(DATE_)^

create index IDX_DF_DOC_DATETIME on DF_DOC(DATETIME)^

create index IDX_DF_DOC_REG_DATE on DF_DOC(REG_DATE)^

create index IDX_DF_DOC_REG_NO on DF_DOC(REG_NO)^

create index IDX_DF_DOC_NUMBER on DF_DOC(NUMBER_)^

create index IDX_DF_DOC_OUTCOME_NO on DF_DOC(OUTCOME_NO)^

create index IDX_DF_DOC_INCOME_NO on DF_DOC(INCOME_NO)^

create index IDX_WF_CARD_PARENT_DELETE_TS on WF_CARD(PARENT_CARD_ID, DELETE_TS)^

create index IDX_DF_DOC_TEMPLATE_VERSION on DF_DOC(IS_TEMPLATE, VERSION_OF_ID)^

create index IDX_DOC_TEMPLATE_VERSION_DATE on DF_DOC(IS_TEMPLATE, VERSION_OF_ID, DATE_)^ -- renamed

create index IDX_DOC_TEMPLATE_VERSION_NUM on DF_DOC(IS_TEMPLATE, VERSION_OF_ID, NUMBER_)^ -- renamed

create index idx_doc_archived on DF_DOC(archived)^

create index IDX_DF_DOC_CONTRACTOR on DF_DOC (CONTRACTOR_ID)^

create index IDX_DF_DOC_CURRENCY on DF_DOC (CURRENCY_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_SIMPLE_DOC (
    CARD_ID varchar2(32 char),
    ORDER_TEXT clob,
    DOC_SENDER_ID varchar2(32 char),
    DOC_RECEIVER_ID varchar2(32 char),
    DOC_COPY_RECEIVER_ID varchar2(32 char),
    PORTAL_AUTHOR_NAME varchar2(500 char),
    PORTAL_AUTHOR_EMAIL varchar2(500 char),
    PORTAL_PUBLISH_STATE varchar2(5 char),
    PORTAL_PUBLISH_ERROR_DESC clob, -- renamed
    FROM_PORTAL char(1),
    ORDER_CAUSE varchar2(1000 char),
    primary key (CARD_ID)
)^

alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^
alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_EMPLOYEE_1 foreign key (DOC_SENDER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^
alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_EMPLOYEE_2 foreign key (DOC_RECEIVER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^
alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_EMPLOYEE_3 foreign key (DOC_COPY_RECEIVER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC_EXTRA_FIELD (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    CARD_ID varchar2(32 char),
    FIELD_NAME varchar2(50 char),
    FIELD_VALUE varchar2(1000 char),
    primary key (ID)
)^

alter table DF_DOC_EXTRA_FIELD add constraint FK_DF_DOC_EXTRA_FIELD_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^
alter table DF_DOC_EXTRA_FIELD ADD CONSTRAINT fk_df_doc_extra_field_card_id UNIQUE(CARD_ID, FIELD_NAME)^ -- renamed
------------------------------------------------------------------------------------------------------------

create table DF_CONTRACT (
    CARD_ID varchar2(32 char),
    IS_ACTIVE char(1),
    PAYMENT_CONDITIONS clob,
    LIABILITY_START date,
    LIABILITY_END date,
    NOTIFIED_CREATOR char(1),
    NOTIFIED_OWNER char(1),
    CONTACT_PERSON_ID varchar2(32 char),
    primary key (CARD_ID)
)^

alter table DF_CONTRACT add constraint FK_DF_CONTRACT_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^

alter table DF_CONTRACT add constraint FK_DF_CONTRACT_CONTACT_PERSON foreign key (CONTACT_PERSON_ID) references DF_CONTACT_PERSON(ID)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC_OFFICE_DATA (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    DOC_ID varchar2(32 char),
    RESPONSE_TO_DOC_ID varchar2(32 char),
    SENDER_ID varchar2(32 char),
    OFFICE_FILE_ID varchar2(32 char),
    DOC_RECEIVING_METHOD_ID varchar2(32 char),
    OFFICE_EXECUTOR_ID varchar2(32 char),
    OFFICE_SIGNED_BY_ID varchar2(32 char),
    EMPLOYEE_EXECUTOR_ID varchar2(32 char),
    EMPLOYEE_SIGNED_BY_ID varchar2(32 char),
    RESPONSE_PLAN_DATE date,
    RESPONSE_DATE date,
    primary key (ID)
)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_DOC foreign key (DOC_ID) references DF_DOC(CARD_ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_DOC_RECEIVING_METHOD foreign key (DOC_RECEIVING_METHOD_ID) references DF_DOC_RECEIVING_METHOD(ID)^ -- renamed

alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_RESPONSE_TO_DOC foreign key (RESPONSE_TO_DOC_ID) references DF_DOC(CARD_ID)^ -- renamed

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_SENDER foreign key (SENDER_ID) references DF_CORRESPONDENT(ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID)^ -- renamed

alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_OFFICE_EXECUTOR foreign key (OFFICE_EXECUTOR_ID) references DF_CONTACT_PERSON (ID)^ -- renamed

alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_OFFICE_SIGNED_BY foreign key (OFFICE_SIGNED_BY_ID) references DF_CONTACT_PERSON (ID)^ -- renamed

alter table DF_DOC_OFFICE_DATA add constraint DF_DDOFD_EMPLOYEE_EXECUTOR foreign key (EMPLOYEE_EXECUTOR_ID) references DF_EMPLOYEE(CORRESPONDENT_ID)^ -- renamed

alter table DF_DOC_OFFICE_DATA add constraint FK_DDOFD_EMPLOYEE_SIGNED_BY foreign key (EMPLOYEE_SIGNED_BY_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^ -- renamed

------------------------------------------------------------------------------------------------------------

create table DF_DOC_TRANSFER_LOG (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    TYPE integer,
    DOC_OFFICE_DATA_ID varchar2(32 char),
    EMPLOYEE_ID varchar2(32 char),
    TRANSFER_DATE timestamp,
    RETURN_DATE timestamp,
    RETURNED char(1),
    COMMENT_ clob,
    primary key (ID)
)^

alter table DF_DOC_TRANSFER_LOG add constraint FK_DF_DTL_DOC_OFFICE_DATA foreign key (DOC_OFFICE_DATA_ID) references DF_DOC_OFFICE_DATA (ID)^
alter table DF_DOC_TRANSFER_LOG add constraint FK_DF_DTL_EMPLOYEE foreign key (EMPLOYEE_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_APP_INTEGRATION_LOG (
      ID varchar2(32 char) not null,
      CREATE_TS timestamp,
      CREATED_BY varchar2(50 char),
      VERSION integer default 1 not null,
      UPDATE_TS timestamp,
      UPDATED_BY varchar2(50 char),
      DELETE_TS timestamp,
      DELETED_BY varchar2(50 char),
      CHANGE_TYPE varchar2(10 char),
      ENTITY_NAME varchar2(100 char),
      ENTITY_ID varchar2(32 char),
      CHANGES_SET_ID varchar2(100 char),
      INTEGRATION_STATE integer,
      INTEGRATION_STATE_DATE timestamp,
      primary key (ID)
)^

create index IDX_DFAIL_INTEGRATION_LOG on DF_APP_INTEGRATION_LOG (ENTITY_NAME, ENTITY_ID)^ -- renamed
create index IDX_DFAIL_CHANGES_SET_STATE on DF_APP_INTEGRATION_LOG (CHANGES_SET_ID, INTEGRATION_STATE)^  -- renamed

------------------------------------------------------------------------------------------------------------

create table DF_APP_INTEGRATION_LINK_ENTITY (
      ID varchar2(32 char) not null,
      CREATE_TS timestamp,
      CREATED_BY varchar2(50 char),
      VERSION integer default 1 not null,
      UPDATE_TS timestamp,
      UPDATED_BY varchar2(50 char),
      DELETE_TS timestamp,
      DELETED_BY varchar2(50 char),
      ENTITY_NAME varchar2(100 char),
      ENTITY_ID varchar2(32 char),
      EXTERNAL_ID varchar2(100 char),
      primary key (ID)
)^

create index IDX_DFAILE_ENT_NAME_ENT_ID on DF_APP_INTEGRATION_LINK_ENTITY (ENTITY_NAME, ENTITY_ID)^ -- renamed

create index IDX_DFAILE_ENT_NAME_EXTERNAL on DF_APP_INTEGRATION_LINK_ENTITY (ENTITY_NAME, EXTERNAL_ID)^ -- renamed

------------------------------------------------------------------------------------------------------------

alter table WF_ATTACHMENT add TASK_GROUP_ID varchar2(32 char)^
alter table WF_ATTACHMENT add constraint FK_WF_ATTACHMENT_TASK_GROUP foreign key (TASK_GROUP_ID) references TM_TASK_GROUP (ID)^

alter table wf_card_role add readonly char(1)^

------------------------------------------------------------------------------------------------------------

create table TM_SCHEDULE_TASK (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(100 char),
    DESCRIPTION varchar2(1000 char),
    START_IF_FAILED char(1),
    SUBSTITUTED_CREATOR_ID varchar2(32 char),
    ORGANIZATION_ID varchar2(32 char),
    primary key (ID)
)^

alter table TM_SCHEDULE_TASK add constraint FK_TM_SCHED_TASK_TO_SEC_USER foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^ -- renamed
alter table TM_TASK add constraint FK_TM_TASK_SCHED_TASK_ID foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID)^  -- renamed
alter table TM_SCHEDULE_TASK add constraint FK_TM_SCHED_TASK_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^ -- renamed

---------------------------------------------------------------------------------------------------

create table TM_SCHEDULE_TRIGGER (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    TIME_UNITS_QTY numeric(3),
    DAYS_OF_WEEK varchar2(16 char),
    MONTHS varchar2(39 char),
    DAYS varchar2(100 char),
    WEEK_NUMBERS varchar2(10 char),
    ACTIVE char(1),
    NEXT_START_DATE timestamp,
    START_DATE timestamp,
    TIME_UNIT varchar2(1 char),
    TYPE varchar2(2 char),
    SCHEDULE_TASK_ID varchar2(32 char),
    USE_WORK_CALENDAR char(1),
    primary key (ID)
)^

alter table TM_SCHEDULE_TRIGGER add constraint FK_TM_S_TRIGGER_SCHEDULE_TASK foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID)^ -- renamed

---------------------------------------------------------------------------------------------------

create table TM_SCHEDULE_ACTION_TYPE (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(100 char),
    SCREEN_ID varchar2(100 char),
    ENTITY_NAME varchar2(100 char),
    PROCESSOR_CLASS_NAME varchar2(200 char),
    primary key (ID)
)^

---------------------------------------------------------------------------------------------------

create table TM_SCHEDULE_ACTION (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    ACTION_NAME varchar2(500 char),
    SCHEDULE_TASK_ID varchar2(32 char),
    SCHEDULE_ACTION_TYPE_ID varchar2(32 char),
    DISCRIMINATOR integer,
    primary key (ID)
)^

alter table TM_SCHEDULE_ACTION add constraint FK_TM_SA_SCHEDULE_TASK foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID)^  -- renamed
alter table TM_SCHEDULE_ACTION add constraint FK_TM_SA_SCHEDULE_ACTION_TYPE foreign key (SCHEDULE_ACTION_TYPE_ID) references TM_SCHEDULE_ACTION_TYPE(ID)^  -- renamed

---------------------------------------------------------------------------------------------------

create table TM_START_TASK_SCHEDULE_ACTION (
    SCHEDULE_ACTION_ID varchar2(32 char),
    TASK_PATTERN_ID varchar2(32 char),
    SCRIPT clob,
    NOTIFY_INITIATOR char(1),
    SCRIPT_ENABLED char(1),
    ORGANIZATION_ID varchar2(32 char),
    primary key (SCHEDULE_ACTION_ID)
)^

alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TM_STSA_SCHEDULE_ACTION foreign key (SCHEDULE_ACTION_ID) references TM_SCHEDULE_ACTION(ID)^ -- renamed
alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TM_STSA_TASK_PATTERN foreign key (TASK_PATTERN_ID) references TM_TASK_PATTERN(CARD_ID)^ -- renamed

---------------------------------------------------------------------------------------------------

create table TM_SCHEDULE_ACTION_LOG (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    LOG_DATE timestamp,
    MESSAGE clob,
    SCHEDULE_ACTION_ID varchar2(32 char),
    IS_ERROR char(1),
    primary key (ID)
)^

alter table TM_SCHEDULE_ACTION_LOG add constraint FK_TM_SAL_SCHEDULE_ACTION foreign key (SCHEDULE_ACTION_ID) references TM_SCHEDULE_ACTION(ID)^ -- renamed

---------------------------------------------------------------------------------------------------

create table DF_TYPICAL_RESOLUTION (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(500 char),
    TEXT clob,
    GLOBAL char(1),
    CREATOR_ID varchar2(32 char),
    SUBSTITUTED_CREATOR_ID varchar2(32 char),
    ORGANIZATION_ID varchar2(32 char),
    primary key (ID)
)^


alter table DF_TYPICAL_RESOLUTION add constraint FK_DF_TR_CREATOR
foreign key (CREATOR_ID) references SEC_USER(ID)^  -- renamed
alter table DF_TYPICAL_RESOLUTION add constraint FK_DF_TR_SUBSTITUTED_CREATOR
foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^  -- renamed

---------------------------------------------------------------------------------------------------

create table WF_CARD_USER_INFO (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    CARD_ID varchar2(32 char),
    USER_ID varchar2(32 char),
    IS_IMPORTANT char(1),
    primary key (ID)
)^

alter table WF_CARD_USER_INFO add constraint FK_WF_CARD_USER_INFO_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table WF_CARD_USER_INFO add constraint FK_WF_CARD_USER_INFO_USER foreign key (USER_ID) references SEC_USER(ID)^

create table DF_DOC_OFFICE_DATA_ADDRESSEE (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    DOC_OFFICE_DATA_ID varchar2(32 char),
    CORRESPONDENT_ID varchar2(32 char),
    CONTACT_PERSON_ID varchar2(32 char),
    primary key (ID)
)^

alter table DF_DOC_OFFICE_DATA_ADDRESSEE add constraint FK_DF_DOC_OFFICE_DATA foreign key (DOC_OFFICE_DATA_ID) references DF_DOC_OFFICE_DATA(ID)^

alter table DF_DOC_OFFICE_DATA_ADDRESSEE add constraint FK_DF_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID)^

alter table DF_DOC_OFFICE_DATA_ADDRESSEE add constraint FK_DF_CONTACT_PERSON foreign key (CONTACT_PERSON_ID) references DF_CONTACT_PERSON(ID)^

create index IDX_DDODA_DOC_OFFICE_DATA on DF_DOC_OFFICE_DATA_ADDRESSEE(DOC_OFFICE_DATA_ID)^  -- renamed

create index IDX_WF_CARD_USER_INFO_CARD on WF_CARD_USER_INFO(card_id)^
create index IDX_WF_CARD_USER_INFO_USER on WF_CARD_USER_INFO(user_id, delete_ts)^

---------------------------------------------------------------------------------------------------

create table TS_CARD_ACL (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    CARD_ID varchar2(32 char),
    TEMPLATE_ID varchar2(32 char),
    ENTITY varchar2(100 char),
    USER_ID varchar2(32 char),
    CARD_ROLE_ID varchar2(32 char),
    ORGANIZATION_ID varchar2(32 char),
    GLOBAL char(1),
    DESCRIPTION varchar2(1000 char),
    DEPARTMENT_ID varchar2(32 char),
    CODE integer,
    BASE_ACL_ID varchar2(32 char),
    primary key (ID)
)^

alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_WF_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_TEMPLATE_CARD foreign key (TEMPLATE_ID) references WF_CARD(ID)^  -- renamed
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_SEC_USER foreign key (USER_ID) references SEC_USER(ID)^
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_WF_CARD_ROLE foreign key (CARD_ROLE_ID) references WF_CARD_ROLE(ID)^
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_DF_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_DF_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_CORRESPONDENT(ID)^
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_BASE_CARD_ACL foreign key (BASE_ACL_ID) references TS_CARD_ACL(ID)^


create index IDX_TS_CARD_ACL_WF_CARD on TS_CARD_ACL(CARD_ID)^
create index IDX_TS_CARD_ACL_TEMPLATE_CARD on TS_CARD_ACL(TEMPLATE_ID)^ -- renamed
create index IDX_TS_CARD_ACL_SEC_USER on TS_CARD_ACL(USER_ID)^
create index IDX_TS_CARD_ACL_WF_CARD_ROLE on TS_CARD_ACL(CARD_ROLE_ID)^
create index IDX_TS_CARD_ACL_ORGANIZATION on TS_CARD_ACL(ORGANIZATION_ID)^ -- renamed
create index IDX_TS_CARD_ACL_DF_DEPARTMENT on TS_CARD_ACL(DEPARTMENT_ID)^
create index IDX_BASE_ACL_ID on TS_CARD_ACL(BASE_ACL_ID)^


create index IDX_TS_CARD_ACL_GLOBAL on TS_CARD_ACL(GLOBAL)^

---------------------------------------------------------------------------------------------------
create table DF_SHORT_URL (
       ID varchar2(32 char),
       CREATE_TS timestamp,
       CREATED_BY varchar2(50 char),
       VERSION integer default 1 not null,
       UPDATE_TS timestamp,
       UPDATED_BY varchar2(50 char),
       DELETE_TS timestamp,
       DELETED_BY varchar2(50 char),

       LONG_URL varchar2(1000 char),
       SHORT_URL varchar2(100 char),

       primary key (ID)
 )^

 create index IDX_DSU_LONG_URL_DELETE_TS on DF_SHORT_URL(LONG_URL, DELETE_TS)^ -- renamed
 create index IDX_DSU_SHORT_URL_DELETE_TS on DF_SHORT_URL(SHORT_URL, DELETE_TS)^ -- renamed

---------------------------------------------------------------------------------------------------

create table TM_MPP_RESOURCE_USER (
       ID varchar2(32 char),
       CREATE_TS timestamp,
       CREATED_BY varchar2(50 char),
       VERSION integer default 1 not null,
       UPDATE_TS timestamp,
       UPDATED_BY varchar2(50 char),
       DELETE_TS timestamp,
       DELETED_BY varchar2(50 char),
       RESOURCE_NAME varchar2(256 char),
       USER_ID varchar2(32 char),
       primary key(ID)
)^

alter table TM_MPP_RESOURCE_USER add constraint FK_TM_MPP_RESOURCE_USER_USER foreign key (USER_ID) references SEC_USER (ID)^

---------------------------------------------------------------------------------------------------

create table DF_EMPLOYEE_DEPARTMENT_POS ( -- renamed DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION
  ID varchar2(32 char) not null,
  CREATE_TS timestamp,
  CREATED_BY varchar2(50 char),
  UPDATE_TS timestamp,
  UPDATED_BY varchar2(50 char),
  DELETE_TS timestamp,
  DELETED_BY varchar2(50 char),

  EMPLOYEE_ID varchar2(32 char),
  DEPARTMENT_ID varchar2(32 char),
  POSITION_ID varchar2(32 char),
  IS_MAIN char(1),

  primary key (ID)
)^

alter table DF_EMPLOYEE_DEPARTMENT_POS add constraint FK_DEDP_ACCOUNT_DF_EMPLOYEE foreign key (EMPLOYEE_ID) references DF_EMPLOYEE(correspondent_id)^ -- renamed
alter table DF_EMPLOYEE_DEPARTMENT_POS add constraint FK_DEDP_DF_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT(CORRESPONDENT_ID)^ -- renamed
alter table DF_EMPLOYEE_DEPARTMENT_POS add constraint FK_DEDP_ACCOUNT_DF_POSITION foreign key (POSITION_ID) references DF_POSITION(ID)^ -- renamed

create index IDX_DEDP_EMPLOYEE on DF_EMPLOYEE_DEPARTMENT_POS(EMPLOYEE_ID)^ -- renamed
create index IDX_DEDP_DELETE_TS on DF_EMPLOYEE_DEPARTMENT_POS(DEPARTMENT_ID, DELETE_TS)^ -- renamed
---------------------------------------------------------------------------------------------------

create table DF_IMPORT_DATA_TYPE(
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    NAME varchar2(100 char),
    META_CLASS_NAME varchar2(50 char),
    SCRIPT_FILE_ID varchar2(32 char),
    PATTERN_FILE_ID varchar2(32 char),
    primary key (ID)
)^

alter table DF_IMPORT_DATA_TYPE add constraint FK_DIDT_SCRIPT_FILE foreign key (SCRIPT_FILE_ID) references SYS_FILE (ID)^ -- renamed
alter table DF_IMPORT_DATA_TYPE add constraint FK_DIDT_PATTERN_FILE foreign key (PATTERN_FILE_ID) references SYS_FILE (ID)^ -- renamed

---------------------------------------------------------------------------------------------------

create table DF_IMPORT_DATA_ATTR(
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    IMPORT_DATA_TYPE_ID varchar2(32 char),
    CELL_NAME varchar2(100 char),
    PROPERTY_NAME varchar2(100 char),
    FIELD_TYPE varchar2(100 char),
    primary key (ID)
)^

alter table DF_IMPORT_DATA_ATTR add constraint FK_DIDA_DATA_TYPE foreign key (IMPORT_DATA_TYPE_ID) references DF_IMPORT_DATA_TYPE(ID)^ -- renamed

---------------------------------------------------------------------------------------------------

create table TS_IMPORT_ENTITY_INFO (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    IMPORT_ID varchar2(32 char),
    ENTITY_NAME varchar2(100 char),
    ENTITY_ID varchar2(32 char),
    primary key (ID)
)^

create index IDX_TIEI_IMPORT_ID on TS_IMPORT_ENTITY_INFO (IMPORT_ID)^ -- renamed

---------------------------------------------------------------------------------------------------

create table TM_LAZY_LOAD_ATTACHMENT (
    ID varchar2(32 char),
    FILE_ID varchar2(32 char),
    HAS_FILE char(1),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    primary key (ID)
)^

alter table TM_LAZY_LOAD_ATTACHMENT add constraint TM_LAZY_LOAD_ATTACHM_FILE_ID foreign key (FILE_ID) references SYS_FILE (ID)^  -- renamed

---------------------------------------------------------------------------------------------------

create table DF_SUB_CARD_INFO (
      ID varchar2(32 char) not null,
      CREATE_TS timestamp,
      CREATED_BY varchar2(50 char),
      SUB_CARD_ID varchar2(32 char) not null,
      PARENT_CARD_ID varchar2(32 char) not null,
      SUB_CARD_CREATED_ASSIGNMENT_ID varchar2(32 char),
      RESOLUTION_ASSIGNMENT_ID varchar2(32 char),
      ACTIVE char(1),
      TYPE varchar2(1 char),
      primary key (ID)
)^

alter table DF_SUB_CARD_INFO add constraint FK_DF_SUB_CARD_INFO_SUB_CARD foreign key (SUB_CARD_ID) references WF_CARD(ID)^
alter table DF_SUB_CARD_INFO add constraint FK_DSCI_PARENT_CARD foreign key (PARENT_CARD_ID) references WF_CARD(ID)^ -- renamed
alter table DF_SUB_CARD_INFO add constraint FK_DSCI_RESOLUTION_ASSIGNMENT foreign key (RESOLUTION_ASSIGNMENT_ID) references WF_ASSIGNMENT(ID)^ -- renamed
alter table DF_SUB_CARD_INFO add constraint FK_DSCI_CREATED_ASSIGNMENT foreign key (SUB_CARD_CREATED_ASSIGNMENT_ID) references WF_ASSIGNMENT(ID)^ -- renamed

---------------------------------------------------------------------------------------------------

alter table SEC_USER add ORGANIZATION_ID varchar2(32 char)^
alter table SEC_USER add IS_MOBILE char(1)^
alter table SEC_USER add DEPARTMENT_CODE varchar2(20 char)^
alter table SEC_USER add ACTIVE_DIRECTORY_ID varchar2(255 char)^
alter table SEC_USER add USE_ACTIVE_DIRECTORY char(1)^

UPDATE SEC_USER SET IS_MOBILE=0^
alter table WF_USER_GROUP add ORGANIZATION_ID varchar2(32 char)^

---------------------------------------------------------------------------------------------------

create table DF_RESERVATION_NUMBER (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    ------------------
    OFFICE_FILE_ID varchar2(32 char),
    NUMERATOR_ID varchar2(32 char),
    DOC_ID varchar2(32 char),
    SHORT_URL_ID varchar2(32 char),
    ATTACHMENT_ID varchar2(32 char),
    ORGANIZATION_ID varchar2(32 char),
    NUMBER_ varchar2(50 char),
    DATE_RESERV date,
    DATE_REGISTR date,
    STATE integer,
    COMMENT_ clob,
    primary key (ID)
)^

alter table DF_RESERVATION_NUMBER add constraint FK_DRN_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID)^ -- renamed
alter table DF_RESERVATION_NUMBER add constraint FK_DRN_NUMERATOR foreign key (NUMERATOR_ID) references DF_NUMERATOR(ID)^ -- renamed
alter table DF_RESERVATION_NUMBER add constraint FK_DRN_NUMBER_DOC foreign key (DOC_ID) references DF_DOC(CARD_ID)^ -- renamed
alter table DF_RESERVATION_NUMBER add constraint FK_DRN_ATTACH foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID)^ -- renamed
alter table DF_RESERVATION_NUMBER add constraint FK_DRN_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^ -- renamed

create table TS_OFFICE_FILE_TRANSFER_LOG (
     ID varchar2(32 char),
     CREATE_TS timestamp,
     CREATED_BY varchar2(50 char),
     VERSION integer default 1 not null,
     UPDATE_TS timestamp,
     UPDATED_BY varchar2(50 char),
     DELETE_TS timestamp,
     DELETED_BY varchar2(50 char),

     ISSUED_BY varchar2(32 char) not null,
     RECEIVER_ID varchar2(32 char) not null,
     OFFICE_FILE_ID varchar2(32 char) not null,
     TRANSFER_DATE date,
     DUE_DATE date,
     RETURN_DATE date,
     COMMENT_ varchar2(1000 char),
     OVERDUE_NOTIFIED char(1),

     primary key(ID),
     constraint FK_OFTL_RECEIVER foreign key (RECEIVER_ID) references DF_CORRESPONDENT(ID),
     constraint FK_OFTL_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID),
     constraint FK_OFTL_ISSUED_BY foreign key (ISSUED_BY) references SEC_USER(ID)
)^

---------------------------------------------------------------------------------------------------

create table DF_DOC_KIND_REPORT_REPORT (
    ID varchar2(32 char),
    CATEGORY_ID varchar2(32 char),
    REPORT_ID varchar2(32 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
     --
    primary key (ID)
)^

alter table DF_DOC_KIND_REPORT_REPORT add constraint FK_DOC_KIND_REPORT_DOC_KIND foreign key (CATEGORY_ID) references DF_DOC_KIND(CATEGORY_ID)^
alter table DF_DOC_KIND_REPORT_REPORT add constraint FK_DOC_KIND_REPORT_REPORT foreign key (REPORT_ID) references REPORT_REPORT(ID)^

---------------------------------------------------------------------------------------------------

create INDEX IDX_SEC_SCREEN_HISTORY_CR_US ON SEC_SCREEN_HISTORY (CREATE_TS, USER_ID)^ -- renamed

---------------------------------------------------------------------------------------------------

create table DF_MEETING_DOC (
    CARD_ID varchar2(32 char),
    --
    TARGET varchar2(500 char),
    PLACE varchar2(500 char),
    CHAIRMAN_ID varchar2(32 char),
    SECRETARY_ID varchar2(32 char),
    INITIATOR_ID varchar2(32 char),
    DURATION integer,
    STATUS integer,
    TIME_UNIT varchar2(1 char),
    MEETING_COMMENT varchar2 (1000 char),
    --
    primary key (CARD_ID)
)^

alter table DF_MEETING_DOC add constraint FK_DF_MEETING_DOC_CHAIRMAN_ID foreign key (CHAIRMAN_ID) references SEC_USER(ID)^
alter table DF_MEETING_DOC add constraint FK_DF_MEETING_DOC_SECRETARY_ID foreign key (SECRETARY_ID) references SEC_USER(ID)^
alter table DF_MEETING_DOC add constraint FK_DF_MEETING_DOC_INITIATOR_ID foreign key (INITIATOR_ID) references SEC_USER(ID)^
alter table DF_MEETING_DOC add constraint FK_DF_MEETING_DOC_CARD_ID foreign key (CARD_ID) references DF_DOC(CARD_ID)^
create index IDX_DF_MEETING_DOC_SECRETARY on DF_MEETING_DOC (SECRETARY_ID)^
create index IDX_DF_MEETING_DOC_CHAIRMAN on DF_MEETING_DOC (CHAIRMAN_ID)^
create index IDX_DF_MEETING_DOC_INITIATOR on DF_MEETING_DOC (INITIATOR_ID)^

---------------------------------------------------------------------------------------------------

create table DF_MEETING_QUESTION (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    NUMBER_ integer,
    QUESTION varchar2(500 char),
    SPEAKER_ID varchar2(32 char),
    DURATION integer,
    COMMENT_ varchar2(1000 char),
    MEETING_DOC_ID varchar2(32 char),
    TIME_UNIT varchar2(1 char),
    --
    primary key (ID)
)^

alter table DF_MEETING_QUESTION add constraint FK_DMQ_SPEAKER_ID foreign key (SPEAKER_ID) references SEC_USER(ID)^ -- renamed
alter table DF_MEETING_QUESTION add constraint FK_DMQ_MEETING_DOC_ID foreign key (MEETING_DOC_ID) references DF_MEETING_DOC(CARD_ID)^ -- renamed
create index IDX_DMQ_MEETING_DOC on DF_MEETING_QUESTION (MEETING_DOC_ID)^ -- renamed
create index IDX_DMQ_SPEAKER on DF_MEETING_QUESTION (SPEAKER_ID)^ -- renamed

---------------------------------------------------------------------------------------------------

create table DF_SOLUTION (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    SOLUTION varchar2(1000 char),
    QUESTION_ID varchar2(32 char),
    EXECUTOR_ID varchar2(32 char),
    INITIATOR_ID varchar2(32 char),
    CONTROLLER_ID varchar2(32 char),
    OBSERVER_ID varchar2(32 char),
    TASK_ID varchar2(32 char),
    MEETING_DOC_ID varchar2(32 char),
    FINISH_DATE_PLAN timestamp,
    COMMENT_ varchar2(1000 char),
    TASK_TYPE_ID varchar2(32 char),
    PRIORITY_ID varchar2(32 char),
    PROJECT_ID varchar2(32 char),

    --
    primary key (ID)
)^

alter table DF_SOLUTION add constraint FK_DF_SOLUTION_QUESTION_ID foreign key (QUESTION_ID) references DF_MEETING_QUESTION(ID)^
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_EXECUTOR_ID foreign key (EXECUTOR_ID) references SEC_USER(ID)^
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_INITIATOR_ID foreign key (INITIATOR_ID) references SEC_USER(ID)^
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_CONTROLLER_ID foreign key (CONTROLLER_ID) references SEC_USER(ID)^
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_OBSERVER_ID foreign key (OBSERVER_ID) references SEC_USER(ID)^
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_TASK_ID foreign key (TASK_ID) references TM_TASK(CARD_ID)^
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_MEETING_DOC_ID foreign key (MEETING_DOC_ID) references DF_MEETING_DOC(CARD_ID)^
create index IDX_DF_SOLUTION_MEETING_DOC on DF_SOLUTION (MEETING_DOC_ID)^
create index IDX_DF_SOLUTION_CONTROLLER on DF_SOLUTION (CONTROLLER_ID)^
create index IDX_DF_SOLUTION_OBSERVER on DF_SOLUTION (OBSERVER_ID)^
create index IDX_DF_SOLUTION_TASK on DF_SOLUTION (TASK_ID)^
create index IDX_DF_SOLUTION_EXECUTOR on DF_SOLUTION (EXECUTOR_ID)^
create index IDX_DF_SOLUTION_QUESTION on DF_SOLUTION (QUESTION_ID)^
create index IDX_DF_SOLUTION_INITIATOR on DF_SOLUTION (INITIATOR_ID)^

---------------------------------------------------------------------------------------------------

create table DF_MEETING_PARTICIPANT (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    USER_ID varchar2(32 char),
    OUTER_ clob, -- decrease
    EMAIL varchar2(255 char),
    CONTACT_PERSON_ID varchar2(32 char),
    MEETING_DOC_ID varchar2(32 char),
    CONTRACTOR_ID varchar2(32 char),
    --
    primary key (ID)
)^

alter table DF_MEETING_PARTICIPANT add constraint FK_DMP_USER_ID foreign key (USER_ID) references SEC_USER(ID)^  -- renamed
alter table DF_MEETING_PARTICIPANT add constraint FK_DMP_CONTACT_PERSON_ID foreign key (CONTACT_PERSON_ID) references DF_CONTACT_PERSON(ID)^  -- renamed
alter table DF_MEETING_PARTICIPANT add constraint FK_DMP_MEETING_DOC_ID foreign key (MEETING_DOC_ID) references DF_MEETING_DOC(CARD_ID)^  -- renamed
alter table DF_MEETING_PARTICIPANT add constraint FK_DMP_CONTRACTOR_ID foreign key (CONTRACTOR_ID) references DF_CONTRACTOR(CORRESPONDENT_ID)^  -- renamed
create index IDX_DMP_MEETING_DOC on DF_MEETING_PARTICIPANT (MEETING_DOC_ID)^  -- renamed
create index IDX_DMP_CONTACTOR on DF_MEETING_PARTICIPANT (CONTACT_PERSON_ID)^  -- renamed
create index IDX_DMP_USER on DF_MEETING_PARTICIPANT (USER_ID)^  -- renamed
create index IDX_DMP_CONTRACTOR on DF_MEETING_PARTICIPANT (CONTRACTOR_ID)^  -- renamed

---------------------------------------------------------------------------------------------------

create table TS_CALENDAR_LINK (
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    ID varchar2(32 char) not null,
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    USER_ID varchar2(32 char),
    ICS_NAME varchar2(255 char),
    primary key (ID)
)^

alter table TS_CALENDAR_LINK add constraint FK_TCL_TO_SEC_USER   -- renamed
foreign key (USER_ID) references SEC_USER(ID)^

---------------------------------------------------------------------------------------------------

alter table REPORT_REPORT add OVERWRITE_BY_INIT char(1)^

---------------------------------------------------------------------------------------------------

alter table SEC_GROUP add AD_GROUP_NAME varchar2(255 char)^
alter table SEC_GROUP add LOC_NAME varchar2(2000 char)^
alter table SEC_ROLE add AD_GROUP_NAME varchar2(255 char)^

---------------------------------------------------------------------------------------------------

create table TS_CALENDAR_EVENT_ITEM (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    START_TIME timestamp,
    END_TIME timestamp,
    CARD_ID varchar2(32 char),
    PARENT_ENTITY_NAME varchar2(100 char),
    PARENT_ENTITY_ID varchar2(100 char),
    primary key (ID)
)^
alter table TS_CALENDAR_EVENT_ITEM add constraint FK_TCEI_TO_WF_CARD foreign key (CARD_ID) references WF_CARD(ID)^     -- renamed

create index IDX_TCEI_PARENT_ENTITY_ID on TS_CALENDAR_EVENT_ITEM (PARENT_ENTITY_ID)^   -- renamed
create index IDX_TCEI_CARD_ID on TS_CALENDAR_EVENT_ITEM (CARD_ID)^   -- renamed

create table TS_CALENDAR_EVENT_PARTICIPANT (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    USER_ID varchar2(32 char),
    CALENDAR_EVENT_ITEM_ID varchar2(32 char),
    primary key (ID)
)^
alter table TS_CALENDAR_EVENT_PARTICIPANT add constraint FK_TCEP_TO_SEC_USER foreign key (USER_ID) references SEC_USER(ID)^   -- renamed
alter table TS_CALENDAR_EVENT_PARTICIPANT add constraint FK_TCEP_TO_CALENDAR_EVENT_ITEM   -- renamed
    foreign key (CALENDAR_EVENT_ITEM_ID) references TS_CALENDAR_EVENT_ITEM(ID)^

create index IDX_TCEP_USER_ID on TS_CALENDAR_EVENT_PARTICIPANT (USER_ID)^   -- renamed
create index IDX_PARTICIPANT_ITEM on TS_CALENDAR_EVENT_PARTICIPANT (CALENDAR_EVENT_ITEM_ID)^

---------------------------------------------------------------------------------------------------

alter table WF_PROC_APP_FOLDER add OVERWRITE_BY_INIT char(1)^
alter table WF_PROC_APP_FOLDER add CARDS_SELECT_SCRIPT clob^
---------------------------------------------------------------------------------------------------

create table TS_MOBILE_CLIENT_CARD_METADATA (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    ENTITY_NAME varchar2(255 char),
    NAME varchar2(255 char),
    PROPERTIES clob,
    primary key (ID)
) ^

create table TS_MOB_CLIENT_REF_METADATA (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    ENTITY_NAME varchar2(255 char),
    primary key (ID)
) ^

create table TS_MOB_CLIENT_ENTITY_UPD_LOG (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    ENTITY_NAME varchar2(255 char),
    ENTITY_ID varchar2(32 char),
    UPDATE_TS timestamp,
    primary key (ID)
) ^

CREATE INDEX IDX_MOB_ENT_UPD_LOG_ENT_NAME
  ON TS_MOB_CLIENT_ENTITY_UPD_LOG (ENTITY_NAME) ^
CREATE INDEX IDX_MOB_ENT_UPD_LOG_ENT_ID
  ON TS_MOB_CLIENT_ENTITY_UPD_LOG (ENTITY_ID) ^

CREATE INDEX IDX_MOB_LOG_ENT_NAME_ENT_ID ON TS_MOB_CLIENT_ENTITY_UPD_LOG (ENTITY_NAME, ENTITY_ID)^

create table TS_MOB_CL_CARD_LOG_UPD_TASK (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    CARD_ENTITY_NAME varchar2(255 char),
    REFERENCE_ENTITY_PROPERTY_PATH varchar2(1000 char),
    REFERENCE_ENTITY_ID varchar2(32 char),
    primary key (ID)
) ^

create table TS_MOBILE_CLIENT_ACTION_LOG (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    --
    USER_ID varchar2(32 char),
    --
    primary key (ID)
) ^

-- Copy-pasted from cuba v6.5 needs to be removed after migration to the one of the latest platform version.
-- Migrate this to the SYS_REST_API_TOKEN
create table TS_REST_API_TOKEN (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    --
    ACCESS_TOKEN_VALUE varchar2(255 char),
    ACCESS_TOKEN_BYTES blob,
    AUTHENTICATION_KEY varchar2(255 char),
    USER_LOGIN varchar2(50 char),
    AUTHENTICATION_BYTES blob,
    EXPIRY timestamp,
    --
    primary key (ID)
) ^

create table TS_MOBILE_DEVICE (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    IMEI varchar2(64 char),
    DEVICE_ID varchar2(64 char),
    OS_ID varchar2(64 char),
    OS_VERSION varchar2(64 char),
    APP_ID varchar2(100 char),
    APP_VERSION varchar2(10 char),
    MOBILE_DEVICE_TYPE varchar2(20 char),
    USER_ID varchar2(32 char),
    NOTIFICATION_TOKEN varchar2(255 char),
    primary key (ID)
)^

alter table TS_MOBILE_DEVICE add constraint FK_TS_MOBILE_DEVICE_USER foreign key (USER_ID) references SEC_USER(ID)^
create index IDX_TS_MOB_DEVICE_DEVICE_ID on TS_MOBILE_DEVICE (DEVICE_ID)^

create table TS_PUSH_NOTIFICATION (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    MESSAGE varchar2(600 char),
    PUSH_TYPE varchar2(25 char),
    STATUS integer,
    CARD_ID varchar2(32 char),
    MOBILE_DEVICE_ID varchar2(32 char),
    CARD_INFO_ID varchar2(32 char),
    USER_ID varchar2(32 char),
    primary key (ID)
)^

CREATE TABLE TS_OPERATOR_EDM(
    ID varchar2(32 char),
    create_ts timestamp,
    created_by varchar2(50 char),
    update_ts timestamp,
    updated_by varchar2(50 char),
    delete_ts timestamp,
    deleted_by varchar2(50 char),
    VERSION integer default 1 not null,
    ---
    name varchar2(255 char),
    box_id varchar2(255 char),
    login varchar2(255 char),
    password varchar2(255 char),
    last_inbound_date timestamp,
    after_index_key varchar2(255 char),
    last_doc_event_date timestamp,
    last_doc_event_ai_key varchar2(255 char),
    primary key (id)
)^

CREATE TABLE TS_SUBSCRIBER_EDM(
    id varchar2(50 char),
    create_ts timestamp,
    created_by varchar2(50 char),
    update_ts timestamp,
    updated_by varchar2(50 char),
    delete_ts timestamp,
    deleted_by varchar2(50 char),
    VERSION integer default 1 not null,
    ---
    name varchar2(255 char),
    box_id varchar2(255 char),
    contractor_id varchar2(50 char),
    operator_edm_id varchar2(50 char),

    primary key(id)
)^

CREATE TABLE TS_EDM_SENDING (
    ID varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    ---
    EDM_MESSAGE_ID varchar2(255 char),
    EDM_ENTITY_ID varchar2(255 char),
    EDM_STATE integer,
    DOC_ID varchar2(32 char),
    BOX_ID varchar2(255 char),
    SUBSCRIBER_ID varchar2(32 char),
    RESPONSE_SIGNATURE_REQUIRED char(1),
    primary key(ID)
)^

create index IDX_EDM_SENDING_DOC_ID on TS_EDM_SENDING(DOC_ID)^
create index IDX_EDM_SENDING_MESSAGE_ENTITY on TS_EDM_SENDING(EDM_MESSAGE_ID, EDM_ENTITY_ID)^
alter table TS_EDM_SENDING add constraint TS_EDM_SENDING_SUBSCRIBER foreign key (SUBSCRIBER_ID) references TS_SUBSCRIBER_EDM(ID)^
alter table TS_EDM_SENDING add constraint TS_EDM_SENDING_CARD foreign key (DOC_ID) references WF_CARD(ID)^

alter table TS_SUBSCRIBER_EDM add constraint TS_SUBSCR_EDM_CONR_ID foreign key (CONTRACTOR_ID) references DF_CONTRACTOR(CORRESPONDENT_ID)^
alter table TS_SUBSCRIBER_EDM add constraint TS_SUBSCR_EDM_OPER_EDM_ID foreign key (OPERATOR_EDM_ID) references TS_OPERATOR_EDM(ID)^
create unique index IDX_SUBSCR_BOX_OPERATOR_UNIQ on TS_SUBSCRIBER_EDM (BOX_ID, OPERATOR_EDM_ID, DELETE_TS)^

CREATE TABLE TS_EDM_SIGNATURE_DETAILS (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    ---
    SIGNER_ID varchar2(32 char),
    CARD_ID varchar2(32 char),
    ATTACHMENT_ID varchar2(32 char),
    PATCHED_CONTENT_ID clob,
    SIGNATURE clob,
    SIGNATURE_COMMENT clob,
    primary key(ID)
)^

create index IDX_TS_EDM_SIGN_DET_SIGNER_ID on TS_EDM_SIGNATURE_DETAILS(SIGNER_ID)^
create index IDX_TS_EDM_SIGN_DET_CARD_ID on TS_EDM_SIGNATURE_DETAILS(CARD_ID)^
create index IDX_TS_EDM_SIGN_DET_ATT_ID on TS_EDM_SIGNATURE_DETAILS(ATTACHMENT_ID)^

alter table TS_EDM_SIGNATURE_DETAILS add constraint TS_EDM_SIGN_DET_SIGNER foreign key (SIGNER_ID) references SEC_USER(ID)^
alter table TS_EDM_SIGNATURE_DETAILS add constraint TS_EDM_SIGN_DET_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TS_EDM_SIGNATURE_DETAILS add constraint TS_EDM_SIGN_DET_ATTACHMENT foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID)^

alter table TS_PUSH_NOTIFICATION add constraint FK_TS_PUSH_NOT_MOBILE_DEVICE foreign key (MOBILE_DEVICE_ID) references TS_MOBILE_DEVICE(ID)^
alter table TS_PUSH_NOTIFICATION add constraint FK_TS_PUSH_NOTIFICATION_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TS_PUSH_NOTIFICATION add constraint FK_TS_PUSH_NOT_CARD_INFO foreign key (CARD_INFO_ID) references WF_CARD_INFO(ID)^
alter table TS_PUSH_NOTIFICATION add constraint FK_TS_PUSH_NOTIFICATION_USER foreign key (USER_ID) references SEC_USER(ID)^

create index FK_TS_PUSH_NOT_CARD_INFO ON TS_PUSH_NOTIFICATION(CARD_INFO_ID)^
---------------------------------------------------------------------------------------------------

--begin Группы доступа
update SEC_GROUP set NAME = 'Полный доступ' where ID = '0fa2b1a51d684d699fbddff348347f93'^

insert into SEC_GROUP (id, create_ts, created_by, version, name, parent_id) values ('cff945e4e3630dc0d70d4b5bdb2a2269',current_timestamp,'system',1,'Архивариус', '0fa2b1a51d684d699fbddff348347f93')^
insert into SEC_GROUP (id, create_ts, created_by, version, name, parent_id) values ('7dfe5c72073f4e1e9cf41b1bad9c0093',current_timestamp,'system',1,'Делопроизводители','0fa2b1a51d684d699fbddff348347f93')^
insert into SEC_GROUP (id, create_ts, created_by, version, name, parent_id) values ('8e6306e29e10414ab43724c91ffef804',current_timestamp,'system',1,'Ограниченный доступ','0fa2b1a51d684d699fbddff348347f93')^
insert into SEC_GROUP (id, create_ts, created_by, version, name, parent_id) values ('9e44a053a31f4eddb19b39e942161dd2',current_timestamp,'system',1,'Ограниченный доступ + все договоры','0fa2b1a51d684d699fbddff348347f93')^
insert into SEC_GROUP (id, create_ts, created_by, version, name, parent_id) values ('b3dc60f565b247ab88029e8929bf8b29',current_timestamp,'system',1,'Ограниченный доступ + все документы','0fa2b1a51d684d699fbddff348347f93')^
insert into SEC_GROUP (id, create_ts, created_by, version, name, parent_id) values ('9fa89a549ffa11e1b13e9f4a54bff17e',current_timestamp,'system',1,'Руководитель департамента', '0fa2b1a51d684d699fbddff348347f93')^
insert into SEC_GROUP (id, create_ts, created_by, version, name, parent_id) values ('8d9ba07c9ffa11e1b99d8fc5b41c7fbb',current_timestamp,'system',1,'Руководитель подразделения', '0fa2b1a51d684d699fbddff348347f93')^

update SEC_GROUP set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Полный доступ"},{"language":"en","caption":"Full access"}]}' where ID = '0fa2b1a51d684d699fbddff348347f93'^
update SEC_GROUP set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Ограниченный доступ"},{"language":"en","caption":"Limited access"}]}' where ID = '8e6306e29e10414ab43724c91ffef804'^
update SEC_GROUP set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Делопроизводители"},{"language":"en","caption":"Secretary"}]}' where ID = '7dfe5c72073f4e1e9cf41b1bad9c0093'^
update SEC_GROUP set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Руководитель подразделения"},{"language":"en","caption":"Assistant Manager"}]}' where ID = '8d9ba07c9ffa11e1b99d8fc5b41c7fbb'^
update SEC_GROUP set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Руководитель департамента"},{"language":"en","caption":"Head of Department"}]}' where ID = '9fa89a549ffa11e1b13e9f4a54bff17e'^
update SEC_GROUP set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Ограниченный доступ + все договоры"},{"language":"en","caption":"Limited access + all contracts"}]}' where ID = '9e44a053a31f4eddb19b39e942161dd2'^
update SEC_GROUP set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Ограниченный доступ + все документы"},{"language":"en","caption":"Limited access + all documents"}]}' where ID = 'b3dc60f565b247ab88029e8929bf8b29'^
update SEC_GROUP set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Архивариус"},{"language":"en","caption":"Archivist"}]}' where ID = 'cff945e4e3630dc0d70d4b5bdb2a2269'^

insert into SEC_GROUP_HIERARCHY (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
values (newid(), current_timestamp, 'system', '8e6306e29e10414ab43724c91ffef804', '0fa2b1a51d684d699fbddff348347f93', 0)^
insert into SEC_GROUP_HIERARCHY (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
values (newid(), current_timestamp, 'system', '7dfe5c72073f4e1e9cf41b1bad9c0093', '0fa2b1a51d684d699fbddff348347f93', 0)^
insert into SEC_GROUP_HIERARCHY (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
values (newid(), current_timestamp, 'system', '9fa89a549ffa11e1b13e9f4a54bff17e', '0fa2b1a51d684d699fbddff348347f93', 0)^
insert into SEC_GROUP_HIERARCHY (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
values (newid(), current_timestamp, 'system', '8d9ba07c9ffa11e1b99d8fc5b41c7fbb', '0fa2b1a51d684d699fbddff348347f93', 0)^
insert into SEC_GROUP_HIERARCHY (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
values (newid(), current_timestamp, 'system', 'b3dc60f565b247ab88029e8929bf8b29', '0fa2b1a51d684d699fbddff348347f93', 0)^
insert into SEC_GROUP_HIERARCHY (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
values (newid(), current_timestamp, 'system', '9e44a053a31f4eddb19b39e942161dd2', '0fa2b1a51d684d699fbddff348347f93', 0)^
insert into SEC_GROUP_HIERARCHY (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
values (newid(), current_timestamp, 'system', 'cff945e4e3630dc0d70d4b5bdb2a2269', '0fa2b1a51d684d699fbddff348347f93', 0)^

--Полный доступ
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('cbd897a25c4d4b84a6136393c435cbcc',current_timestamp,'system',1,'sec$User',null,'{E}.createdBy is not null','0fa2b1a51d684d699fbddff348347f93')^

--Ограничения для wf$UserGroup для всех кроме "Полный доступ"
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
select newid(), current_timestamp, 'system', 1, 'wf$UserGroup', null, '{E}.substitutedCreator.id = :session$userId or {E}.global = true', ID from SEC_GROUP where ID <> '0fa2b1a51d684d699fbddff348347f93'^
--Ограничения для df$TypicalResolution для всех кроме "Полный доступ"
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
select newid(), current_timestamp, 'system', 1, 'df$TypicalResolution', null, '{E}.substitutedCreator.id = :session$userId or {E}.global = true', ID from SEC_GROUP where ID <> '0fa2b1a51d684d699fbddff348347f93'^

--Архивариус
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('bc94a0d410ca11e48fb107511252f87c', current_timestamp, 'system', 1, 'df$Doc', 'left outer join {E}.aclList acl left outer join {E}.docOfficeData dod left outer join dod.officeFile file', 'file.state >= 30 and {E}.template = false or acl.user.id = :session$userId or acl.global = true', 'cff945e4e3630dc0d70d4b5bdb2a2269')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('c42e9fa210ca11e49c898758c81c5f95', current_timestamp, 'system', 1, 'tm$Task', 'left outer join {E}.aclList acl', 'acl.user.id = :session$userId', 'cff945e4e3630dc0d70d4b5bdb2a2269')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('c646b7e810ca11e49ac65b5381a1ae07', current_timestamp, 'system', 1, 'tm$TaskPattern', 'left outer join {E}.aclList acl', 'acl.user.id = :session$userId or acl.global = true', 'cff945e4e3630dc0d70d4b5bdb2a2269')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('ce7b9b2210ca11e48ecca3cabbbb49b3', current_timestamp, 'system', 1, 'tm$TaskGroup', 'left join {E}.taskGroupTasks tgt left join tgt.task t',
'{E}.subCreator.id = :session$userId or exists (select c.id from wf$CardRole c where c.card.id = t.id and c.user.id = :session$userId) or {E}.template = true and {E}.global = true', 'cff945e4e3630dc0d70d4b5bdb2a2269')^

--Делопроизводители
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('433c5a9a991f454ca064861a74a66c88',current_timestamp,'system',1,'tm$Task','left outer join {E}.aclList acl','acl.user.id = :session$userId','7dfe5c72073f4e1e9cf41b1bad9c0093')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('edda0d213aa040df810019444d75535c',current_timestamp,'system',1,'tm$TaskPattern','left outer join {E}.aclList acl','acl.user.id = :session$userId or acl.global = true', '7dfe5c72073f4e1e9cf41b1bad9c0093')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('86c0ba0a5c2e11e0b52d0f8fb8df9d93',current_timestamp,'system',1,'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join tgt.task t',
'{E}.subCreator.id = :session$userId or exists (select c.id from wf$CardRole c where c.card.id = t.id and c.user.id = :session$userId) or {E}.template = true and {E}.global = true', '7dfe5c72073f4e1e9cf41b1bad9c0093')^

--Ограниченный доступ
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('22581accacff4d58bc8dffaea3dd01fa',current_timestamp,'system',1,'df$Doc','left outer join {E}.aclList acl','acl.user.id = :session$userId or acl.global = true','8e6306e29e10414ab43724c91ffef804')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('bcb90482e02a42f3b936a40b28b5963a',current_timestamp,'system',1,'tm$Task','left outer join {E}.aclList acl','acl.user.id = :session$userId','8e6306e29e10414ab43724c91ffef804')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('cb37a982a1fe4082b0ea440f4211af8d',current_timestamp,'system',1,'tm$TaskPattern','left outer join {E}.aclList acl','acl.user.id = :session$userId or acl.global = true', '8e6306e29e10414ab43724c91ffef804')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('7b87c5205c2e11e0a770b3d23ae5dd33',current_timestamp,'system',1,'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join tgt.task t',
'{E}.subCreator.id = :session$userId or exists (select c.id from wf$CardRole c where c.card.id = t.id and c.user.id = :session$userId) or {E}.template = true and {E}.global = true','8e6306e29e10414ab43724c91ffef804')^

--Ограниченный доступ + все договоры
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('99961b6fd798479c9b9304b16a99ff62',current_timestamp,'system',1,'df$Doc','left outer join {E}.aclList acl','TYPE({E}) in (:session$contractEffectiveClass) or acl.user.id = :session$userId or acl.global = true','9e44a053a31f4eddb19b39e942161dd2')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('a4fd0af59884407697fdaa291cdaba13',current_timestamp,'system',1,'tm$Task','left outer join {E}.aclList acl','acl.user.id = :session$userId','9e44a053a31f4eddb19b39e942161dd2')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('70170bc41b834829b51c17c19cf7c6db',current_timestamp,'system',1,'tm$TaskPattern','left outer join {E}.aclList acl','acl.user.id = :session$userId or acl.global = true', '9e44a053a31f4eddb19b39e942161dd2')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('b9647fb633a64240a07dc63eb19e5e1d',current_timestamp,'system',1,'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join tgt.task t',
'{E}.subCreator.id = :session$userId or exists (select c.id from wf$CardRole c where c.card.id = t.id and c.user.id = :session$userId) or {E}.template = true and {E}.global = true','9e44a053a31f4eddb19b39e942161dd2')^

--Ограниченный доступ + все документы
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('3f520104d798479c9b9304b16a99ff62',current_timestamp,'system',1,'df$Doc','left outer join {E}.aclList acl','TYPE({E}) in (:session$simpleDocEffectiveClass, :session$accountDocEffectiveClass, :session$packageDocEffectiveClass) or acl.user.id = :session$userId or acl.global = true','b3dc60f565b247ab88029e8929bf8b29')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('3f520104c1d04877a331522a53a372b3',current_timestamp,'system',1,'tm$Task','left outer join {E}.aclList acl','acl.user.id = :session$userId','b3dc60f565b247ab88029e8929bf8b29')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('c3096defc3eb4580b9e6da6a71407f50',current_timestamp,'system',1,'tm$TaskPattern','left outer join {E}.aclList acl','acl.user.id = :session$userId or acl.global = true', 'b3dc60f565b247ab88029e8929bf8b29')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values ('8c876c9ad97343ed8837b01a8219146d',current_timestamp,'system',1,'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join tgt.task t',
'{E}.subCreator.id = :session$userId or exists (select c.id from wf$CardRole c where c.card.id = t.id and c.user.id = :session$userId) or {E}.template = true and {E}.global = true','b3dc60f565b247ab88029e8929bf8b29')^

--Руководитель подразделения + Руководитель департамента
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values (newid(), current_timestamp, 'system', 1, 'df$Doc', 'left outer join {E}.aclList acl', 'acl.user.id = :session$userId or acl.department.id in :session$departmentIds or acl.global = true',
'8d9ba07c9ffa11e1b99d8fc5b41c7fbb')^
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values (newid(), current_timestamp, 'system', 1, 'df$Doc', 'left outer join {E}.aclList acl', 'acl.user.id = :session$userId or acl.department.id in :session$departmentIds or acl.global = true',
'9fa89a549ffa11e1b13e9f4a54bff17e')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values (newid(), current_timestamp, 'system', 1, 'tm$Task', 'left outer join {E}.aclList acl', 'acl.department.id in :session$departmentIds or acl.user.id = :session$userId',
'8d9ba07c9ffa11e1b99d8fc5b41c7fbb')^
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values (newid(), current_timestamp, 'system', 1, 'tm$Task', 'left outer join {E}.aclList acl', 'acl.department.id in :session$departmentIds or acl.user.id = :session$userId',
'9fa89a549ffa11e1b13e9f4a54bff17e')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values (newid(), current_timestamp, 'system', 1, 'tm$TaskPattern','left outer join {E}.aclList acl','acl.user.id = :session$userId or acl.global = true',
'8d9ba07c9ffa11e1b99d8fc5b41c7fbb')^
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values (newid(), current_timestamp, 'system', 1, 'tm$TaskPattern','left outer join {E}.aclList acl','acl.user.id = :session$userId or acl.global = true',
'9fa89a549ffa11e1b13e9f4a54bff17e')^

insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values (newid(), current_timestamp, 'system', 1, 'tm$TaskGroup', 'left join {E}.taskGroupTasks tgt left outer join tgt.task task',
'{E}.subCreator.id = :session$userId or {E}.global = true and {E}.template = true or task.id in (select t.id from tm$Task t left join t.roles r where t.substitutedCreator.id = :session$userId or r.user.id in :session$departmentMembersIds)',
'8d9ba07c9ffa11e1b99d8fc5b41c7fbb')^
insert into SEC_CONSTRAINT (id,create_ts,created_by,version,entity_name,join_clause,where_clause,group_id)
values (newid(), current_timestamp, 'system', 1, 'tm$TaskGroup', 'left join {E}.taskGroupTasks tgt left outer join tgt.task task',
'{E}.subCreator.id = :session$userId or {E}.global = true and {E}.template = true or task.id in (select t.id from tm$Task t left join t.roles r where t.substitutedCreator.id = :session$userId or r.user.id in :session$departmentMembersIds)',
'9fa89a549ffa11e1b13e9f4a54bff17e')^

--end Группы доступа

update sec_user set created_by='admin', language_='ru' where login='admin'^

INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('0038f3dbac9c432383e7356996cc63ae',TO_TIMESTAMP('2010-02-12 14:19:19.810', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-03-09 09:56:21.940', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null,'ReferenceEditor','Редактирование справочников','Роль, предоставляющая доступ к редактированию справочников',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('3c9abffb2fae484e990c343b3c1197ca',TO_TIMESTAMP('2010-04-15 13:01:51.520', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-05-05 16:11:31.440', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null,'doc_initiator','Инициатор документов','Роль, предоставляющая права создания документов/договоров и запуска процессов',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('47135f12071b43d8bc212ff77cd08fb6',TO_TIMESTAMP('2010-04-15 13:02:03.350', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-15 13:02:03.350', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,'doc_endorsement','Согласующий','Роль дает возможность согласования документов/договоров',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('64fec16454084e489e725a1d214c533e',TO_TIMESTAMP('2010-01-26 10:17:40.740', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-03-09 09:55:59.500', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null,'task_observer','Наблюдатель','Роль дает возможность получать уведомления по текущему состоянию задачи',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('7091f5efa77a450a834a39406885676e',TO_TIMESTAMP('2010-05-04 15:52:31.430', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-05-04 15:52:31.430', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,'doc_secretary','Делопроизводитель','Роль дает возможность работы с канцелярией, позволяет регистрировать документы',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('7a35c6f86a2d4347a8c23bc887e23c83',TO_TIMESTAMP('2010-01-26 10:17:16.500', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',3,TO_TIMESTAMP('2010-03-09 09:55:45.410', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null,'task_initiator','Инициатор задач','Выступает инициатором процесса выполнения задачи, а также осуществляет отправку ее на выполнение',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('96fa7fe9397d4bacb14aeec2d94de68c',TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',3,TO_TIMESTAMP('2010-03-09 09:56:55.120', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null,'SimpleUser','Запрещающая роль','Эта роль должна быть назначена всем пользователям кроме администраторов',1)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('af4398100f114a21b2397df2df83bbc6',TO_TIMESTAMP('2010-01-26 10:17:29.300', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-03-09 09:55:52.660', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null,'task_controller','Контролёр','Осуществляет контроль выполнения задачи и, при необходимости, отправку задачи на доработку',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('c06c0cee2f2142418d6f76b4cd462f96',TO_TIMESTAMP('2010-04-15 13:02:15.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-15 13:02:15.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,'doc_approver','Утверждающий','Роль дает возможность утверждения документов/договоров в завершении процесса согласования',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('c0e15ca317914e529882c88fd72fbac1',TO_TIMESTAMP('2010-01-26 10:17:22.890', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-03-09 09:55:37.610', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null,'task_executor','Исполнитель','Осуществляет выполнение задачи',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('f7ff1ec7802d4a42a7db1a97e17f893f',TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-03-09 09:57:02.200', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null,'task_creator','Создание задач','Роль дает возможность создания задач',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('e41f5aa232964fdc906eaf2f8660f806',TO_TIMESTAMP('2010-05-06 11:33:14.520', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-05-06 11:33:14.520', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,'doc_acquaintance','Ознакомление с документами','Роль дает возможность ознакомления с документами/договорами',null)^
insert into SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('5115e83341464c98a1191c06053adb92',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,'schedule_task_creator','Создание периодических задач','Роль, позволяющая создавать периодические задания',null)^
INSERT INTO SEC_ROLE (ID, CREATE_TS, CREATED_BY, VERSION, NAME, LOC_NAME,DESCRIPTION) VALUES ('5cd3839e781b487f88104091943da63b', CURRENT_TIMESTAMP, USER, 1, 'DepartmentChief', 'Руководитель департамента','Эта роль выдается только совместно с группой доступа «Руководитель департамента». У пользователя с этой ролью в карточке сотрудника должно быть заполнено подразделение')^
INSERT INTO SEC_ROLE (ID, CREATE_TS, CREATED_BY, VERSION, NAME, LOC_NAME,DESCRIPTION) VALUES ('2ba2e5caa00d11e182a7832770c8a361', CURRENT_TIMESTAMP, USER, 1, 'SubdivisionChief', 'Руководитель подразделения','Эта роль выдается только совместно с группой доступа «Руководитель подразделения». У пользователя с этой ролью в карточке сотрудника должно быть заполнено подразделение')^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('b6a03cd4047911e1b6c977dd813b99ee',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,'UserSubstitutionEditor','Редактирование замещений пользователей','Роль предоставляет возможность редактирования справочника «Замещение пользователей»',null)^
INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('e8b73444cb0511e2b014d7054a634646',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,'AppIntegrationRole','Доступ к функциям модуля интеграции с учётными системами','Позволяет отмечать справочники и данные к выгрузке в сторонние учётные системы',null)^
insert into SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('ae883bce0a3411e3a7e0a702ae87dd8a',current_timestamp,'admin',1,current_timestamp,null,null,null,'doc_publisher','Публикация документов на портале','Роль, позволяющая публиковать документы на портале',null)^
insert into SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('80145594f020e85cd2597a293c035495',current_timestamp,'admin',1,current_timestamp,null,null,null,'meetingdoc_creator','Работа с совещаниями','Роль, предоставляющая права для работы с совещаниями',null)^
insert into SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES (newId(),current_timestamp,'admin',1,current_timestamp,null,null,null,'PortalIntegrationRole','Интеграция с порталом','Пользователь с данной ролью может быть авторизован в Тезис через веб-сервис интеграции с порталом',null)^
update sec_role set description='Роль, предоставляющая права администрирования системы', loc_name='' where name='Administrators'^

update SEC_ROLE set ROLE_TYPE = 0 where ROLE_TYPE = 10^

insert into SEC_PERMISSION (id, PERMISSION_TYPE, target, value_, role_id) values (newid(), 10, 'tm$TaskGroupPattern.browse', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
insert into SEC_PERMISSION (id, PERMISSION_TYPE, target, value_, role_id) values (newid(), 10, 'tm$TaskGroupPattern.browse', 1, 'f7ff1ec7802d4a42a7db1a97e17f893f')^




INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('03d2edc0f71946c8ad232733972ae7eb',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Organization:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('040080ddde104da694fbabe9b1904354',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContactPerson:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('04c8b29623aa46f4b7cc95057c50d9e5',TO_TIMESTAMP('2010-04-22 15:51:05.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:51:05.480', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Project:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('0524e14c6de040cf821a98d940dc5f15',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$EntityLogAttr:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('063d155db4dd45469fad821e8e7adf59',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$Filter:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('0658114032e64160a7ef8c2891d71f60',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$SimpleDoc:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('0c403de9e5a745eb9972039e3ec61b46',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContactPerson:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('0c704a9be6394f2ca1b241e1aab84efa',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$Proc:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('0cc259eb99474ece960aeb6f3035e8bf',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$Filter:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('0e28713cdfd04aa8be3e83b75ec209bc',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$BankRegion:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('0e52d28cc8fe4f1980a1ae6fa72f6c55',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Group:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('0f899f19b28b4099b9ec0d163d7c298d',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Organization:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('0fdf8f696f8b4d08b798aa4b4a59140e',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPatternGroup:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('12c573f259eb4080a5cf2e41d20525b3',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPattern:create',1,'0038f3dbac9c432383e7356996cc63ae')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('146861c6e3994c3cbb5f8bf13aa36cff',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPatternGroup:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('14bd9af20874447d9b8301eaae43372d',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$SimpleDoc:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('160fd2608f4842bbb9cdd8c0f25313c5',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$CardRole:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('17052036845548e0912d0078314ae2cb',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$Filter:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('184c689b22474a758d2df481497924ea',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskType:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('18c4f80f430d407dbf204815dd106a5a',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:42:33.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:42:33.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'tm$Task:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('18f46248125d41f2bae5ea360590aaf5',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Department:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('19c92720ef9e4509a46ad9d8da4da445',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Currency:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1a4310a2aee743eeb480bb89c773e45d',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPatternGroup:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1a5bd6756992462c8c1bfcf6ee1557fe',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskGroup:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1aa5b567a1d14e32916e6144d8d33287',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Doc:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1b3f56209e0f490eb30ebef4baa667d1',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Constraint:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1b588fb33e5243aea290228985faf49d',TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Priority:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1b738995c1e44e619c13937a24b3d184',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$OrganizationAccount:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1c0f37da185b4e5e9095b1043edea663',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$UserRole:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1c8ab95fa2084e2ebb4316c2c1445cfc',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$Card:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1d7e666e997742d5a1a1b80619e8dbb9',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Task:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1e1be93bdcd643b2b4867bddd18e3fcb',TO_TIMESTAMP('2010-04-22 14:16:30.170', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 14:16:30.170', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$ProjectGroup:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('1f683059d1b74af9b6e4ada57850173f',TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskGroup:delete',1,'f7ff1ec7802d4a42a7db1a97e17f893f')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('20009a8471da4e75b773ee2753b01499',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Attachment:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2139962368d9480c8bd84978622f4c1a',TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'core$FileDescriptor:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('214b52bf9ef94953ba28e9341a13876b',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'ts$CardType:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('219317fc5d654c48b0a25b698287b095',TO_TIMESTAMP('2010-04-22 15:54:00.350', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:54:00.350', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'ts$CardType:delete',1,'0c018061b26f4de2a5bedff348347f93')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2252ac9b569445f39cbc98e524178e94',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$OrganizationAccount:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('22df48bec9934c628359cc2da3474e2e',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Employee:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('236dd34ddbb74dc9b86cce8caebb8dcb',TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskGroup:create',1,'f7ff1ec7802d4a42a7db1a97e17f893f')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('24586f0517684cf189ad9c999fdfa0dd',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$UserSubstitution:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('259b30c140fa40ca992b58d9d34c1d1d',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPattern:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2827fd41b4ee4180a5800da4833be689',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$CardAttachment:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('28f7632a9cc84bd3ad444fb97f3c3e48',TO_TIMESTAMP('2010-04-22 15:39:04.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:39:04.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Project:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('294576ea8588438b8578bde2da5b18a1',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$OrganizationAccount:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('295784cb0b54469584de07d14626d141',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$BankRegion:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('29b71b914a264279b9b73a0b9e41415b',TO_TIMESTAMP('2010-04-22 15:39:04.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:39:04.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Project:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2a655b28112343398bc7e0441a396ad0',TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contract:update',1,'3c9abffb2fae484e990c343b3c1197ca')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2aa14a32ef944cf3bbd318b6b468c9d2',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Currency:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2aa3bf9160f34156a2d2f04d04f3851c',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$BankRegion:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2b83d8af865846f985773fa7d7ba7ab3',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Bank:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2b9d20e615f54136854730b87b8d0f6d',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$LoggedEntity:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2beceea547394239afa242ef7b4f1d32',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Employee:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2d7ebedac7264612adc617057358954e',TO_TIMESTAMP('2010-04-22 14:17:14.490', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 14:17:14.490', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$ProjectGroup:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('2e1c79edf4e843fe97cfbd58737e845e',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Company:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('30225f86cef1441c918c895e46fdb00e',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sys$Server:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('310cdc1156bd4833a525acfa23cbcafb',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Attachment:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('34947b9601074b459352a1e9bd0dbe86',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$User:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('34e558949244438280d329cef3e5af06',TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'core$FileDescriptor.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('35270635f34c4c849eb2e23ab550a82a',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$AssignmentAttachment:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('357a4c32dbd24ac6a56cd95736735f40',TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contract:delete',1,'3c9abffb2fae484e990c343b3c1197ca')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('38ae98c1c3c6440cbb16ff47980beee1',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Attachment:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('3a2681698e244050bba257be5a6da52d',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sys$Server:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('3cba8b805e6447269f041157a11baa3c',TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Priority:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('3dea826c8bd84cd0b13983dae3f86a2e',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sys$Server:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('3e5424e1ff174935b524059542815b31',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$OrganizationAccount:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('3ef9cadc67e5412991682f0c9542c93d',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$OrganizationAccount:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('3f3acc24636b4f118507664516371369',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$User:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('40603f8beeba44ac9370360b7ab5e6d0',TO_TIMESTAMP('2010-04-22 15:54:00.350', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:54:00.350', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$DocKind:update',1,'0c018061b26f4de2a5bedff348347f93')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('40686888182e417bb66bc1305dff252e',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Role:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('419964d56a414e36bfd8949f4bb048ad',TO_TIMESTAMP('2010-04-22 15:54:00.350', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:54:00.350', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$DocKind:delete',1,'0c018061b26f4de2a5bedff348347f93')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('44211e794f154828a10c6fd4c1f0b9f3',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$DefaultProcActor:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('44ccfb20a6b142f29d2c8a5994ae4ba2',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskType:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('4697101635734a599e8bf1ed70c76f35',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$ProcRole:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('46a3147d7c7e4fd39d7c7563996b4dc3',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Role:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('46b51bb8d06b4cea8b0cb299d1bf1764',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Organization:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('485d31b9112744f6a148701787b39427',TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contract:create',1,'3c9abffb2fae484e990c343b3c1197ca')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('498df478960c4683b3ebaba8a5108412',TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Priority:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('4a3e9c99e4904a64a32cdefbaf326063',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Employee:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('4af89dd39cb4478fa609980818c8b9b0',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Category:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('4de8d0a6aad94ec58f7fcfaf059289fe',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Category:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('4f60093cc3fd4e45a04988a68534c666',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Constraint:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('50025b21a8d040a89b151f196a5b5038',TO_TIMESTAMP('2010-02-12 14:19:19.810', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:19:19.810', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'tm$TaskType.browse',0,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('5283a06cec2840d48c24a23b32200310',TO_TIMESTAMP('2010-02-12 14:17:14.650', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:17:14.650', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'wf$Proc.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('53a0c10da6e04e598eb7c85b769adaf6',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'core$FileDescriptor:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('56239519602d409fb87fefa8cca4bc81',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contract:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('563bf56447ef4f848d188eb43caffdcf',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contract:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('56760255d4514afa81732f86c4bb7164',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Currency:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('576c5cd588d64a3380454012673270d2',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPattern:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('5893537e674540a89c6cf8232b2c50f1',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contractor:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('5991619c4c564a12bc4e220b041211bf',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$EntityLogAttr:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('5db35a2f7e484fb5aa0a170dd2f12c2e',TO_TIMESTAMP('2010-04-22 15:51:05.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:51:05.480', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Project:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('5f64d661cf264dbaaed6c96192efdc03',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContactPerson:update',1,'0038f3dbac9c432383e7356996cc63ae')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('6007a44e31af406c985b51ceaacf5636',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$CardAttachment:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('6081a3e3133c4667a7a0565f1c94fceb',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskType:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('60d97a5bb3ec4e2382c6415d07033c75',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Permission:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('651d05a930834ea0816060c3130ca54a',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Permission:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('66d91139d5c248beb8746b109a0f1795',TO_TIMESTAMP('2010-04-22 14:17:14.470', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 14:17:14.470', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$ProjectGroup:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('6872c149fa6b4bc5910497c7f61861bc',TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$User:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('6a585f8eb67547a0bedc5ba5adf5313d',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Employee:create',1,'0038f3dbac9c432383e7356996cc63ae')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('6ae4ed42522b4a09a2b1f15a5e23452f',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskType:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('6aec0915eb064aa48475504e88a4112b',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contractor:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('6d32068e964d4e3d99e8f4a45d21f644',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContractorAccount:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('6d576b4cbf8f475aad3df7f85d0cd87b',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Timer:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('6dc112523c3241adb041bc59577d8668',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$UserSessionEntity:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('6e1b6c70c6ab4de8bb6ab8ea0b1856b7',TO_TIMESTAMP('2010-03-04 12:30:30.980', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-03-04 12:30:30.980', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,40,'cuba.gui.filter.global',1,'0c018061b26f4de2a5bedff348347f93')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('704726c1a1a64bc9b83dadfe1073b1e0',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContractorAccount:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('71871afa261b4f81a63736910a44f969',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contractor:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('71913ccfbd5347de9e45295504f438d9',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Calendar:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('754aa636b33e4bdc97425eac4d078ddf',TO_TIMESTAMP('2010-04-08 16:29:37.700', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-08 16:29:37.700', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'wf$Assignment.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('762736704ece423aabbbe804ae8bf6f1',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Category:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('77f9bb6a4e1348c8b2a33578fc12c4e8',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Department:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('780e9a94d60f42f28d86014d8a0c33b2',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sys$Folder:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('79e03acde6864e05b465a6ef16d323c6',TO_TIMESTAMP('2010-04-22 14:16:30.180', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 14:16:30.180', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$ProjectGroup:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('7a41689aaa5442a29af800a9dffe0b6c',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Company:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('7d037cb4407840f7872bbd1eb7784970',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sys$Folder:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('7d93c8fb8f2e4d6e9b86ee9bb93e8cb3',TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Task:update',1,'f7ff1ec7802d4a42a7db1a97e17f893f')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('7f68094020b448638b4208356156858b',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$CardRole:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8079425aea3240889ceb418228f0b08a',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sys$AppFolder:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8140f871a4754d72ad788c8c8b2b4d65',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskGroup:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8168609fc61d423c82d8e8de16efbe1d',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contractor:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('82e627abfa7d43dda557b5d55bbf7469',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Bank:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('839f9594717e4f199c2254d8a10b6764',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$Proc:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('83bf25d15ec24af19b8d6cd532630c84',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sys$AppFolder:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('84128e25e739401caad23863231f481d',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskType:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('84828d0c1e3d4c0d895697bbe205c2bb',TO_TIMESTAMP('2010-04-22 15:39:04.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:39:04.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Project:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('85689872ed8840aab56908c70b17ad1f',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Bank:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('85d0a01fe0d740e3b893602eed6b271a',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Individual:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('86fb29ef9e974b5e9c13b218675338b1',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Department:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8907333c8171423e9bc04a642780aab3',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Company:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('89356e7fa31342a4af7eed8e0260c79f',TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskGroup:update',1,'f7ff1ec7802d4a42a7db1a97e17f893f')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8acff923eea14164bcc23d5eacb39ad0',TO_TIMESTAMP('2010-02-12 14:17:14.650', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:17:14.650', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'sec$Group.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8b4e7db2ca8345b7aaf0523efa953bb7',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$BankRegion:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8b741fa2c6d34e49a634ed6d29fddef5',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContactPerson:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8c85ae3dee0348c18f8e812842ee9b50',TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sys$AppFolder:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8ce0f193e03344e39635fbd2521fcebd',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contractor:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8d1af2b95d6d459c874ccc7faf311c71',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$BankRegion:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8dfa8fe325164f96a6331d67bc7f5e1a',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Calendar:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8e6ce01818aa474391f4c7aec6f45161',TO_TIMESTAMP('2010-02-24 19:12:13.390', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-24 19:12:13.390', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'wf$WorkCalendar.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8ed9a43acb494083a64deaa90aa116ec',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Department:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('90965701eed5489b8aa1dfa56ffb193b',TO_TIMESTAMP('2010-04-08 16:29:37.700', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-08 16:29:37.700', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'core$LockInfo.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9265e03896cf45abae2d331407bc3f31',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Organization:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('973a79bbc8ee468d833e057b5587040b',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskGroup:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('979ae3a5fe074a5895c4497afb8bbb6b',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$ProcRole:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('97c24cfc6f46417ba210245953b7bd67',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$LoggedEntity:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('99b23ff900da4dc181cbc76a3fc0bf56',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Individual:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9a2873f1e15a4b5eb9452c5729740ad5',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$UserSubstitution:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9c04af74c3de4de7821dd984776c68cd',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Numerator:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9c3de77ab92d4c2daa199d46d3e3b070',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Employee:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9e1244e3aa0d4c75bffd2c0446736ab4',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Task:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9eb960dfefe34da991eaef0205910f0b',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPattern:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9f2c860db323472fb6fa9f7ab4f752d3',TO_TIMESTAMP('2010-04-22 14:16:30.170', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 14:16:30.170', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$ProjectGroup:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9fafdb38682640f793fc23caf6a60a8a',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$DefaultProcActor:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9fd03eb061f9403d82cb88de9ec03378',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPattern:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('a2e3e6ccfc044e4ea4e14c67c6b3bb94',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Individual:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('a3db63f85ed344d9ad88fe99ffca7995',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Constraint:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('a483509ea464444eb07bace1b2017ce7',TO_TIMESTAMP('2010-04-22 14:26:37.270', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 14:26:37.270', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'df$Numerator.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('a4bb6b84c0774f38a4e9d98295cac886',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Bank:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('a4ef285922ce42f0a068fd2de84850c2',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContractorAccount:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('a59604b688b34ae9b1cd2ae0e4edf1f5',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Company:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('a6ea90d9776149c2a269f7253e7e9a73',TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'tm$TaskPatternGroup.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('a8400c8d19124f268d6aeaef6c42cff5',TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Task:delete',1,'f7ff1ec7802d4a42a7db1a97e17f893f')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('aa64f2a7345e49459beef37e78d2448d',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$UserRole:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ab7b4c6df5344b43a9c05ff2d51679fa',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPatternGroup:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ab8a19952501470d9377aa3d1c91af2d',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Priority:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ac63a5b4aca34b9798b62fb4e78d1d4e',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Organization:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ac6e1ef4b02a4652867fbf70cc766069',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Individual:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('acbf87e85f4a4f258e632471ad991d45',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Priority:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b0593443ae1f410c95b4f2c5e72835e1',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContactPerson:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b0dd01ff230b448da4d33348845e2052',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$UserSessionEntity:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b121f760087b4ebf80cfcf8a549299d6',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$LoggedAttribute:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b3358545285b4c53a9e59a2b30a1213a',TO_TIMESTAMP('2010-02-12 14:19:19.830', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:19:19.830', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'tm$TaskPattern.browse',0,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b442aa6e29c5404a8def03eee5a1afc4',TO_TIMESTAMP('2010-04-22 14:17:14.470', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 14:17:14.470', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$ProjectGroup:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b4621bffaa6c41ae8c8f9a77d20f18e2',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Category:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b5af903cf93e472b90a032c1e6be1583',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Bank:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b5f1481e7a7f4fcb96705729255dadab',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Currency:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b662dd3075b94b76aabc30413f3ac650',TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Task:create',1,'f7ff1ec7802d4a42a7db1a97e17f893f')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e21cae80bd5540eb9dac0a144b691df2',TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPattern:update',1,'f7ff1ec7802d4a42a7db1a97e17f893f')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('987656e26f1b4b3bbad07bae40e95185',TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPattern:create',1,'f7ff1ec7802d4a42a7db1a97e17f893f')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('822ab006db10428db2642cb9a623d8c6',TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:30:21.0', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPattern:delete',1,'f7ff1ec7802d4a42a7db1a97e17f893f')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b694ed7c11f74190a4bdbeecf31c8f9e',TO_TIMESTAMP('2010-04-22 15:39:04.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:39:04.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'df$DocKind.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('b82372f91ebb4aba86a2256a203fc464',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$AssignmentAttachment:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ba1bbb9e061d4e7b8b16cab0b76a4c74',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$Card:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('bbc3c85d6af84252922e810753dc5781',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskType:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('bcbb005714c44b8598616d58439e8353',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Doc:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('bcd2229a6bed4c7ab4a272c2a4f4c51d',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Department:create',1,'0038f3dbac9c432383e7356996cc63ae')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('bcde06f7557e488294c443e4d12f65c9',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Assignment:read',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('bfae0838effc4698a1cf0d423e8272aa',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'tm$TaskInfo:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c2224c2ba5c040a184c4aaf6f4f1e95a',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$BankRegion:update',1,'0038f3dbac9c432383e7356996cc63ae')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c2675c850eb349ce8e38d7af129f6ec3',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$CardRole:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c321144557424beca0252060ea012dd7',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Assignment:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c39864a7da13400a8955673024dcc7b0',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Timer:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c3e88a8935ce473391c9940f276caf44',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Category:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c55fc32ed2874a61ba5ded8716dd3b62',TO_TIMESTAMP('2010-02-12 14:29:39.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.780', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Priority:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c571e59e859548da84e00123532167cb',TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'sec$Role.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c6294ec3bee545ee96ceb6e16d476d03',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Individual:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c63921a9113e4a2ea4dc6433eddb32f2',TO_TIMESTAMP('2010-02-12 14:28:46.950', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Assignment:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c7f9c0d206e34463960ea74c9dc60b86',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$Proc:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c8a48b9231a446e7998d47ed0e1ff052',TO_TIMESTAMP('2010-03-04 12:30:47.850', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-03-04 12:30:47.850', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,40,'cuba.gui.filter.global',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c928ad10ea5d48899811519333de51d2',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$UserSubstitution:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('cbb5051aeba945c4a8a2d0864e063f3b',TO_TIMESTAMP('2010-02-12 14:19:19.830', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:19:19.830', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'tm$Priority.browse',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('cd6fa39345cd4b76a4e76f9779898d47',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$UserRole:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ce03a7fa6cd24908a8d3b29751b57b22',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPatternGroup:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('cf0de3d75dbd4a2fa19484f1deb4bb82',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Numerator:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('cf3ae1c061ac45e89a3c50568e84b81a',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Group:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('cf47f15ab8bc40629755dae57130f9d5',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'core$FileDescriptor:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('d03d151f7b224d61a28318828baceeef',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$AssignmentAttachment:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('d37f03bd80804d54b03a569cd300e5da',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContactPerson:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('d4838121170447acab8b590164402bb4',TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'tm$TaskPattern.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('d4e1f450e83648118f7e3e1ca1084719',TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'tm$TaskType.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('d5a7919cbf084157969a91796562e540',TO_TIMESTAMP('2010-04-22 15:54:00.350', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:54:00.350', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'ts$CardType:create',1,'0c018061b26f4de2a5bedff348347f93')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('d6a21b2521394ef69cfd092f3411c66d',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$EntityLog:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('d76198e4a91343cfb0dd7855183db864',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$DefaultProcActor:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('d7d66af90e5a465e8b5d532466f9c417',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Currency:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('d9ef24514b2343238abc253aff864fe5',TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$LoggedAttribute:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('da9134edcfec4110a75807ca6e706aa2',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContractorAccount:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('dac4c2820dc14e329fe0d9e0501bcbc5',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Company:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('db7964f35fa34ce79540e40ba90c1e31',TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'sec$UserSessionEntity.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('db8458a863d44a6897f47966ff66eaac',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'tm$TaskInfo:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('dbc7bb33283c468e92e33838a689fda6',TO_TIMESTAMP('2010-04-22 15:39:04.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:39:04.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'ts$CardType.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('dbe83af7b8d248f9aa5f4e7c8990983e',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Company:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e05216cd28be4a899d0955f7b8adf829',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPatternGroup:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e1b000b263104922b089472913f89822',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Group:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e3555d5c43c44703b9a32802ba264536',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContractorAccount:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e5db8f74a9954fecb47d991f1163490e',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'ts$CardType:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e768da0da9ae4db5940de72588e18072',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$Card:update',1,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e803d4b1153c4aa1afe2cf7e50915687',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Contractor:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e8380e2470e546e488cd6ce8b08836ec',TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$ContractorAccount:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e9b6ad9af6f445158bf4ba0d57613d85',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Numerator:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e9d7bff48a734838aad9957affda2f92',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$CardAttachment:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('e9e6ada0cff94bcc9b5d2e94211d8372',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Currency:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ea64c27df71349c38a0c3eeac2fc81b2',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Individual:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ea947c75fb9c4752b867e4f22b2c2d05',TO_TIMESTAMP('2010-02-12 14:19:19.830', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:19:19.830', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'tm$TaskPatternGroup.browse',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('eaefb8795b0644cd977aa85a21dd2275',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Employee:delete',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('eb4f9c85a5fd40288af739178976ecab',TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'tm$Priority.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ec81d36459654b6f8bd64f2a2b441138',TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$GroupHierarchy:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ef73203afa75449ba99e619132f462e5',TO_TIMESTAMP('2010-04-22 15:54:00.350', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:54:00.350', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$DocKind:create',1,'0c018061b26f4de2a5bedff348347f93')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('f11d44b788744bf188d1b98dba9c9516',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sys$Folder:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('f26e67299c464960ab6dd47b97bb8156',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'wf$ProcRole:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('f2b77bf47d034c749288155e997ab917',TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.100', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Category:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('f2e05fcc017442698d073d5a8edc2906',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.310', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'sec$EntityLog:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('f43428db5edc42eb9a4640664f3f8efe',TO_TIMESTAMP('2010-04-22 15:51:05.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:51:05.480', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$Project:create',1,'0038f3dbac9c432383e7356996cc63ae')^
--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('f4ab8e510e6642c9b77d072a0e3e38d4',TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:29:39.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'tm$TaskPattern:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('f4b2661576924bf2bd311c46d76af6e4',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Organization:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('f754d3aa569841238f30cfbdc31c7499',TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Role:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('f946cc796e9443dba3aafed979d7b7ae',TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.790', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$GroupHierarchy:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('f9e7549bf5864208b87f3ff075e272d1',TO_TIMESTAMP('2010-02-12 14:28:46.970', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-02-12 14:40:34.480', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',TO_TIMESTAMP('2010-02-12 14:40:34.330', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',20,'wf$Calendar:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('fcad94a839dd457386a9c5d410c44e5d',TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:49:22.900', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$OrganizationAccount:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('fe3bb69a519246d7adcdda9049a82605',TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:26:07.780', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'sec$Permission:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('fe848eea516f4adcb2a265e1ca5f34b8',TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-02-12 14:17:14.630', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'sec$User.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('ff4e3a95ddc14e839dd11339bb1dafa4',TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 15:44:40.800', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$Bank:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('62c68f85985a49f79d8487d555dd33a6',TO_TIMESTAMP('2010-05-05 16:06:06.680', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-05-05 16:06:06.680', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$SimpleDoc:delete',1,'3c9abffb2fae484e990c343b3c1197ca')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9177a0e5c4164124b7df20bf6cbc23b4',TO_TIMESTAMP('2010-05-05 16:06:06.680', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-05-05 16:06:06.680', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$SimpleDoc:create',1,'3c9abffb2fae484e990c343b3c1197ca')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('c4e42857eea643308797bccb6a97de10',TO_TIMESTAMP('2010-05-05 16:06:06.680', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-05-05 16:06:06.680', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$SimpleDoc:update',1,'3c9abffb2fae484e990c343b3c1197ca')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('504be533434f4914b7a8b27f5e1b3299',TO_TIMESTAMP('2010-05-05 16:06:06.680', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-05-05 16:06:06.680', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'tm$TaskPattern.browse',1,'f7ff1ec7802d4a42a7db1a97e17f893f')^


INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('9e75c7eba43044f78b51b9f6db4dd90f', TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$DocIncome.browse', 1, '7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('6ed2a5df8d7c42ac8eefe1bf0edc95a9', TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$DocInternal.browse', 1, '7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('33dd26aca1d84894a7b15afe0a069773', TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$OfficeFileNomenclature.browse', 1, '7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('0db798c798ab41ce82ce7eb116953554', TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$DocReceivingMethod.browse', 1, '7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('88d0aa5c3b8442c5b715ccd24bcf59d8', TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$DocOutcome.browse', 1, '7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('e76d68f84e4a4972b1e56e19e0381e1d', TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:11.42', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$OfficeFile.browse', 1, '7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('b525fcc629634c95ab53736d513d2e87', TO_TIMESTAMP('2010-05-20 13:04:47.47', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:47.47', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$OfficeFile.browse', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('ce5eea1861124e8c935431f70f557151', TO_TIMESTAMP('2010-05-20 13:04:47.47', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:47.47', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$DocReceivingMethod.browse', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('76eaa12b4d9c45e682654e88241d6c8d', TO_TIMESTAMP('2010-05-20 13:04:47.48', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:47.48', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$OfficeFileNomenclature.browse', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('a275efdedb56483d8d44675336311faa', TO_TIMESTAMP('2010-05-20 13:04:47.48', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:47.48', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$DocIncome.browse', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('deddf997f5d2451296ef49b41be754af', TO_TIMESTAMP('2010-05-20 13:04:47.48', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:47.48', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$DocOutcome.browse', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('5a8d93b9c2ac454db88b16967973a54e', TO_TIMESTAMP('2010-05-20 13:04:47.49', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:47.49', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'df$DocInternal.browse', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('3ccc3e086c9a11dfb69fabdb42ff7f18', TO_TIMESTAMP('2010-05-20 13:04:47.49', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:47.49', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'sec$User.edit', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('2dc3ec4cb73311df932a2b8e44e58220', TO_TIMESTAMP('2010-05-20 13:04:47.49', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:47.49', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'jmxConsole', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('76a6977ab73311dfb52afb44c9d29968', TO_TIMESTAMP('2010-05-20 13:04:47.49', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 13:04:47.49', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'core$Entity.restore', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('e75f3112aa0c4bac8025e5af579595f8', TO_TIMESTAMP('2010-05-05 16:06:06.68', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-05 16:06:06.68', 'YYYY-MM-DD HH24:MI:SS.FF'), null, null, null, 20, 'df$Doc:delete', 1, '3c9abffb2fae484e990c343b3c1197ca')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('e889f226ddeb4f7a80fa5f368ab6aa34', TO_TIMESTAMP('2010-05-05 16:06:06.68', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-05 16:06:06.68', 'YYYY-MM-DD HH24:MI:SS.FF'), null, null, null, 20, 'df$Doc:create', 1, '3c9abffb2fae484e990c343b3c1197ca')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('5b503fe4aec941869271bdc077315eb0', TO_TIMESTAMP('2010-05-05 16:06:06.68', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-05 16:06:06.68', 'YYYY-MM-DD HH24:MI:SS.FF'), null, null, null, 20, 'df$Doc:update', 1, '3c9abffb2fae484e990c343b3c1197ca')^

INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('b9bf7d7f82424fdeb550e33d8c0c0545', TO_TIMESTAMP('2010-05-20 14:12:48.65', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 14:12:48.65', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'systemSettings', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value_, role_id) VALUES ('d9212fa1a02d48e3896c81c741fb2c5b', TO_TIMESTAMP('2010-05-20 14:15:26.38', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, TO_TIMESTAMP('2010-05-20 14:15:26.38', 'YYYY-MM-DD HH24:MI:SS.FF'), NULL, NULL, NULL, 10, 'systemSettings', 1, '0c018061b26f4de2a5bedff348347f93')^

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('826c59e4593d11e0afdc87a3d5cee637',null,'admin',1,null,null,null,null,40,'cuba.gui.showInfo',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

---------------------------------------------------------------------------------------------------

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,20,'tm$Project:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

---------------------------

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,20,'df$DocKind:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,20,'df$DocKind:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,20,'df$DocKind:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,10,'sys$Category.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

-----------------------------------------------------------------------------------------------------



INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,20,'df$OfficeFile:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,20,'df$OfficeFile:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,20,'df$OfficeFile:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,20,'df$OfficeFileNomenclature:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,20,'df$OfficeFileNomenclature:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,20,'df$OfficeFileNomenclature:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$OfficeFileNomenclature:create',1,'7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$OfficeFileNomenclature:update',1,'7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$OfficeFileNomenclature:delete',1,'7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$OfficeFile:create',1,'7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$OfficeFile:update',1,'7091f5efa77a450a834a39406885676e')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$OfficeFile:delete',1,'7091f5efa77a450a834a39406885676e')^

----------------------------------------------------------------------------------------------------
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'wf$AttachmentType:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'wf$AttachmentType:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'wf$AttachmentType:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$TypicalResolution:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$TypicalResolution:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$TypicalResolution:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$TypicalResolution:create',1,'c06c0cee2f2142418d6f76b4cd462f96')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$TypicalResolution:update',1,'c06c0cee2f2142418d6f76b4cd462f96')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$TypicalResolution:delete',1,'c06c0cee2f2142418d6f76b4cd462f96')^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$TypicalResolution:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$TypicalResolution:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'df$TypicalResolution:delete',1,'0038f3dbac9c432383e7356996cc63ae')^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'wf$AttachmentType:create',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'wf$AttachmentType:update',1,'0038f3dbac9c432383e7356996cc63ae')^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,20,'wf$AttachmentType:delete',1,'0038f3dbac9c432383e7356996cc63ae')^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,USER,1,10,'df$TypicalResolution.browse',1,'0038f3dbac9c432383e7356996cc63ae')^

----------------------------------------------------------------------------------------------------

INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('0c0110cf75fc458898ab9b0ea7427f60',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,10,'tm$ScheduleTask.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('4b498d4705ce4bdca598163799386316',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,10,'tm$ScheduleActionType.browse',1,'0c018061b26f4de2a5bedff348347f93')^
INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8be19e1d973d44919df9ed30ff785ba9',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,10,'tm$ScheduleActionType.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8f402cc1254047cb98072fd56abedee5',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,10,'tm$ScheduleTask.browse',1,'5115e83341464c98a1191c06053adb92')^

-------------------------------

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9019aa9660dc11e0bc0b17274be9dbd9',current_timestamp,null,1,null,null,null,null,10,'wf$Design.browse',1,'0c018061b26f4de2a5bedff348347f93')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('96a6d56e60dc11e0b3981748ee18874b',current_timestamp,null,1,null,null,null,null,10,'wf$Design.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

----------------------------

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('9949bcba593d11e09c429b7369fed5db',current_timestamp,null,1,null,null,null,null,10,'wf$ProcStageType.browse',1,'0c018061b26f4de2a5bedff348347f93')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('749504a6593d11e08e4e9fd908e1e0e2',current_timestamp,null,1,null,null,null,null,10,'wf$ProcStageType.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

----------------------------

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('41fd6ef4047b11e19daeb795ca9a4604',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,10,'df$UserSubstitution.browse',1,'b6a03cd4047911e1b6c977dd813b99ee')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('757377c4048011e1a7aedf74fc362788',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,10,'df$UserSubstitution.edit',1,'b6a03cd4047911e1b6c977dd813b99ee')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('7a7b4f44048011e18d1d7ff443e73f88',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,20,'sec$UserSubstitution:create',1,'b6a03cd4047911e1b6c977dd813b99ee')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('7f168244048011e187cab77b6e8c1e4b',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,20,'sec$UserSubstitution:update',1,'b6a03cd4047911e1b6c977dd813b99ee')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('83b055b4048011e18afd978c96b5602f',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,20,'sec$UserSubstitution:delete',1,'b6a03cd4047911e1b6c977dd813b99ee')^

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('8b17059e045a11e19ff05b3f364a9175',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,10,'df$UserSubstitution.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('567d2324048011e1872513795b5a61a9',CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,10,'df$UserSubstitution.edit',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('aa940db2348e11e28367d3d3737e10e1',current_timestamp,'admin',1,current_timestamp,null,null,null,10,'core$ScheduledTask.browse',1,'0c018061b26f4de2a5bedff348347f93')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('afeff4b0348e11e2810a07a133526258',current_timestamp,'admin',1,current_timestamp,null,null,null,10,'core$ScheduledTask.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

----------------------------------------------------------------------------------------------------

INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('a6935664885e11e1924883ef391ff91f',TO_TIMESTAMP('2010-04-08 16:29:37.700', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-08 16:29:37.700', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'printDomain',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('83140af2885f11e19aa3876f4796e54c',TO_TIMESTAMP('2010-04-08 16:29:37.700', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-08 16:29:37.700', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'printDomain',1,'0c018061b26f4de2a5bedff348347f93')^

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES ('94de95ef0490441ebeb381b0ae0541d3',TO_TIMESTAMP('2013-04-19 15:35:05.93', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2013-04-19 15:35:05.93', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,10,'reassignment.form',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null,10,'entityRestore',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

----------------------------

insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:create',1,'7091f5efa77a450a834a39406885676e')^
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:update',1,'7091f5efa77a450a834a39406885676e')^
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:delete',1,'7091f5efa77a450a834a39406885676e')^
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 10,'df$ReservationNumber.browse',1,'7091f5efa77a450a834a39406885676e')^

insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:create',1,'0c018061b26f4de2a5bedff348347f93')^
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:update',1,'0c018061b26f4de2a5bedff348347f93')^
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:delete',1,'0c018061b26f4de2a5bedff348347f93')^
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 10,'df$ReservationNumber.browse',1,'0c018061b26f4de2a5bedff348347f93')^

insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value_,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 10,'df$ReservationNumber.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

----------------------------

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$MeetingDoc:create',1,'80145594f020e85cd2597a293c035495')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$MeetingDoc:update',1,'80145594f020e85cd2597a293c035495')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$MeetingDoc:delete',1,'80145594f020e85cd2597a293c035495')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$MeetingDoc:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$MeetingDoc:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',1,TO_TIMESTAMP('2010-04-22 16:00:04.550', 'YYYY-MM-DD HH24:MI:SS.FF'),null,null,null,20,'df$MeetingDoc:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

----------------------------

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,10,'assistantWebSocketStatuses',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value_,role_id) VALUES (newid(),CURRENT_TIMESTAMP,'admin',1,CURRENT_TIMESTAMP,null,null,null,10,'assistantWebSocketStatuses',0,'0c018061b26f4de2a5bedff348347f93')^

----------------------------------------------------------------------------------------------------
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('c0972ef2631c448b9d476738fe4caf92',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'admin',1,20,'ts$OperatorEdm:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('5792b00783bd4d9b9f1044af7b4fff86',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'admin',1,20,'ts$OperatorEdm:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('5de976a95ccb4bce90da96fb429eb920',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'admin',1,20,'ts$OperatorEdm:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('6e0bb2cb4708422f960d9a0dfffd1420',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'admin',1,20,'ts$OperatorEdm:read',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('c3dd2cb7e232492ab894cc7552435aa4',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'admin',1,10,'ts$OperatorEdm.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
----------------------------------------------------------------------------------------------------
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('b902b79d44234ccc9a8e40799b017b57',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('5a86e2174dab4d27a3220626b9cde9ee',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('8b63b7e3a740482393c996e8e79c95d8',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('25dbe4f0b23c4a049f8921476d6fb6fe',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:read',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('0f39428bc0424a4db3500fdf25bc6d9d',current_timestamp,current_timestamp,'admin',1,10,'ts$SubscriberEdm.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
----------------------------------------------------------------------------------------------------
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('e4d9f3717773439dbb5062a906b7252d',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('46086834c2ac4e1892f097008f9f96fe',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('cfcc30543f6542aa8cc6dbc74c8e585d',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:read',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value_,role_id) VALUES ('a761f635f6f44bf382b737c97ad19d08',current_timestamp,current_timestamp,'admin',1,10,'ts$EdmSending.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
------------------------------------------------------------------------------------------------------

insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('91ac3881fd814e54a0a5165d795ccd73',current_timestamp,'admin',current_timestamp,null,null,1,null,null)^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('161b69cfec5343b7bdfbb60ec8815cb4',current_timestamp,'admin',current_timestamp,null,null,2,TO_TIMESTAMP('09:00', 'HH24:MI'),TO_TIMESTAMP('13:00', 'HH24:MI'))^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('e87c4db4eb7a4a35ace029b6bb63095f',current_timestamp,'admin',current_timestamp,null,null,2,TO_TIMESTAMP('14:00', 'HH24:MI'),TO_TIMESTAMP('18:00', 'HH24:MI'))^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('9b64d3ab11324f40ac2bbb8df7ec25c6',current_timestamp,'admin',current_timestamp,null,null,3,TO_TIMESTAMP('09:00', 'HH24:MI'),TO_TIMESTAMP('13:00', 'HH24:MI'))^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('d31a2aeccc9f464a8302e43f8b92a8c5',current_timestamp,'admin',current_timestamp,null,null,3,TO_TIMESTAMP('14:00', 'HH24:MI'),TO_TIMESTAMP('18:00', 'HH24:MI'))^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('868958ec2b0c487fb1923a2b086d73e3',current_timestamp,'admin',current_timestamp,null,null,4,TO_TIMESTAMP('09:00', 'HH24:MI'),TO_TIMESTAMP('13:00', 'HH24:MI'))^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('8368e326689c4c61b2345d35b88a9270',current_timestamp,'admin',current_timestamp,null,null,4,TO_TIMESTAMP('14:00', 'HH24:MI'),TO_TIMESTAMP('18:00', 'HH24:MI'))^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('7726565fdaf64dfe858cf8cf71aef0ce',current_timestamp,'admin',current_timestamp,null,null,5,TO_TIMESTAMP('09:00', 'HH24:MI'),TO_TIMESTAMP('13:00', 'HH24:MI'))^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('17c2861eb578425d857902f6dea3f87b',current_timestamp,'admin',current_timestamp,null,null,5,TO_TIMESTAMP('14:00', 'HH24:MI'),TO_TIMESTAMP('18:00', 'HH24:MI'))^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('950e60d99f1a42a391e95392fa1f8ef9',current_timestamp,'admin',current_timestamp,null,null,6,TO_TIMESTAMP('09:00', 'HH24:MI'),TO_TIMESTAMP('13:00', 'HH24:MI'))^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('bb8b0b04fc1645c3a37736044a371014',current_timestamp,'admin',current_timestamp,null,null,6,TO_TIMESTAMP('14:00', 'HH24:MI'),TO_TIMESTAMP('18:00', 'HH24:MI'))^
insert into WF_CALENDAR (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) values ('d06a8ef683244c1fa022eb939d048cb3',current_timestamp,'admin',current_timestamp,null,null,7,null,null)^

------------------------------------------------------------------------------------------------------------

INSERT INTO TM_PRIORITY (id,name,order_no,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by) VALUES ('2562cb310ebc477ba1241cc618108be3','Нормальный',3,TO_TIMESTAMP('2010-01-26 10:22:08.280', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-01-26 14:39:36.920', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null)^
INSERT INTO TM_PRIORITY (id,name,order_no,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by) VALUES ('36518fcf6fe942a9ada2e45b7e545cfa','Высокий',2,TO_TIMESTAMP('2010-01-26 10:22:12.300', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-01-26 14:39:39.520', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null)^
INSERT INTO TM_PRIORITY (id,name,order_no,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by) VALUES ('6d40219cb25845f096ef2d3da048e76f','Низкий',4,TO_TIMESTAMP('2010-01-26 10:22:18.690', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-01-26 14:39:41.880', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null)^
INSERT INTO TM_PRIORITY (id,name,order_no,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by) VALUES ('9567d315188046ac94ee65de44e7e3e4','Критический',1,TO_TIMESTAMP('2010-03-04 10:16:43.750', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',2,TO_TIMESTAMP('2010-03-04 10:17:31.560', 'YYYY-MM-DD HH24:MI:SS.FF'),'admin',null,null)^

------------------------------------------------------------------------------------------------------------

insert into TS_CARD_TYPE (ID, CREATE_TS, CREATED_BY, NAME, DISCRIMINATOR)
values ('0c96fad842f74ecb86898ce62f946b7b', current_timestamp, 'admin', 'tm$Task', 20)^

insert into TS_CARD_TYPE (ID, CREATE_TS, CREATED_BY, NAME, DISCRIMINATOR)
values ('1665ef302b4411dfb1c6bf8783a93da6', current_timestamp, 'admin', 'df$SimpleDoc', 110)^

insert into TS_CARD_TYPE (ID, CREATE_TS, CREATED_BY, NAME, DISCRIMINATOR, FIELDS_XML)
values ('ae67f5f635aa11dfa04a3345dd531def', current_timestamp, 'admin', 'df$Contract', 120,
'<?xml version="1.0" encoding="UTF-8"?>
<fields>
    <field name="finishDatePlan" visible="false" required="false"/>
    <field name="resolution" visible="false" required="false"/>
</fields>
')^

insert into TS_CARD_TYPE (ID, CREATE_TS, CREATED_BY, NAME, DISCRIMINATOR)
values ('5aa5ef34af4411dfb1c6af3783a11da6', current_timestamp, 'admin', 'df$MeetingDoc', 130)^

------------------------------------------------------------------------------------------------------------

insert into DF_CURRENCY (ID, NAME, CODE, DIGITAL_CODE) values ('409bd4d2cfa211e084b013f6ef08af82', 'Рубль', 'RUB', '643')^

------------------------------------------------------------------------------------------------------------

alter table WF_ATTACHMENT add PORTAL_PUBLISH_STATE varchar2(5 char)^
alter table WF_ATTACHMENT add MAIN char(1)^
alter table WF_ATTACHMENT add SIGN char(1)^

ALTER TABLE WF_ATTACHMENT add ORGANIZATION_ID varchar2(32 char)^
alter table WF_ATTACHMENT add constraint FK_WF_ATTACHMENT_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^

ALTER TABLE WF_ATTACHMENT add CORRESPONDENT_ID varchar2(32 char)^
alter table WF_ATTACHMENT add constraint FK_WF_ATTACHMENT_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT (ID)^

------------------------------------------------------------------------------------------------------------

insert into TM_SCHEDULE_ACTION_TYPE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,screen_id,entity_name,processor_class_name) values (newid(),CURRENT_TIMESTAMP,USER,7,CURRENT_TIMESTAMP,USER,null,null,'Запуск задачи','tm$StartTaskScheduleAction.edit','tm$StartTaskScheduleAction','com.haulmont.thesis.core.schedule.ext.StartTaskScheduleActionProcessor')^

-------------------------------------------------------------------------------------------------------------

insert into WF_ATTACHMENTTYPE (ID,CODE,ISDEFAULT)
values ('144feeb65ad811e0a80dcf59394498a5','AttachmentType.executorAttachment',0)^

-------------------------------------------------------------------------------------------------------------

insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, value_, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:create', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, value_, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:update', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, value_, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:delete', 0, '96fa7fe9397d4bacb14aeec2d94de68c')^

insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, value_, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:create', 1, '0038f3dbac9c432383e7356996cc63ae')^
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, value_, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:update', 1, '0038f3dbac9c432383e7356996cc63ae')^
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, value_, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:delete', 1, '0038f3dbac9c432383e7356996cc63ae')^

insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, value_, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:create', 1, '7091f5efa77a450a834a39406885676e')^
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, value_, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:update', 1, '7091f5efa77a450a834a39406885676e')^
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, value_, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:delete', 1, '7091f5efa77a450a834a39406885676e')^


INSERT INTO SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, value_, ROLE_ID)
VALUES ('8758c0605c4d11e0869633f82bb15aff', 40, 'cuba.gui.appFolder.global',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO SEC_PERMISSION (ID,  PERMISSION_TYPE, TARGET, value_, ROLE_ID)
VALUES ('8f80f37a5c4d11e0af0f63f861b2275a', 40, 'cuba.gui.searchFolder.global',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

INSERT INTO SEC_PERMISSION (ID,  PERMISSION_TYPE, TARGET, value_, ROLE_ID)
VALUES ('ec19b976fa6511e092bea345180a50f5', 40, 'cuba.gui.presentations.global',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

INSERT INTO SEC_PERMISSION (ID,  PERMISSION_TYPE, TARGET, value_, ROLE_ID)
VALUES ('566e2541b36b4ea6ad3747b95a7381e2', 10, 'report$Report.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^

-------------------------------------------------------------------------------------------------------------

create index idx_df_doc_office_data_doc on df_doc_office_data (doc_id)^

create index idx_tm_card_project_card on tm_card_project (card_id)^

create index idx_tm_task_finish_date_plan on tm_task (finish_date_plan)^

create index idx_tm_schedule_trigger_active on tm_schedule_trigger (active)^

create index idx_ddtl_doc_office_data on df_doc_transfer_log (doc_office_data_id)^ -- renamed

create index idx_ddod_response_to_doc on df_doc_office_data (response_to_doc_id)^ -- renamed

create index idx_df_doc_version_of on df_doc (version_of_id)^

create index idx_df_doc_is_template on df_doc (is_template)^

create index idx_employee_department on df_employee(department_id)^

create index idx_employee_user ON df_employee  (user_id)^

----------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW df_department_membership AS
WITH hdep(correspondent_id, parent_department_id, level_ , top_level_id) AS
(
     SELECT d.correspondent_id, d.parent_department_id, 0 as level_, d.correspondent_id
     FROM df_department d
     UNION ALL
     SELECT d1.correspondent_id, d1.parent_department_id,  h.level_ + 1, h.top_level_id
     FROM hdep h, df_department d1
     WHERE d1.parent_department_id = h.correspondent_id
     )
select distinct cast(null as varchar2(32 char)) as id, e.user_id, hdepEdr.correspondent_id as department_id
from (select h.correspondent_id, h.top_level_id, edr.employee_id
    from hdep h join df_employee_department_pos edr
    on edr.department_id = h.top_level_id and edr.delete_ts is null) hdepEdr,  df_employee e
    where e.correspondent_id = hdepEdr.employee_id
        and e.user_id is not null and
         (hdepEdr.top_level_id = hdepEdr.correspondent_id
         or exists (
            select r.id from sec_role r join sec_user_role ur
            on r.id = ur.role_id
                and ur.delete_ts is null
                and r.name = 'DepartmentChief'
                where ur.user_id = e.user_id))^

----------------------------------------------------------------------------------------------------------------

delete from SEC_FILTER sf where sf.id = 'b61d18cbe79a46f3b16deaf4aebb10dd'^
delete from SEC_FILTER sf where sf.name = 'Search by role' and sf.user_id = '608859871b61424794c7dff348347f93'^

----------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION create_or_update_sec_permissi( -- renamed create_or_update_sec_permission
    r_name   IN varchar2,  -- sec_role.name
    p_target IN varchar2,  -- sec_permission.target
    p_type   IN integer,   -- sec_permission.type
    p_value  IN integer    -- sec_permission.value
)
RETURN varchar2 IS
    p_id varchar2(32 char);
    PRAGMA AUTONOMOUS_TRANSACTION;  -- start anonymous transaction
BEGIN
    p_id := NULL;
    select p.id into p_id   -- return p_id;
    from SEC_PERMISSION p
    join SEC_ROLE r
    on r.id = p.role_id
    where r.name = r_name and p.target = p_target
    and ROWNUM = 1;

    IF p_id is not null THEN
        update SEC_PERMISSION p set p.PERMISSION_TYPE = p_type, p.value_ = p_value where p.id = p_id;
        COMMIT;     -- commit anonymous transaction
        RETURN 'SEC_PERMISSION record was updated';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND
    THEN insert into SEC_PERMISSION (
          id,
          create_ts,
          created_by,
          VERSION,
          PERMISSION_TYPE,
          TARGET,
          value_,
          role_id
        ) values (
          newid(),
          CURRENT_TIMESTAMP,
          USER,
          1,
          p_type,
          p_target,
          p_value,
          (select id from sec_role where name = r_name)
        );
        COMMIT;     -- commit anonymous transaction
        RETURN 'SEC_PERMISSION record was created';
END create_or_update_sec_permissi;^


alter table WF_DEFAULT_PROC_ACTOR add STRATEGY_ID varchar2(255 char)^

alter table SEC_USER add DTYPE varchar(50)^
alter table WF_PROC_ROLE add DTYPE varchar(50)^
alter table WF_CARD_ROLE add DTYPE varchar(50)^
alter table SEC_GROUP add DTYPE varchar(50)^
alter table SYS_ENTITY_STATISTICS add DTYPE varchar(50)^
alter table WF_CARD_COMMENT add DTYPE varchar(50)^
alter table REPORT_REPORT add DTYPE varchar(50)^
alter table WF_USER_GROUP add DTYPE varchar(50)^
alter table WF_PROC add DTYPE varchar(50)^
alter table SEC_USER_SUBSTITUTION add DTYPE varchar(50)^
alter table WF_DEFAULT_PROC_ACTOR add DTYPE varchar(50)^
alter table SEC_ROLE add DTYPE varchar(50)^
alter table WF_ASSIGNMENT add DTYPE varchar(50)^
alter table WF_CARD_PROC add DTYPE varchar(50)^

CREATE OR REPLACE FUNCTION assign_card_creator_default( -- renamed: assign_card_creator_default_process_actor
    proc_role_code IN varchar2,     -- process role code
    proc_code IN varchar2)          -- process code
RETURN varchar2 IS
    proc_role_rec WF_PROC_ROLE%rowtype;
    default_proc_actors_count integer;
    is_default_actor_exists char(1);
    count_of_proc_actors integer;
    PRAGMA AUTONOMOUS_TRANSACTION;  -- start anonymous transaction
BEGIN
    if (proc_role_code is null or proc_code is null)
    then
	    return 'Process and role codes must not be null';
    else
        BEGIN
            select * into proc_role_rec
            from WF_PROC_ROLE proc_role
            where id = (select pr.id
                from WF_PROC_ROLE pr
                join WF_PROC p
                on p.ID = pr.PROC_ID
                where pr.CODE = proc_role_code and p.CODE = proc_code and pr.DELETE_TS is null and ROWNUM = 1);

            select case
                when exists (select ID
                    from WF_DEFAULT_PROC_ACTOR
                    where PROC_ROLE_ID = proc_role_rec.ID
                        and USER_ID is null
                        and STRATEGY_ID = 'ts_CardAuthorProcessActorStrategy'
                        and DELETE_TS is null)
                 then 1
                 else 0
            end
            into is_default_actor_exists
            from dual;

            if (proc_role_rec.id is not null) then
                if proc_role_rec.IS_MULTI_USER = 1 and is_default_actor_exists = 1
                then
                    return 'Process role already have creator process actor';
                end if;

                select count(*) into count_of_proc_actors from WF_DEFAULT_PROC_ACTOR where PROC_ROLE_ID = proc_role_rec.ID and DELETE_TS is null;
                if proc_role_rec.IS_MULTI_USER = 0 and count_of_proc_actors > 0
                then
                    return 'Process role multi assignment disabled and it already has default actor';
                end if;

                insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, VERSION, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE)
                values (newid(), current_timestamp, 'admin', 1, proc_role_rec.ID, 1, 'ts_CardAuthorProcessActorStrategy', '10');
                COMMIT;     -- commit anonymous transaction

                return 'Creator default process actor has been successfully created';
            end if;
        EXCEPTION
            WHEN NO_DATA_FOUND
            THEN return 'Can not find corresponded process role';
        END;
    end if;
END assign_card_creator_default;^

select create_or_update_sec_permissi('ReferenceEditor', 'df$Department:update', 20, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'report$ReportGroup.browse', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'report$Report.edit', 10, 0) from dual^
select create_or_update_sec_permissi('Administrators', 'report$ReportGroup.browse', 10, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'tm$Task:delete', 20, 1) from dual^

select create_or_update_sec_permissi('ReferenceEditor', 'df$CorrespondentAttachment:create', 20, 1) from dual^
select create_or_update_sec_permissi('ReferenceEditor', 'df$CorrespondentAttachment:update', 20, 1) from dual^
select create_or_update_sec_permissi('ReferenceEditor', 'df$CorrespondentAttachment:delete', 20, 1) from dual^

select create_or_update_sec_permissi('Administrators', 'df$CorrespondentAttachment:create', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$CorrespondentAttachment:update', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$CorrespondentAttachment:delete', 20, 1) from dual^

select create_or_update_sec_permissi('SimpleUser', 'df$CorrespondentAttachment:create', 20, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'df$CorrespondentAttachment:update', 20, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'df$CorrespondentAttachment:delete', 20, 0) from dual^

select create_or_update_sec_permissi('ReferenceEditor', 'df$OrganizationAttachment:create', 20, 1) from dual^
select create_or_update_sec_permissi('ReferenceEditor', 'df$OrganizationAttachment:update', 20, 1) from dual^
select create_or_update_sec_permissi('ReferenceEditor', 'df$OrganizationAttachment:delete', 20, 1) from dual^

select create_or_update_sec_permissi('Administrators', 'df$OrganizationAttachment:create', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$OrganizationAttachment:update', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$OrganizationAttachment:delete', 20, 1) from dual^

select create_or_update_sec_permissi('SimpleUser', 'df$OrganizationAttachment:create', 20, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'df$OrganizationAttachment:update', 20, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'df$OrganizationAttachment:delete', 20, 0) from dual^

select create_or_update_sec_permissi('Administrators', 'df$TypicalResolution:create', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$TypicalResolution:update', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$TypicalResolution:delete', 20, 1) from dual^

select create_or_update_sec_permissi('Administrators', 'thesis.mobileSettings.edit', 40, 1) from dual^

select create_or_update_sec_permissi('SimpleUser', 'df$DocKind.edit', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'ts$CardType.edit', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$Role.edit', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'tm$TaskType.edit', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sys$ScheduledTask.browse', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sys$ScheduledTask.edit', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'performanceStatistics', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'screenProfiler', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'mobileClientAdministrationWindow', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'entityInspector.browse', 10, 0) from dual^

update sys_category_attr set data_type = 'com.haulmont.cuba.security.entity.User' where data_type = 'com.haulmont.thesis.core.entity.TmUser'^

insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, value_, ROLE_ID)
select newid(), CURRENT_TIMESTAMP, null, 1, null, null, null, null, 40, 'thesis.userGroup.edit.global', 1, ID from SEC_ROLE where NAME in ('Administrators', 'ReferenceEditor')
^

insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, value_, ROLE_ID)
select newid(), CURRENT_TIMESTAMP, null, 1, null, null, null, null, 40, 'thesis.userGroup.edit.global', 0, ID from SEC_ROLE where NAME = 'SimpleUser'
^

insert into sec_permission (id, create_ts, created_by, PERMISSION_TYPE, target, value_, role_id)
values ('e91407e0725b11e197384f4aa51f761f', CURRENT_TIMESTAMP, 'admin', 10, 'serverLog', 0, '96fa7fe9397d4bacb14aeec2d94de68c')
^

alter table DF_CATEGORY add constraint FK_DF_CATEGORY_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table DF_TYPICAL_RESOLUTION add constraint FK_DTR_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^ -- renamed
alter table TM_PROJECT add constraint FK_TM_PROJECT_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_PROJECT_GROUP add constraint FK_TPG_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^ -- renamed
alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TSTSA_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^ -- renamed
alter table TM_TASK add constraint FK_TM_TASK_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK_PATTERN add constraint FK_TTP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^ -- renamed
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK_PATTERN_GROUP add constraint FK_TTPG_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^ -- renamed
alter table SEC_USER add constraint FK_SEC_USER_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table WF_USER_GROUP add constraint FK_WF_USER_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^

create index IDX_USER_GROUP_ORG_ID on WF_USER_GROUP(ORGANIZATION_ID)^
create index IDX_U_GROUP_SUB_CREATOR_ID on WF_USER_GROUP(SUBSTITUTED_CREATOR_ID)^
create index IDX_WF_USER_GROUP_USER on WF_USER_GROUP_USER(USER_ID, USER_GROUP_ID)^

alter table DF_DOC add IMPORTED char(1)^
update DF_DOC set IMPORTED = 0^

select create_or_update_sec_permissi('Administrators', 'df$Organization.browse', 10, 1) from dual^

insert into SEC_USER (ID, CREATE_TS, VERSION, LOGIN, LOGIN_LC, PASSWORD, NAME, GROUP_ID, ACTIVE)
values ('b18e3c10032811e2969afb0e8fd8c622', CURRENT_TIMESTAMP, 0, 'system', 'system', '6a9e40c1c2439a85035943bda146d965', 'System user', '0fa2b1a51d684d699fbddff348347f93', 1)^

select create_or_update_sec_permissi('Administrators', 'wf$UserNotifiedBySms.browse', 10, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'wf$UserNotifiedBySms.browse', 10, 0) from dual^
select create_or_update_sec_permissi('Administrators', 'wf$SendingSms.browse', 10, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'wf$SendingSms.browse', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'df$FastRegistration', 10, 0) from dual^
select create_or_update_sec_permissi('Administrators', 'df$FastRegistration', 10, 1) from dual^
select create_or_update_sec_permissi('doc_secretary', 'df$FastRegistration', 10, 1) from dual^

select create_or_update_sec_permissi('Administrators', 'userMobileBrowse', 10, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'userMobileBrowse', 10, 0) from dual^

select create_or_update_sec_permissi('Administrators', 'df$AppIntegrationLog.browse', 10, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'df$AppIntegrationLog.browse', 10, 0) from dual^
select create_or_update_sec_permissi('AppIntegrationRole', 'df$AppIntegrationLog.browse', 10, 1) from dual^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('4b7441763f8811e2b1f42387c06904ee',CURRENT_TIMESTAMP,'system',1,20,'df$Position:update',1,(select id from SEC_ROLE where name = 'Administrators'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('fa9dac643f8811e2baa9abdc5402291f',CURRENT_TIMESTAMP,'system',1,20,'df$Position:delete',1,(select id from SEC_ROLE where name = 'Administrators'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('fade084a3f8811e2bfbc1754d44c59ad',CURRENT_TIMESTAMP,'system',1,20,'df$Position:read',1,(select id from SEC_ROLE where name = 'Administrators'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('fae06a863f8811e2b3864ffc775f57ea',CURRENT_TIMESTAMP,'system',1,20,'df$Position:create',1,(select id from SEC_ROLE where name = 'Administrators'))^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('fae52ef43f8811e28581470be131402f',CURRENT_TIMESTAMP,'system',1,20,'df$Position:update',1,(select id from SEC_ROLE where name = 'ReferenceEditor'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('fae52ef43f8811e28a34cf46cd2037e8',CURRENT_TIMESTAMP,'system',1,20,'df$Position:delete',1,(select id from SEC_ROLE where name = 'ReferenceEditor'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('fae9f3623f8811e2ba712bf955c28f6c',CURRENT_TIMESTAMP,'system',1,20,'df$Position:read',1,(select id from SEC_ROLE where name = 'ReferenceEditor'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('faf11a0c3f8811e28835ef8481161ae1',CURRENT_TIMESTAMP,'system',1,20,'df$Position:create',1,(select id from SEC_ROLE where name = 'ReferenceEditor'))^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('fb01c9923f8811e28845c3747e4f7b90',CURRENT_TIMESTAMP,'system',1,20,'df$Position:update',0,(select id from SEC_ROLE where name = 'SimpleUser'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('fb042bce3f8811e2ac1c9fc28b598153',CURRENT_TIMESTAMP,'system',1,20,'df$Position:delete',0,(select id from SEC_ROLE where name = 'SimpleUser'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value_,role_id)
VALUES ('fb068e003f8811e2a38423c38be8091f',CURRENT_TIMESTAMP,'system',1,20,'df$Position:create',0,(select id from SEC_ROLE where name = 'SimpleUser'))^

---------------------------------------------------------------------------------------------------

INSERT ALL
    INTO DF_IMPORT_DATA_TYPE (id, create_ts, created_by, version, name, meta_class_name)
    VALUES ('ff801f90a38911e2a895f7261fdb7f5a', CURRENT_TIMESTAMP, 'admin', 1 , 'Документ' , 'df$SimpleDoc')

    INTO DF_IMPORT_DATA_TYPE (id, create_ts, created_by, version, name, meta_class_name)
    VALUES ('33433e50a38c11e29506a71c3d8f3fe2', CURRENT_TIMESTAMP, 'admin', 1, 'Договор' , 'df$Contract')
SELECT * FROM dual^

INSERT ALL
    -------------------------          df$SimpleDoc               ----------------------------------
    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Категория', 'docCategory', 'df$Category')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Номер', 'number', 'String')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Вид', 'docKind', 'df$DocKind')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Подразделение', 'department', 'df$Department')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Куратор', 'owner', 'df$Employee')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Дата', 'date', 'Date')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Отправитель', 'sender', 'df$Company')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Рег.номер', 'regNo', 'String')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Адресат', 'docOfficeDataAddressees', 'df$Company')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Содержание', 'comment', 'String')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Дата регистрации', 'regDate', 'Date')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Канцелярский вид', 'docOfficeDocKind', 'DocOfficeDocKind')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Файлы', 'attachments', 'wf$CardAttachment')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Тема', 'theme', 'String')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Основание для приказа', 'orderCause', 'String')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, 'ff801f90a38911e2a895f7261fdb7f5a', 'Текст приказа', 'orderText', 'String')


    ---------------------------            df$Contract               --------------------------------------
    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Сумма', 'amount', 'BigDecimal')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Описание', 'comment', 'String')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Ставка, %', 'vatRate', 'BigDecimal')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Конт.лицо', 'contactPerson', 'df$ContactPerson')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Вид', 'docKind', 'df$DocKind')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Активный', 'active', 'Boolean')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Сумма НДС', 'vatAmount', 'BigDecimal')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'НДС в сумме', 'vatInclusive', 'Boolean')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Дата', 'date', 'Date')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Контрагент', 'contractor', 'df$Company')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Номер', 'number', 'String')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Подразделение', 'department', 'df$Department')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Организация', 'organization', 'df$Organization')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Условия платежа', 'paymentConditions', 'String')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Куратор', 'owner', 'df$Employee')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Начало обязательств', 'liabilityStart', 'Date')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Окончание обязательств', 'liabilityEnd', 'Date')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Категория', 'docCategory', 'df$Category')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Файлы', 'attachments', 'wf$CardAttachment')

    INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
    VALUES (newid(), CURRENT_TIMESTAMP, 'admin', 1, '33433e50a38c11e29506a71c3d8f3fe2', 'Валюта', 'currency', 'df$Currency')
SELECT * FROM dual^

select create_or_update_sec_permissi('Administrators', 'df$ImportDataType.browse', 10, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'df$ImportDataType.browse', 10, 0) from dual^
select create_or_update_sec_permissi('Administrators', 'tm$TaskType.browse', 10, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'tm$TaskType.edit', 10, 1) from dual^

select create_or_update_sec_permissi('Administrators', 'transferOfficeFile', 10, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'transferOfficeFile', 10, 0) from dual^


INSERT ALL
    INTO SYS_CONFIG(id, create_ts, created_by, version, name, value_)
    VALUES ('a64df96a25d911e3b75e93ea4236d5e4', CURRENT_TIMESTAMP, 'admin', 1, 'com.haulmont.thesis.core.config.organizationDefault', 'df$Organization-a851beaf-6890-4ab2-b847-b7a810c4c2b9')

    INTO SYS_CONFIG(id, create_ts, created_by, version, name, value_)
    VALUES ('0d8f9e9825db11e38c504f96a0994af2', CURRENT_TIMESTAMP, 'admin', 1, 'com.haulmont.thesis.core.config.currencyDefault', 'df$Currency-409bd4d2-cfa2-11e0-84b0-13f6ef08af82')

    INTO SYS_CONFIG(id, create_ts, created_by, version, name, value_)
    VALUES ('150b663e25db11e39d36e3b0db5c9947', CURRENT_TIMESTAMP, 'admin', 1, 'com.haulmont.thesis.core.config.priorityDefault', 'tm$Priority-2562cb31-0ebc-477b-a124-1cc618108be3')

    INTO SYS_CONFIG(id, create_ts, created_by, version, name, value_)
    VALUES ('1dacf0be25db11e39db8671686f3c707', CURRENT_TIMESTAMP, 'admin', 1, 'com.haulmont.thesis.core.config.taskTypeDefault', 'tm$TaskType-836d02a0-68a9-4aa5-b11a-08e9b32c589b-edit')

    INTO SYS_CONFIG(id, create_ts, created_by, version, name, value_)
    VALUES ('23dea3c425db11e3acc4df8f5c432b46', CURRENT_TIMESTAMP, 'admin', 1, 'com.haulmont.thesis.core.config.incomeNumeratorDefault', 'df$Numerator-bebc21e2-fce0-40c6-9202-7cffff7cf88e')

    INTO SYS_CONFIG(id, create_ts, created_by, version, name, value_)
    VALUES ('2b651a1a25db11e39ee7bfa91abd62c7', CURRENT_TIMESTAMP, 'admin', 1, 'com.haulmont.thesis.core.config.outcomeNumeratorDefault', 'df$Numerator-5618547c-a4c9-4bfd-a71e-d884cf49df57')

    INTO SYS_CONFIG(id, create_ts, created_by, version, name, value_)
    VALUES ('30654a2625db11e384a5a391cca407b5', CURRENT_TIMESTAMP, 'admin', 1, 'com.haulmont.thesis.core.config.internalNumeratorDefault', 'df$Numerator-36708c7f-e232-4451-a239-3f5a8fa10726')

    INTO SYS_CONFIG(id, create_ts, created_by, version, name, value_)
    VALUES ('35c5770225db11e392d7c76ffa73b284', CURRENT_TIMESTAMP, 'admin', 1, 'com.haulmont.thesis.core.config.defaultDocKind', 'df$DocKind-c40ea551-d399-4a11-b6be-347ca5f27837')

    INTO SYS_CONFIG(id, create_ts, created_by, version, name, value_)
    VALUES ('ab12370225db11e392d7c12ffa73b67a', CURRENT_TIMESTAMP, 'admin', 1, 'com.haulmont.thesis.core.config.defaultContractDocKind', 'df$DocKind-9cd678e3-7978-4f53-a503-a36bce3a76d6')

    INTO SYS_CONFIG(id, create_ts, created_by, version, name, value_)
    VALUES ('c40ea551d3994a11b6be347ca5f27837', CURRENT_TIMESTAMP, 'admin', 1, 'com.haulmont.thesis.core.config.defaultLetterDocKind', 'df$DocKind-c40ea551-d399-4a11-b6be-347ca5f27837')
SELECT * FROM dual^

select create_or_update_sec_permissi('SimpleUser', 'portalIntegration', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'tm$User.edit:fieldGroupLeft', 50, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'tm$User.edit:fieldGroupRight', 50, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'tm$User.edit:split', 50, 0) from dual^

select create_or_update_sec_permissi('SimpleUser', 'sec$User:position', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:password', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:organization', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:ipMask', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:name', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:login', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:firstName', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:middleName', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:lastName', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:changePasswordAtNextLogon', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:email', 30, 2) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:active', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:language', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:departmentCode', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:group', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:isMobile', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:activeDirectoryID', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:timeZone', 30, 1) from dual^
select create_or_update_sec_permissi('SimpleUser', 'sec$User:timeZoneAuto', 30, 1) from dual^

select create_or_update_sec_permissi('SimpleUser', 'certificationAuthoritySignatureRequestForm', 10, 0) from dual^
select create_or_update_sec_permissi('Administrators', 'certificationAuthoritySignatureRequestForm', 10, 1) from dual^

select create_or_update_sec_permissi('schedule_task_creator', 'tm$TaskPattern.browse', 10, 1) from dual^

alter table SEC_USER modify POSITION_ VARCHAR2(400 char)^

create table TS_REMOTE_CARD_STATE (
    id varchar2(32 char),
    create_ts timestamp,
    created_by varchar2(50 char),
    update_ts timestamp,
    updated_by varchar2(50 char),
    ---
    card_id varchar2(32 char),
    server_id varchar2(50 char),
    state varchar2(255 char),
    constraint fk_remote_card_state_to_card foreign key(card_id) references wf_card(id),
    primary key(id)
)^

create unique index idx_trc_state_unique on ts_remote_card_state (card_id, server_id)^ -- renamed

create index IDX_WF_ATTACHMENT_FILE_ID
  on wf_attachment(file_id)^

create index IDX_WA_CORRESPONDENT_ID -- renamed
  on wf_attachment(correspondent_id)^

create index IDX_WA_ORGANIZATION_ID -- renamed
  on wf_attachment(organization_id)^

create index IDX_WA_RECOGNIZED_FILE_ID -- renamed
  on wf_attachment(recognized_file_id)^

create index IDX_WA_TASK_GROUP_ID -- renamed
  on wf_attachment(task_group_id)^


insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$SimpleDoc.browse].cardsTable','Основная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="docKind" visible="true"/>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="number" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.locName" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="department" visible="false"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="docCategory" visible="false"/>
<columns id="hasAttributes" visible="false"/>
<columns id="important" visible="true"/>
<columns id="theme" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
')^

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$SimpleDoc.browse].cardsTable','Расширенная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="docKind" visible="true"/>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="number" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.locName" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="department" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="hasAttributes" visible="true"/>
<columns id="important" visible="true"/>
<columns id="theme" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
')^


insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[tm$Task.browse].cardsTable','Основная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
	<columns id="initiator.name" visible="true"/>
	<columns id="hasAttachments" width="30" visible="true"/>
	<columns id="important" width="30" visible="true"/>
	<columns id="taskName" width="400" visible="true"/>
	<columns id="fullDescr" width="400" visible="true"/>
	<columns id="createDate" width="100" visible="true"/>
	<columns id="num" visible="true"/>
	<columns id="currentActorsString" visible="true"/>
	<columns id="percentCompletion" visible="false"/>
	<columns id="locState" visible="true"/>
	<columns id="finishDateTimePlan" visible="true"/>
	<columns id="finishDateFact" visible="false"/>
	<columns id="priority" visible="true"/>
	<columns id="executorsString" visible="true"/>
	<columns id="taskType" visible="false"/>
	<columns id="parentCard" visible="false"/>
	<columns id="labourHour" visible="false"/>
	<columns id="hasAttributes" visible="false"/>
	<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
')^


insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[tm$Task.browse].cardsTable','Расширенная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
	<columns id="initiator.name" visible="true"/>
	<columns id="hasAttachments" width="30" visible="true"/>
	<columns id="important" width="30" visible="true"/>
	<columns id="taskName" width="400" visible="true"/>
	<columns id="fullDescr" width="400" visible="true"/>
	<columns id="createDate" width="100" visible="true"/>
	<columns id="num" visible="true"/>
	<columns id="currentActorsString" visible="true"/>
	<columns id="percentCompletion" visible="true"/>
	<columns id="locState" visible="true"/>
	<columns id="finishDateTimePlan" visible="true"/>
	<columns id="finishDateFact" visible="true"/>
	<columns id="priority" visible="true"/>
	<columns id="executorsString" visible="true"/>
	<columns id="taskType" visible="true"/>
	<columns id="parentCard" visible="true"/>
	<columns id="labourHour" visible="true"/>
	<columns id="hasAttributes" visible="true"/>
	<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
')^

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$Contract.browse].cardsTable','Основная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" width="30" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="contractor" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.locName" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="amount" visible="true"/>
<columns id="currency" visible="true"/>
<columns id="active" visible="false"/>
<columns id="organization" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="department" visible="false"/>
<columns id="liabilityStart" visible="true"/>
<columns id="liabilityEnd" visible="true"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="hasAttributes" visible="false"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
')^

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$Contract.browse].cardsTable','Расширенная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" width="30" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="contractor" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.locName" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="amount" visible="true"/>
<columns id="currency" visible="true"/>
<columns id="active" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="department" visible="true"/>
<columns id="liabilityStart" visible="true"/>
<columns id="liabilityEnd" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="hasAttributes" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
')^

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocIncome.browse].cardsTable','Основная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="proc.locName" visible="false"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="false"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="outcomeNo" visible="true"/>
<columns id="outcomeDate" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="docOfficeData.responsePlanDate" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="important" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
')^

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocIncome.browse].cardsTable','Расширенная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="proc.locName" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="true"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="outcomeNo" visible="true"/>
<columns id="outcomeDate" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="docOfficeData.responsePlanDate" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="important" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
')^


insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocInternal.browse].cardsTable','Основная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="proc.locName" visible="false"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="false"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="important" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
')^

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocInternal.browse].cardsTable','Расширенная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="proc.locName" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="true"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="important" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
')^

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocOutcome.browse].cardsTable','Основная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="proc.locName" visible="false"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="false"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="important" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
')^

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocOutcome.browse].cardsTable','Расширенная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="proc.locName" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="true"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="important" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
')^

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$MeetingDoc.browse].cardsTable','Основная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" visible="true"/>
<columns id="number" visible="true"/>
<columns id="createTs" visible="false"/>
<columns id="theme" visible="true"/>
<columns id="target" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="department" visible="true"/>
<columns id="parentCard" visible="true"/>
<columns id="docCategory" visible="false"/>
<columns id="dateTime" visible="true"/>
<columns id="duration" visible="false"/>
<columns id="place" visible="false"/>
<columns id="chairman" visible="true"/>
<columns id="initiator" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="secretary" visible="true"/>
<columns id="locState" visible="true"/>
</columns>
<groupProperties/>
</presentation>
')^

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$MeetingDoc.browse].cardsTable','Расширенная',0,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" visible="true"/>
<columns id="number" visible="true"/>
<columns id="createTs" visible="true"/>
<columns id="theme" visible="true"/>
<columns id="target" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="department" visible="true"/>
<columns id="parentCard" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="dateTime" visible="true"/>
<columns id="duration" visible="true"/>
<columns id="place" visible="true"/>
<columns id="chairman" visible="true"/>
<columns id="initiator" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="secretary" visible="true"/>
<columns id="locState" visible="true"/>
</columns>
<groupProperties/>
</presentation>
')^


insert all
    into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role)
    values ('505d37f4fdfc11e388a0b7bba68b44d2', CURRENT_TIMESTAMP, 'system', 1, 'Archivist', 'Архивариус', 'Архивация дел', 0, 0)

    into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role)
    values ('56e2fce4fdfc11e3a0b9737e257ecae7', CURRENT_TIMESTAMP, 'system', 1, 'Archive access', 'Доступ к архиву', 'Доступ к карточкам в делах архива', 0 , 0)
select * from dual^

INSERT ALL
    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '56e2fce4fdfc11e3a0b9737e257ecae7') -- archive access

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '56e2fce4fdfc11e3a0b9737e257ecae7')  -- archive access

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedAccountDoc.browse', 1, '56e2fce4fdfc11e3a0b9737e257ecae7')  -- archive access

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '505d37f4fdfc11e388a0b7bba68b44d2') -- archivist

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '505d37f4fdfc11e388a0b7bba68b44d2') -- archivist

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedAccountDoc.browse', 1, '505d37f4fdfc11e388a0b7bba68b44d2') -- archivist

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivistWorkplace', 1, '505d37f4fdfc11e388a0b7bba68b44d2') -- archivist

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 0, '96fa7fe9397d4bacb14aeec2d94de68c') -- simple user

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedContract.browse', 0, '96fa7fe9397d4bacb14aeec2d94de68c') -- simple user

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedAccountDoc.browse', 0, '96fa7fe9397d4bacb14aeec2d94de68c') -- simple user

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivistWorkplace', 0, '96fa7fe9397d4bacb14aeec2d94de68c') -- simple user

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivistWorkplace', 0, '0c018061b26f4de2a5bedff348347f93')      -- admin

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '0c018061b26f4de2a5bedff348347f93') -- admin

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '0c018061b26f4de2a5bedff348347f93') -- admin

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedAccountDoc.browse', 1, '0c018061b26f4de2a5bedff348347f93') -- admin
SELECT * FROM dual^


insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id) values
(newid(), CURRENT_TIMESTAMP, 'system', 1, 20, 'df$OfficeFile:update', 1, '505d37f4fdfc11e388a0b7bba68b44d2')^ -- archivist

INSERT ALL
    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '7091f5efa77a450a834a39406885676e')

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '7091f5efa77a450a834a39406885676e')

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivedAccountDoc.browse', 1, '7091f5efa77a450a834a39406885676e')

    INTO sec_permission(id, create_ts, created_by, version, permission_type, target, value_, role_id)
    VALUES (newid(), CURRENT_TIMESTAMP, 'system', 1, 10, 'ts$ArchivistWorkplace', 1, '7091f5efa77a450a834a39406885676e') -- secretary
SELECT * FROM dual^

alter table WF_PROC add HIDDEN_DECISIONS_BPMN varchar2(1500 char)^
alter table WF_PROC add PARTICIPANTS_CHANGE_ENABLED char(1)^
alter table WF_PROC add AVAILABLE_FOR_MOBILE_CLIENT char(1)^
alter table WF_PROC add FORBID_PROCESS_RESTART char(1)^
alter table WF_PROC add FORBID_RESTART_STATES varchar2(1500 char)^
alter table WF_PROC add LOC_NAME varchar2(2000 char)^
alter table WF_PROC add AVAILABLE_EDE char(1)^
alter table WF_PROC add AVAILABLE_EDE_SESSION_TYPES varchar2(500 char)^

select create_or_update_sec_permissi('SimpleUser', 'ts$OfficeFileTransferLog:create', 20, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'ts$OfficeFileTransferLog:update', 20, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'ts$OfficeFileTransferLog:delete', 20, 0) from dual^

select create_or_update_sec_permissi('Archivist', 'ts$OfficeFileTransferLog:create', 20, 1) from dual^
select create_or_update_sec_permissi('Archivist', 'ts$OfficeFileTransferLog:update', 20, 1) from dual^
select create_or_update_sec_permissi('Archivist', 'ts$OfficeFileTransferLog:delete', 20, 1) from dual^

------------------------------------------------------------------------
alter table WF_PROC drop column STATES^
alter table WF_PROC add STATES clob^

alter table wf_card_comment add state varchar2(255 char)^
alter table wf_card_comment add ATTACHMENT_NAME varchar2(500 char)^
alter table wf_card_comment add CARD_ATTACHMENT_ID varchar2(32 char)^
alter table wf_card_comment add COMMENT_TYPE varchar2(1 char)^
alter table wf_card_comment add ASSIGNMENT_ID varchar2(32 char)^
alter table wf_card_comment add OUTCOME varchar2(255 char)^

alter table wf_card_comment
add constraint FK_TCC_WF_CARD_ATTACHMENT foreign key (CARD_ATTACHMENT_ID) references WF_ATTACHMENT(ID)^ -- renamed

alter table wf_card_comment
add constraint FK_TCC_WF_ASSIGNMENT foreign key (ASSIGNMENT_ID) references WF_ASSIGNMENT(ID)^ -- renamed

ALTER TABLE WF_CARD_COMMENT_USER
ADD (IS_READ char(1),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    ID varchar2(32 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char))^

-- exist in workflow already:
--alter table WF_CARD_COMMENT_USER add constraint FK_WCCU_TO_WF_CARD_COMMENT foreign key (CARD_COMMENT_ID) references WF_CARD_COMMENT(ID)^
--alter table WF_CARD_COMMENT_USER add constraint FK_WCCU_TO_SEC_USER foreign key (USER_ID) references SEC_USER(ID)^

update WF_CARD_COMMENT_USER set id=NEWID(), create_ts=CURRENT_TIMESTAMP, update_ts=CURRENT_TIMESTAMP, version=1, CREATED_BY='admin', UPDATED_BY='admin', IS_READ=1^

insert into SEC_USER_SETTING(ID, CREATE_TS, CREATED_BY, USER_ID, NAME, value_)
		    values (newid(), current_timestamp, 'admin', (select u.id from sec_user u where u.login = 'admin'), 'notifyUserOnceADay', 'true')^
insert into SEC_USER_SETTING(ID, CREATE_TS, CREATED_BY, USER_ID, NAME, value_)
            values (newid(), current_timestamp, 'admin', (select u.id from sec_user u where u.login = 'admin'), 'notifyOverdueCardsByScheduler', '17:50')^

alter table DF_ORGANIZATION add OGRN varchar2(13 char)^

alter table SYS_ENTITY_STATISTICS add SEARCH_PICKER_FIELD_THRESHOLD integer^

alter table WF_PROC_ROLE add NOTIFY_WITHOUT_ASSIGNMENT char(1)^
alter table WF_PROC_ROLE add LOC_NAME varchar2(2000 char)^
alter table WF_PROC_ROLE add EDE_SESSION_INIT_AUTHORITIES char(1)^

alter table WF_CARD_PROC add RESTART_FORBIDDEN char(1)^

DECLARE
  FOUND_INDEXES_COUNT INTEGER;
BEGIN
    SELECT COUNT(*) INTO FOUND_INDEXES_COUNT
    FROM USER_INDEXES
    WHERE INDEX_NAME = 'idx_wci_activity_execution_id'; -- renamed index

    IF FOUND_INDEXES_COUNT = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_wci_activity_execution_id ON WF_CARD_INFO (JBPM_EXECUTION_ID, ACTIVITY)';
    END IF;
END;^

alter table WF_ASSIGNMENT add BY_MAIL_ACTIVITY char(1)^
alter table WF_ASSIGNMENT add SUBSTITUTED_CREATOR_ID varchar2(32 char)^

alter table WF_ASSIGNMENT add constraint FK_WF_ASSIGN_SUB_CREATOR foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^

create index IDX_FK_WF_ASSIGN_SUB_CREATOR on WF_ASSIGNMENT(SUBSTITUTED_CREATOR_ID)^

alter table WF_PROC add AVAILABLE_MAIL_ACTIVITY char(1)^

create table TS_MAIL_ACTIVITY_INFO (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION number(10),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),

    PROC_ID varchar2(32 char),
    ACTIVITY_NAME varchar(255),
    MAIL_ENABLED char(1),

    primary key (ID),
    foreign key (PROC_ID) references WF_PROC (ID)
)^

create index IDX_TS_MAIL_ACT_INFO_PROC_ID on TS_MAIL_ACTIVITY_INFO (PROC_ID)^

alter table sys_category modify ENTITY_TYPE  VARCHAR2(50)^

create table TS_MANUAL(
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),

    NAME_ varchar2(500 char),
    FILE_ID varchar2(32 char),
    CREATOR_ID varchar2(32 char),
    COMMENT_ clob,
    CREATE_DATE timestamp,

    primary key (ID)

)^

alter table TS_MANUAL add constraint FK_TS_MANUAL_FILE_ID foreign key (FILE_ID) references SYS_FILE(ID)^
alter table TS_MANUAL add constraint FK_TS_MANUAL_CREATOR_ID foreign key (CREATOR_ID) references SEC_USER(ID)^

create index IDX_TS_MANUAL_FILE_ID on TS_MANUAL (FILE_ID)^
create index IDX_TS_MANUAL_CREATOR_ID on TS_MANUAL (CREATOR_ID)^

--begin DF_ACCOUNT_DOC
create table DF_ACCOUNT_DOC (
    CARD_ID varchar2(32 char),
    primary key (CARD_ID)
)^

alter table DF_ACCOUNT_DOC add constraint FK_DF_ACCOUNT_DOC_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^

--roles permissions
select create_or_update_sec_permissi('SimpleUser', 'df$AccountDoc:create', 20, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'df$AccountDoc:delete', 20, 0) from dual^
select create_or_update_sec_permissi('doc_initiator', 'df$AccountDoc:create', 20, 1) from dual^
select create_or_update_sec_permissi('doc_initiator', 'df$AccountDoc:update', 20, 1) from dual^
select create_or_update_sec_permissi('doc_initiator', 'df$AccountDoc:delete', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$AccountDoc:create', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$AccountDoc:update', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$AccountDoc:delete', 20, 1) from dual^

select create_or_update_sec_permissi('SimpleUser', 'createOutgoingFormalizedDocumentWindow', 10, 0) from dual^
select create_or_update_sec_permissi('Administrators', 'createOutgoingFormalizedDocumentWindow', 10, 1) from dual^

--end DF_ACCOUNT_DOC

create table TS_ACCEPTANCE_DATA(
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer default 1 not null,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),

    CARD_ID varchar2(32 char),
    RECEIVING_DATE timestamp,
    ACCEPTANCE_RESULT varchar2(50 char),
    DISAGREEMENTS varchar2(1000 char),
    ACCEPTED_BY varchar2(255 char),
    LAST_NAME varchar2(255 char),
    NAME_ varchar2(255 char),
    PATRONYMIC varchar2(255 char),
    POSITION_ varchar2(255 char),
    ORGANIZATION varchar2(255 char),
    SOURCE_OF_AUTHORITY varchar2(1000 char),
    ORG_SOURCE_OF_AUTHORITY varchar2(1000 char),
    OTHER_DATA varchar2(1000 char),
    primary key (ID)
)^
alter table TS_ACCEPTANCE_DATA add constraint FK_TS_ACCEPTANCE_DATA_CARD_ID foreign key (CARD_ID) references WF_CARD(ID)^
create index IDX_TS_ACCEPTANCE_DATA_CARD_ID on TS_ACCEPTANCE_DATA (CARD_ID)^

------------------------------------------------------------------------------------------------------------

create table TS_SEARCH_FOLDER_TS_ROLE (
    FOLDER_ID varchar2(32 char),
    ROLE_ID varchar2(32 char)
)^

alter table TS_SEARCH_FOLDER_TS_ROLE add constraint FK_SEARCH_FOLDER_ROLE_FOLDER foreign key (FOLDER_ID) references SEC_SEARCH_FOLDER(FOLDER_ID)^
alter table TS_SEARCH_FOLDER_TS_ROLE add constraint FK_SEARCH_FOLDER_ROLE_ROLE foreign key (ROLE_ID) references SEC_ROLE(ID)^

create index IDX_TS_SEARCH_FOLDER_TS_ROLE on TS_SEARCH_FOLDER_TS_ROLE (FOLDER_ID)^

------------------------------------------------------------------------------------------------------------

update SEC_USER set DTYPE = '10'^
update WF_PROC_ROLE set DTYPE = '10'^
update WF_CARD_ROLE set DTYPE = '10'^
update SEC_GROUP set DTYPE = '10'^
update SYS_ENTITY_STATISTICS set DTYPE = '10'^
update WF_CARD_COMMENT set DTYPE = '10'^
update REPORT_REPORT set DTYPE = '10'^
update WF_USER_GROUP set DTYPE = '10'^
update WF_PROC set DTYPE = '10'^
update SEC_USER_SUBSTITUTION set DTYPE = '10'^
update WF_DEFAULT_PROC_ACTOR set DTYPE = '10'^
update SEC_ROLE set DTYPE = '10'^
update WF_ASSIGNMENT set DTYPE = '10'^
update WF_CARD_PROC set DTYPE = '10'^

------------------------------------------ Appointments -----------------------------------------------------
-- begin AM_CONDITION
create table AM_CONDITION (
    ID varchar2(32),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION number(10),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    OPERATION varchar2(50),
    PROPERTY varchar2(255 char),
    APPOINTMENT_TYPE_ID varchar2(32),
    SORT_ORDER number(10),
    --
    primary key (ID)
)^
-- end AM_CONDITION

-- begin AM_CONDITION_VALUE
create table AM_CONDITION_VALUE (
    ID varchar2(32),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION number(10),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    VAL clob,
    ENTITY_INSTANCE_NAME clob,
    APPOINTMENT_ID varchar2(32),
    CONDITION_ID varchar2(32),
    --
    primary key (ID)
)^
-- end AM_CONDITION_VALUE

-- begin AM_APPOINTMENT
create table AM_APPOINTMENT (
    ID varchar2(32),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION number(10),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    APPOINTMENT_TYPE_ID varchar2(32),
    ORDER_VALUE number(10),
    CONDITION_SCRIPT_ID varchar2(32),
    PARTICIPANT_SCRIPT_ID varchar2(32),
    --
    primary key (ID)
)^
-- end AM_APPOINTMENT

-- begin AM_APPOINTMENT_SCRIPT
create table AM_APPOINTMENT_SCRIPT (
    ID varchar2(32),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION number(10),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    SCRIPT_NAME varchar2(255 char),
    SCRIPT_TEXT clob,
    --
    primary key (ID)
)^
-- end AM_APPOINTMENT_SCRIPT

-- begin AM_APPOINTMENT_LOG
create table AM_APPOINTMENT_LOG (
    ID varchar2(32),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    --
    LOG clob,
    CARD_ID varchar2(32),
    --
    primary key (ID)
)^
-- end AM_APPOINTMENT_LOG

-- begin AM_APPOINTMENT_USER
create table AM_APPOINTMENT_USER (
    ID varchar2(32),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION number(10),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    USER_ID varchar2(32),
    SORT_ORDER number(10),
    APPOINTMENT_ID varchar2(32),
    DURATION number(10),
    TIME_UNIT varchar2(50),
    --
    primary key (ID)
)^
-- end AM_APPOINTMENT_USER

-- begin AM_APPOINTMENT_TYPE
create table AM_APPOINTMENT_TYPE (
    ID varchar2(32),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION number(10),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    NAME varchar2(255 char),
    ENTITY_NAME varchar2(255 char),
    COMMENT_ varchar2(500 char),
    PROC_ROLE_ID varchar2(32),
    --
    primary key (ID)
)^
-- end AM_APPOINTMENT_TYPE

-- begin AM_APPOINTMENT_CARD_ROLE_INFO
create table AM_APPOINTMENT_CARD_ROLE_INFO (
    ID varchar2(32),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    --
    CARD_ROLE_ID varchar2(32) not null,
    --
    primary key (ID)
)^
-- end AM_APPOINTMENT_CARD_ROLE_INFO

-- begin AM_CONDITION
alter table AM_CONDITION add constraint FK_AM_CONDI_APPOITYPEID foreign key (APPOINTMENT_TYPE_ID) references AM_APPOINTMENT_TYPE(ID)^
create index IDX_AM_CONDI_APPOITYPEID on AM_CONDITION (APPOINTMENT_TYPE_ID)^
-- end AM_CONDITION

-- begin AM_CONDITION_VALUE
alter table AM_CONDITION_VALUE add constraint FK_AM_CONDIVALUE_APPOIID foreign key (APPOINTMENT_ID) references AM_APPOINTMENT(ID)^
alter table AM_CONDITION_VALUE add constraint FK_AM_CONDIVALUE_CONDITION_ID foreign key (CONDITION_ID) references AM_CONDITION(ID)^
create index IDX_AM_CONDIVALUE_APPOIID on AM_CONDITION_VALUE (APPOINTMENT_ID)^
create index IDX_AM_CONDIVALUE_CONDIID on AM_CONDITION_VALUE (CONDITION_ID)^
-- end AM_CONDITION_VALUE

-- begin AM_APPOINTMENT
alter table AM_APPOINTMENT add constraint FK_AM_APPOI_APPOITYPEID foreign key (APPOINTMENT_TYPE_ID) references AM_APPOINTMENT_TYPE(ID)^
alter table AM_APPOINTMENT add constraint FK_AM_APPOI_CONDISCRIPID foreign key (CONDITION_SCRIPT_ID) references AM_APPOINTMENT_SCRIPT(ID)^
alter table AM_APPOINTMENT add constraint FK_AM_APPOI_PARTISCRIPID foreign key (PARTICIPANT_SCRIPT_ID) references AM_APPOINTMENT_SCRIPT(ID)^
create index IDX_AM_APPOI_PARTISCRIPID on AM_APPOINTMENT (PARTICIPANT_SCRIPT_ID)^
create index IDX_AM_APPOI_CONDISCRIPID on AM_APPOINTMENT (CONDITION_SCRIPT_ID)^
create index IDX_AM_APPOI_APPOITYPEID on AM_APPOINTMENT (APPOINTMENT_TYPE_ID)^
-- end AM_APPOINTMENT

-- begin AM_APPOINTMENT_USER
alter table AM_APPOINTMENT_USER add constraint FK_AM_APPOIUSER_USER_ID foreign key (USER_ID) references SEC_USER(ID)^
alter table AM_APPOINTMENT_USER add constraint FK_AM_APPOIUSER_APPOIID foreign key (APPOINTMENT_ID) references AM_APPOINTMENT(ID)^
create index IDX_AM_APPOIUSER_USER_ID on AM_APPOINTMENT_USER (USER_ID)^
create index IDX_AM_APPOIUSER_APPOIID on AM_APPOINTMENT_USER (APPOINTMENT_ID)^
-- end AM_APPOINTMENT_USER

-- begin AM_APPOINTMENT_TYPE
alter table AM_APPOINTMENT_TYPE add constraint FK_AM_APPOTYPE_PROC_ROLE_ID foreign key (PROC_ROLE_ID) references WF_PROC_ROLE(ID)^
create index IDX_AM_APPOTYPE_PROC_ROLE_ID on AM_APPOINTMENT_TYPE (PROC_ROLE_ID)^
-- end AM_APPOINTMENT_TYPE

-- begin AM_APPOINTMENT_CARD_ROLE_INFO
alter table AM_APPOINTMENT_CARD_ROLE_INFO add constraint FK_CARD_ROLE_INFO_CARD_ROLE_ID foreign key (CARD_ROLE_ID) references WF_CARD_ROLE(ID)^
create index IDX_CARD_ROLE_INFO_CARD_ROLE on AM_APPOINTMENT_CARD_ROLE_INFO (CARD_ROLE_ID)^
-- end AM_APPOINTMENT_CARD_ROLE_INFO

select create_or_update_sec_permissi('SimpleUser', 'appointmentSettingsWindow', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'am$AppointmentType.browse', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'am$Appointment.browse', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'am$AppointmentScript.browse', 10, 0) from dual^
select create_or_update_sec_permissi('Administrators', 'appointmentSettingsWindow', 10, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'am$AppointmentType.browse', 10, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'am$Appointment.browse', 10, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'am$AppointmentScript.browse', 10, 1) from dual^

create unique index IDX_APPOINT_TYPE_ENTITY_PR on AM_APPOINTMENT_TYPE(PROC_ROLE_ID, ENTITY_NAME, DELETE_TS)^
-------------------------------------------------------------------------------------------------------------
create table TS_VOICE_COMMAND_SYN (
      ID varchar2(32),
      CREATE_TS timestamp,
      CREATED_BY varchar2(50 char),
      UPDATE_TS timestamp,
      UPDATED_BY varchar2(50 char),
      DELETE_TS timestamp,
      DELETED_BY varchar2(50 char),
      VERSION number(10),
      ---
      COMMAND varchar2(255 char),
      SYNONYM_ varchar2(255 char),
      GLOBAL char(1),
      USER_ID varchar2(32),
      primary key (ID)
)^

alter table TS_VOICE_COMMAND_SYN add constraint TS_VOICE_COMMAND_SYN_USER_ID foreign key (USER_ID) references SEC_USER(ID)^
create index TS_VOICE_COMMAND_SYN_GLOBAL on TS_VOICE_COMMAND_SYN(GLOBAL)^
create index TS_VOICE_COMMAND_SYN_USER_ID on TS_VOICE_COMMAND_SYN(USER_ID)^

create table TS_COMPLEX_VOICE_COMMAND (
      id varchar2(32),
      create_ts timestamp,
      created_by varchar2(50 char),
      update_ts timestamp,
      updated_by varchar2(50 char),
      delete_ts timestamp,
      deleted_by varchar2(50 char),
      VERSION number(10),
      ---
      COMMAND varchar2(255 char),
      COMMAND_TEMPLATE clob,
      primary key (ID)
)^
select create_or_update_sec_permissi('SimpleUser', 'ts$ComplexVoiceCommand.browse', 10, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'ts$VoiceCommandSynonym.browse', 10, 0) from dual^

select create_or_update_sec_permissi('SimpleUser', 'ts$ComplexVoiceCommand:create', 20, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'ts$ComplexVoiceCommand:update', 20, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'ts$ComplexVoiceCommand:delete', 20, 0) from dual^

--begin DF_PACKAGE_DOC
create table DF_PACKAGE_DOC (
    CARD_ID varchar2(32 char),
    LOCKED char(1) default 0 not null,
    primary key (CARD_ID)
)^

alter table DF_PACKAGE_DOC add constraint FK_DF_PACKAGE_DOC_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^

--roles permissions
select create_or_update_sec_permissi('SimpleUser', 'df$PackageDoc:create', 20, 0) from dual^
select create_or_update_sec_permissi('SimpleUser', 'df$PackageDoc:delete', 20, 0) from dual^
select create_or_update_sec_permissi('doc_initiator', 'df$PackageDoc:create', 20, 1) from dual^
select create_or_update_sec_permissi('doc_initiator', 'df$PackageDoc:update', 20, 1) from dual^
select create_or_update_sec_permissi('doc_initiator', 'df$PackageDoc:delete', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$PackageDoc:create', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$PackageDoc:update', 20, 1) from dual^
select create_or_update_sec_permissi('Administrators', 'df$PackageDoc:delete', 20, 1) from dual^

--end DF_PACKAGE_DOC

alter table DF_DOC add PACKAGE_DOC_ID varchar2(32 char)^
alter table DF_DOC add constraint FK_DF_DOC_PACKAGE_DOC foreign key (PACKAGE_DOC_ID) references DF_PACKAGE_DOC(CARD_ID)^

create index IDX_DF_DOC_PACKAGE_DOC_ID on DF_DOC (PACKAGE_DOC_ID)^

--

alter table DF_DOC add LGI_SIGN_REQUIRED char(1) default 0^
update DF_DOC set LGI_SIGN_REQUIRED = 0^

alter table DF_DOC add LGI_SIGNING_IN_STATUS integer^

alter table DF_DOC add LGI_SIGNING_OUT_STATUS integer^

--

alter table DF_ACCOUNT_DOC add AMOUNT_INC numeric(19,2)^

alter table DF_ACCOUNT_DOC add AMOUNT_DEC numeric(19,2)^

alter table DF_ACCOUNT_DOC add VAT_AMOUNT_INC numeric(19,2)^

alter table DF_ACCOUNT_DOC add VAT_AMOUNT_DEC numeric(19,2)^

--

alter table DF_ACCOUNT_DOC add ORIGIN_DOC_ID varchar2(32 char)^
alter table DF_ACCOUNT_DOC add constraint FK_ACCOUNT_DOC_ORIGIN_DOC foreign key (ORIGIN_DOC_ID) references DF_ACCOUNT_DOC(CARD_ID)^

alter table DF_ACCOUNT_DOC add ORIGIN_DOC_NO varchar2(50 char)^

alter table DF_ACCOUNT_DOC add ORIGIN_DOC_DATE date^

---

alter table DF_ACCOUNT_DOC add ORIGIN_REV_DOC_ID varchar2(32 char)^
alter table DF_ACCOUNT_DOC add constraint FK_ACCOUNT_DOC_ORIGIN_REV_DOC foreign key (ORIGIN_REV_DOC_ID) references DF_ACCOUNT_DOC(CARD_ID)^

alter table DF_ACCOUNT_DOC add ORIGIN_REV_DOC_NO varchar2(50 char)^

alter table DF_ACCOUNT_DOC add ORIGIN_REV_DOC_DATE date^

---

alter table DF_ACCOUNT_DOC add ORIGIN_COR_DOC_ID varchar2(32 char)^
alter table DF_ACCOUNT_DOC add constraint FK_ACCOUNT_DOC_ORIGIN_COR_DOC foreign key (ORIGIN_COR_DOC_ID) references DF_ACCOUNT_DOC(CARD_ID)^

alter table DF_ACCOUNT_DOC add ORIGIN_COR_DOC_NO varchar2(50 char)^

alter table DF_ACCOUNT_DOC add ORIGIN_COR_DOC_DATE date^

---

alter table WF_CARD add IS_EDM_INBOUND char(1) default 0^
update WF_CARD set IS_EDM_INBOUND = 0^

---

create index IDX_DF_ACCOUNT_DOC_ORIGDOC_ID on DF_ACCOUNT_DOC (ORIGIN_DOC_ID)^

create index IDX_DF_ACCOUNT_DOC_ORIGRDOC_ID on DF_ACCOUNT_DOC (ORIGIN_REV_DOC_ID)^

create index IDX_DF_ACCOUNT_DOC_ORIGCDOC_ID on DF_ACCOUNT_DOC (ORIGIN_COR_DOC_ID)^

---

alter table TS_EDM_SENDING add EDM_SENDING_TYPE integer^

update TS_EDM_SENDING set EDM_SENDING_TYPE = 10^

alter table TS_EDM_SENDING modify (EDM_SENDING_TYPE not null)^

---

alter table TS_EDM_SENDING add PARENT_EDM_SENDING_ID varchar2(32 char)^
alter table TS_EDM_SENDING add constraint FK_EDM_SENDING_PARENT_SENDING foreign key (PARENT_EDM_SENDING_ID) references TS_EDM_SENDING(ID)^

---

create index IDX_EDM_SENDING_PARENT_SEND_ID on TS_EDM_SENDING (PARENT_EDM_SENDING_ID)^

---

alter table TS_EDM_SENDING add LOCKED char(1) default 0^
update TS_EDM_SENDING set LOCKED = 0^

alter table TS_EDM_SENDING modify (LOCKED not null)^

---

CREATE TABLE TS_EDM_DOCUMENT_EVENT (
    ID varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer,
    ---
	EDM_EVENT_ID varchar2(255 char),
    EDM_MESSAGE_ID varchar2(255 char),
    EDM_ENTITY_ID varchar2(255 char),
    EDM_DOCUMENT_EVENT_TYPE integer,
    BOX_ID varchar2(255 char),
    EVENT_DATE timestamp,
    primary key(ID)
)^

create index IDX_EDM_DOC_EVENT_CREATE_TS on TS_EDM_DOCUMENT_EVENT (CREATE_TS)^
create index IDX_EDM_DOC_EVENT_MSG_ENT on TS_EDM_DOCUMENT_EVENT(EDM_MESSAGE_ID, EDM_ENTITY_ID)^

---

alter table TS_EDM_SENDING add LAST_DOC_EVENT_DATE timestamp^

---

alter table TS_EDM_SENDING add EDM_DOC_FORMAT varchar2(255 char)^

alter table TS_EDM_SENDING add EDM_ATTACHMENT_ID varchar2(32 char)^

create index IDX_TS_EDM_SENDING_EDM_ATT_ID on TS_EDM_SENDING(EDM_ATTACHMENT_ID)^

alter table TS_EDM_SENDING add constraint FK_EDM_SENDING_EDM_ATTACHMENT foreign key (EDM_ATTACHMENT_ID) references WF_ATTACHMENT(ID)^

------------------------------------------------------------------------------------------------------------

CREATE TABLE TS_EDE_FILE_REVISION (
    ID varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer,
    ---
    FILE_ID varchar2(50 char),
    IS_INITIAL char(1) default 0,
    primary key(ID)
)^

alter table TS_EDE_FILE_REVISION add constraint FK_EDE_FILE_REVISION_FILE_ID foreign key (FILE_ID) references SYS_FILE(ID)^

--

CREATE TABLE TS_EDE_SESSION (
    ID varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer,
    ---
    INITIATOR_ID varchar2(50 char),
    SUBSTITUTED_INITIATOR_ID varchar2(50 char),
    ATTACHMENT_ID varchar2(50 char),
    EDE_FILE_REV_ID varchar2(50 char),
    EDE_SESSION_TYPE integer,
    EDE_SESSION_STATE integer,
    primary key(ID)
)^

alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_INITIATOR foreign key (INITIATOR_ID) references SEC_USER(ID)^
alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_SUBST_INITIATOR foreign key (SUBSTITUTED_INITIATOR_ID) references SEC_USER(ID)^
alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_SUBST_ATTACH foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID)^
alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_EDE_FILE_REV_ID foreign key (EDE_FILE_REV_ID) references TS_EDE_FILE_REVISION(ID)^

create index IDX_EDE_SESSION_ATTACHMENT on TS_EDE_SESSION(ATTACHMENT_ID)^

--

CREATE TABLE TS_EDE_CONNECTION (
    ID varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer,
    ---
    SESSION_ID varchar2(50 char),
    USER_ID varchar2(50 char),
    SUBSTITUTED_USER_ID varchar2(50 char),
    USER_SESSION_ID varchar2(50 char),
    CONNECTION_STATE integer,
    primary key(ID)
)^

alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_SESSION foreign key (SESSION_ID) references TS_EDE_SESSION(ID)^
alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_USER foreign key (USER_ID) references SEC_USER(ID)^
alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_SUBST_USER foreign key (SUBSTITUTED_USER_ID) references SEC_USER(ID)^

create index IDX_EDE_CONNECTION_SESSION on TS_EDE_CONNECTION(SESSION_ID)^
