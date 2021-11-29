-- $Id$

alter table DF_EMPLOYEE add MOBILE_AVATAR_FILE_ID uniqueidentifier;
alter table DF_EMPLOYEE add constraint FK_DF_EMPL_MOB_AVATAR_FILE_ID foreign key (MOBILE_AVATAR_FILE_ID) references SYS_FILE(ID);