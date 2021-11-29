-- $Id$
-- Description: update user group permissions

select create_or_update_sec_permission('Administrators', 'wf$UserGroup:create', 20, 1)^
select create_or_update_sec_permission('Administrators', 'wf$UserGroup:update', 20, 1)^
select create_or_update_sec_permission('Administrators', 'wf$UserGroup:delete', 20, 1)^

select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:create', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:update', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:delete', 20, 0)^