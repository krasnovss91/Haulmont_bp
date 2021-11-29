-- $Id$

delete from SEC_PERMISSION where ROLE_ID = (select ID from SEC_ROLE where NAME = 'SimpleUser') and
	(TARGET = 'entityInspector.browse' or TARGET = 'sys$ScheduledTask.edit')^

select create_or_update_sec_permissi('SimpleUser', 'sys$ScheduledTask.edit', 10, 0)^
select create_or_update_sec_permissi('SimpleUser', 'entityInspector.browse', 10, 0)^