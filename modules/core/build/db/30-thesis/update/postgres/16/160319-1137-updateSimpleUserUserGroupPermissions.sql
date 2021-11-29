-- $Id$
-- Description: grant user group permissions for simple user

select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:create', 20, 1)^
select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:update', 20, 1)^
select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:delete', 20, 1)^