alter table TM_TASK_GROUP add CREATOR_ID varchar2(32 char)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_CREATOR foreign key (CREATOR_ID) references SEC_USER(ID)^