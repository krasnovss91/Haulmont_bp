--$Id$
--Description:
alter table TM_TASK add SCHEDULE_TASK_ID uniqueidentifier;
alter table TM_TASK add constraint FK_TM_TASK_SCHEDULE_TASK_ID foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID)^