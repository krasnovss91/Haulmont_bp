create table TS_VOICE_COMMAND_SYN (
      id uuid,
      create_ts timestamp,
      created_by varchar(50),
      update_ts timestamp,
      updated_by varchar(50),
      delete_ts timestamp,
      deleted_by varchar(50),
      VERSION integer,
      ---
      COMMAND varchar(255),
      SYNONYM varchar(255),
      GLOBAL boolean,
      USER_ID uuid,
      primary key (ID)
)^

alter table TS_VOICE_COMMAND_SYN add constraint TS_VOICE_COMMAND_SYN_USER_ID foreign key (USER_ID) references SEC_USER(ID)^
create index IDX_TS_VOICE_COMMAND_SYN_GLOBAL on TS_VOICE_COMMAND_SYN(GLOBAL)^
create index IDX_TS_VOICE_COMMAND_SYN_USER_ID on TS_VOICE_COMMAND_SYN(USER_ID)^

create table TS_COMPLEX_VOICE_COMMAND (
      id uuid,
      create_ts timestamp,
      created_by varchar(50),
      update_ts timestamp,
      updated_by varchar(50),
      delete_ts timestamp,
      deleted_by varchar(50),
      VERSION integer,
      ---
      COMMAND varchar(255),
      COMMAND_TEMPLATE text,
      primary key (ID)
)^

select create_or_update_sec_permissi('SimpleUser', 'ts$ComplexVoiceCommand.browse', 10, 0)^
select create_or_update_sec_permissi('SimpleUser', 'ts$VoiceCommandSynonym.browse', 10, 0)^

select create_or_update_sec_permissi('SimpleUser', 'ts$ComplexVoiceCommand:create', 20, 0)^
select create_or_update_sec_permissi('SimpleUser', 'ts$ComplexVoiceCommand:update', 20, 0)^
select create_or_update_sec_permissi('SimpleUser', 'ts$ComplexVoiceCommand:delete', 20, 0)^