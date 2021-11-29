-- $Id$
-- Description:

alter table TM_TASK_GROUP_TASK add column TYPE varchar(2);
update TM_TASK_GROUP_TASK set type = 'TG';
