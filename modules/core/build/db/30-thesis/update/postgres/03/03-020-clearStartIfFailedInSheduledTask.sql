-- $Id$
-- Description:

update tm_schedule_task set start_if_failed = false^
alter table TM_SCHEDULE_ACTION_LOG alter column MESSAGE type text;
alter table TM_SCHEDULE_ACTION_LOG add IS_ERROR boolean;