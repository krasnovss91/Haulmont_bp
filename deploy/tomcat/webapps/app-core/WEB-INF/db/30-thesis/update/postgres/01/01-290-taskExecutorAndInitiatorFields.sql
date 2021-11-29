-- $Id$
-- Description:

alter table TM_TASK add EXECUTOR_ID uuid;
alter table TM_TASK add constraint FK_TM_TASK_EXECUTOR_USER foreign key (EXECUTOR_ID) references SEC_USER(ID);

alter table TM_TASK add INITIATOR_ID uuid;
alter table TM_TASK add constraint FK_TM_TASK_INITIATOR_USER foreign key (INITIATOR_ID) references SEC_USER(ID);
