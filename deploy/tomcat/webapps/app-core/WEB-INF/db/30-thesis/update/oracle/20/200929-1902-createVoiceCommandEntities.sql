create table TS_VOICE_COMMAND_SYN (
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
      SYNONYM_ varchar2(255 char),
      GLOBAL char(1),
      USER_ID varchar2(32),
      primary key (ID)
)^

alter table TS_VOICE_COMMAND_SYN add constraint TS_VOICE_COMMAND_SYN_USER_ID foreign key (USER_ID) references SEC_USER(ID)^
create index IDX_TS_VOICE_COMMAND_SYN_GLOBAL on TS_VOICE_COMMAND_SYN(GLOBAL)^
create index IDX_TS_VOICE_COMMAND_SYN_USER_ID on TS_VOICE_COMMAND_SYN(USER_ID)^

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