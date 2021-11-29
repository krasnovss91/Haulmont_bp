-- $Id$
-- Description:

alter table DF_EMPLOYEE add AVATAR_FILE_ID uuid;
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_AVATAR_FILE_ID foreign key (AVATAR_FILE_ID) references SYS_FILE(ID);