-- $Id$

alter table TS_PUSH_NOTIFICATION add USER_ID varchar2(32 char)^
alter table TS_PUSH_NOTIFICATION add constraint FK_TS_PUSH_NOTIFICATION_USER foreign key (USER_ID) references SEC_USER(ID)^