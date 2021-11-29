-- $Id$
-- Description: add
alter table TM_TASK_GROUP add SUBSTITUTED_CREATOR_ID uuid;
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_SUBSTITUTED_CREATOR foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID);