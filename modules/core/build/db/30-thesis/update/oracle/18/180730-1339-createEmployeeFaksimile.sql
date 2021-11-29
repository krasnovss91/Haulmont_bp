-- $Id$
-- Description:

alter table DF_EMPLOYEE add FAKSIMILE_FILE_ID varchar2(32 char)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_FAKSIMILE_F_ID foreign key (FAKSIMILE_FILE_ID) references SYS_FILE(ID)^