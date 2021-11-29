-- $Id$

delete from SEC_PERMISSION where ROLE_ID = (select ID from SEC_ROLE where NAME = 'SimpleUser') and
	(TARGET = 'entityInspector.browse' or TARGET = 'sys$ScheduledTask.edit')^

exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='sys$ScheduledTask.edit', @p_type=10, @p_value=0^
exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='entityInspector.browse', @p_type=10, @p_value=0^