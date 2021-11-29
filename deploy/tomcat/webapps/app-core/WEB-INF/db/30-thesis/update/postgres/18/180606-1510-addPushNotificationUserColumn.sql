-- $Id$

alter table TS_PUSH_NOTIFICATION add USER_ID uuid;
alter table TS_PUSH_NOTIFICATION add constraint FK_TS_PUSH_NOTIFICATION_USER foreign key (USER_ID) references SEC_USER(ID);