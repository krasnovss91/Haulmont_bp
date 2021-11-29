--$Id$
--$Description: adds permission to task type screen to admin

--insert into sec_permission (id, create_ts, created_by, version, permission_type, target, value, role_id)
--values (newid(), current_timestamp, 'admin', 1, 10, 'tm$TaskType.browse', 1,
--(select id from SEC_ROLE where name = 'Administrators'))^
^
select create_or_update_sec_permission('Administrators', 'tm$TaskType.browse', 10, 1)^