--$Id$
--$Description: moves HAS_ATTACHMENT attribute back to correspondent entity

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DF_CORRESPONDENT'
and COLUMN_NAME = 'HAS_ATTACHMENTS')
BEGIN
alter table DF_CORRESPONDENT add HAS_ATTACHMENTS tinyint;
END^

