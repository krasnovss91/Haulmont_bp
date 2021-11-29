-- $Id$
-- Description: grant user group permissions for simple user
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='sys$ScheduledTask.browse', @p_type=10, @p_value=0^
