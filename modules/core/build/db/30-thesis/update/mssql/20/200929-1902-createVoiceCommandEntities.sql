create table TS_VOICE_COMMAND_SYN (
      id uniqueidentifier,
      create_ts datetime2,
      created_by varchar(50),
      update_ts datetime2,
      updated_by varchar(50),
      delete_ts datetime2,
      deleted_by varchar(50),
      VERSION integer,
      ---
      COMMAND varchar(255),
      SYNONYM varchar(255),
      GLOBAL tinyint,
      USER_ID uniqueidentifier
      primary key nonclustered (ID)
)^

create clustered index IDX_TS_VOICE_COMMAND_SYN_CREATE_TS on TS_VOICE_COMMAND_SYN(CREATE_TS)^

alter table TS_VOICE_COMMAND_SYN add constraint TS_VOICE_COMMAND_SYN_USER_ID foreign key (USER_ID) references SEC_USER(ID)^
create index IDX_TS_VOICE_COMMAND_SYN_GLOBAL on TS_VOICE_COMMAND_SYN(GLOBAL)^
create index IDX_TS_VOICE_COMMAND_SYN_USER_ID on TS_VOICE_COMMAND_SYN(USER_ID)^

create table TS_COMPLEX_VOICE_COMMAND (
      id uniqueidentifier,
      create_ts datetime2,
      created_by varchar(50),
      update_ts datetime2,
      updated_by varchar(50),
      delete_ts datetime2,
      deleted_by varchar(50),
      VERSION integer,
      ---
      COMMAND varchar(255),
      COMMAND_TEMPLATE varchar(max),
      primary key nonclustered (ID)
)^

create clustered index IDX_TS_COMPLEX_VOICE_COMMAND_CREATE_TS on TS_COMPLEX_VOICE_COMMAND(CREATE_TS)^
