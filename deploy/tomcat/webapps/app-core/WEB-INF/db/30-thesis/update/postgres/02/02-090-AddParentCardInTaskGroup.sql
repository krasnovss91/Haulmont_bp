-- $Id$
-- Description:
ALTER TABLE TM_TASK_GROUP add PARENT_CARD_ID uuid;
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_PARENT_CARD foreign key (PARENT_CARD_ID) references WF_CARD(ID);