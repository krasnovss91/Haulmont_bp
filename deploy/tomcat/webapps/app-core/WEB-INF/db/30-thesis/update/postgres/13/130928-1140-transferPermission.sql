--$Id$
--$Description:

select create_or_update_sec_permission('Administrators', 'transferOfficeFile', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'transferOfficeFile', 10, 0)^