--$Id$
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='ts$OfficeFileTransferLog:create', @p_type=20, @p_value=0;
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='ts$OfficeFileTransferLog:update', @p_type=20, @p_value=0;
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='ts$OfficeFileTransferLog:delete', @p_type=20, @p_value=0;

exec create_or_update_sec_permission @r_name='Archivist', @p_target='ts$OfficeFileTransferLog:create', @p_type=20, @p_value=1;
exec create_or_update_sec_permission @r_name='Archivist', @p_target='ts$OfficeFileTransferLog:update', @p_type=20, @p_value=1;
exec create_or_update_sec_permission @r_name='Archivist', @p_target='ts$OfficeFileTransferLog:delete', @p_type=20, @p_value=1;