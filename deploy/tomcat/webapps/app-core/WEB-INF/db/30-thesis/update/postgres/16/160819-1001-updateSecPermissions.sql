-- $Id$
-- Description: grant user group permissions for simple user
select create_or_update_sec_permission('SimpleUser', 'sys$ScheduledTask.browse', 10, 0)^
