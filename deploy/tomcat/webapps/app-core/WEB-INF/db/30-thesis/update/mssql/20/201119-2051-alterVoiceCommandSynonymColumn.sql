alter table TS_VOICE_COMMAND_SYN add SYNONYM_ varchar(255); ^
update TS_VOICE_COMMAND_SYN set SYNONYM_ = SYNONYM; ^
alter table TS_VOICE_COMMAND_SYN drop column SYNONYM; ^