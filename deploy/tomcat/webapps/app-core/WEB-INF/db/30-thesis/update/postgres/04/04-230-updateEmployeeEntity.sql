--$Id$

alter table DF_EMPLOYEE add column MOBILE_PHONE varchar(100);
alter table DF_EMPLOYEE add column PHOTO_FILE_ID uuid;

alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_SYS_FILE foreign key (PHOTO_FILE_ID) references SYS_FILE (ID);