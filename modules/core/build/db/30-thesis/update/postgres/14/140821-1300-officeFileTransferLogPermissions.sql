--$Id$

select create_or_update_sec_permission('SimpleUser', 'ts$OfficeFileTransferLog:create', 20, 0);
select create_or_update_sec_permission('SimpleUser', 'ts$OfficeFileTransferLog:update', 20, 0);
select create_or_update_sec_permission('SimpleUser', 'ts$OfficeFileTransferLog:delete', 20, 0);

select create_or_update_sec_permission('Archivist', 'ts$OfficeFileTransferLog:create', 20, 1);
select create_or_update_sec_permission('Archivist', 'ts$OfficeFileTransferLog:update', 20, 1);
select create_or_update_sec_permission('Archivist', 'ts$OfficeFileTransferLog:delete', 20, 1);