-- $Id$
-- Description:
alter table TM_TASK_GROUP add IS_TEMPLATE boolean;
alter table TM_TASK_GROUP add TEMPLATE_NAME varchar(200);
update TM_TASK_GROUP set IS_TEMPLATE = false;