--$Id$
--Description:
select create_or_update_sec_permission('Administrators', 'df$Position:update', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$Position:delete', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$Position:read', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$Position:create', 20, 1)^

select create_or_update_sec_permission('ReferenceEditor', 'df$Position:update', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$Position:delete', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$Position:read', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$Position:create', 20, 1)^

select create_or_update_sec_permission('SimpleUser', 'df$Position:update', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$Position:delete', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$Position:create', 20, 0)^
