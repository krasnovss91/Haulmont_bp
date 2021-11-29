declare
  count_tables integer;
begin
  select count(*) into count_tables
    from USER_TABLES
    where TABLE_NAME = 'AM_CONDITION';

  if count_tables = 0 then
    execute immediate 'create table AM_CONDITION (
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
                       )';

    execute immediate 'create table AM_CONDITION_VALUE (
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
                       )';

    execute immediate 'create table AM_APPOINTMENT (
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
                       )';

    execute immediate 'create table AM_APPOINTMENT_SCRIPT (
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
                       )';

    execute immediate 'create table AM_APPOINTMENT_LOG (
                           ID varchar2(32),
                           CREATE_TS timestamp,
                           CREATED_BY varchar2(50 char),
                           --
                           LOG clob,
                           CARD_ID varchar2(32),
                           --
                           primary key (ID)
                       )';

    execute immediate 'create table AM_APPOINTMENT_USER (
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
                       )';

    execute immediate 'create table AM_APPOINTMENT_TYPE (
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
                       )';

    execute immediate 'create table AM_APPOINTMENT_CARD_ROLE_INFO (
                           ID varchar2(32),
                           CREATE_TS timestamp,
                           CREATED_BY varchar2(50 char),
                           --
                           CARD_ROLE_ID varchar2(32) not null,
                           --
                           primary key (ID)
                       )';

    execute immediate 'alter table AM_CONDITION add constraint FK_AM_CONDI_APPOITYPEID foreign key (APPOINTMENT_TYPE_ID) references AM_APPOINTMENT_TYPE(ID)';
    execute immediate 'create index IDX_AM_CONDI_APPOITYPEID on AM_CONDITION (APPOINTMENT_TYPE_ID)';

    execute immediate 'alter table AM_CONDITION_VALUE add constraint FK_AM_CONDIVALUE_APPOIID foreign key (APPOINTMENT_ID) references AM_APPOINTMENT(ID)';
    execute immediate 'alter table AM_CONDITION_VALUE add constraint FK_AM_CONDIVALUE_CONDITION_ID foreign key (CONDITION_ID) references AM_CONDITION(ID)';
    execute immediate 'create index IDX_AM_CONDIVALUE_APPOIID on AM_CONDITION_VALUE (APPOINTMENT_ID)';
    execute immediate 'create index IDX_AM_CONDIVALUE_CONDIID on AM_CONDITION_VALUE (CONDITION_ID)';

    execute immediate 'alter table AM_APPOINTMENT add constraint FK_AM_APPOI_APPOITYPEID foreign key (APPOINTMENT_TYPE_ID) references AM_APPOINTMENT_TYPE(ID)';
    execute immediate 'alter table AM_APPOINTMENT add constraint FK_AM_APPOI_CONDISCRIPID foreign key (CONDITION_SCRIPT_ID) references AM_APPOINTMENT_SCRIPT(ID)';
    execute immediate 'alter table AM_APPOINTMENT add constraint FK_AM_APPOI_PARTISCRIPID foreign key (PARTICIPANT_SCRIPT_ID) references AM_APPOINTMENT_SCRIPT(ID)';
    execute immediate 'create index IDX_AM_APPOI_PARTISCRIPID on AM_APPOINTMENT (PARTICIPANT_SCRIPT_ID)';
    execute immediate 'create index IDX_AM_APPOI_CONDISCRIPID on AM_APPOINTMENT (CONDITION_SCRIPT_ID)';
    execute immediate 'create index IDX_AM_APPOI_APPOITYPEID on AM_APPOINTMENT (APPOINTMENT_TYPE_ID)';

    execute immediate 'alter table AM_APPOINTMENT_USER add constraint FK_AM_APPOIUSER_USER_ID foreign key (USER_ID) references SEC_USER(ID)';
    execute immediate 'alter table AM_APPOINTMENT_USER add constraint FK_AM_APPOIUSER_APPOIID foreign key (APPOINTMENT_ID) references AM_APPOINTMENT(ID)';
    execute immediate 'create index IDX_AM_APPOIUSER_USER_ID on AM_APPOINTMENT_USER (USER_ID)';
    execute immediate 'create index IDX_AM_APPOIUSER_APPOIID on AM_APPOINTMENT_USER (APPOINTMENT_ID)';

    execute immediate 'alter table AM_APPOINTMENT_TYPE add constraint FK_AM_APPOTYPE_PROC_ROLE_ID foreign key (PROC_ROLE_ID) references WF_PROC_ROLE(ID)';
    execute immediate 'create index IDX_AM_APPOTYPE_PROC_ROLE_ID on AM_APPOINTMENT_TYPE (PROC_ROLE_ID)';

    execute immediate 'alter table AM_APPOINTMENT_CARD_ROLE_INFO add constraint FK_CARD_ROLE_INFO_CARD_ROLE_ID foreign key (CARD_ROLE_ID) references WF_CARD_ROLE(ID)';
    execute immediate 'create index IDX_CARD_ROLE_INFO_CARD_ROLE on AM_APPOINTMENT_CARD_ROLE_INFO (CARD_ROLE_ID)';

  end if;
end;
^