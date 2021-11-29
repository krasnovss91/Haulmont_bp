-- $Id$
-- Description:

alter table TM_SCHEDULE_TASK  add ORGANIZATION_ID uuid^

alter table TM_SCHEDULE_TASK add constraint FK_TM_SCHEDULE_TASK_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^