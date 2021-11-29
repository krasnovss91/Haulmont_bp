--$Id$
--$Description:

update sys_fts_queue set entity_name = 'ts$CardAttachment' where entity_name = 'wf$CardAttachment';
update sys_fts_queue set entity_name = 'sys$FileDescriptor' where entity_name = 'core$FileDescriptor';
update sys_fts_queue set entity_name = 'df$CorrespondentAttachment' where entity_name = 'df$ContractorAttachment'