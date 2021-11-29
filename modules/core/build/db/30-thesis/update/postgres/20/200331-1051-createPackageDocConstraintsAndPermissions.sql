--roles permissions
select create_or_update_sec_permissi('SimpleUser', 'df$PackageDoc:create', 20, 0)^
select create_or_update_sec_permissi('SimpleUser', 'df$PackageDoc:delete', 20, 0)^
select create_or_update_sec_permissi('doc_initiator', 'df$PackageDoc:create', 20, 1)^
select create_or_update_sec_permissi('doc_initiator', 'df$PackageDoc:update', 20, 1)^
select create_or_update_sec_permissi('doc_initiator', 'df$PackageDoc:delete', 20, 1)^
select create_or_update_sec_permissi('Administrators', 'df$PackageDoc:create', 20, 1)^
select create_or_update_sec_permissi('Administrators', 'df$PackageDoc:update', 20, 1)^
select create_or_update_sec_permissi('Administrators', 'df$PackageDoc:delete', 20, 1)^
