-- $Id$
-- Description:

ALTER TABLE DF_CATEGORY ADD DOC_KIND_ID uniqueidentifier;
alter table DF_CATEGORY add constraint FK_DF_CATEGORY_DOC_KIND foreign key (DOC_KIND_ID) references DF_DOC_KIND (CATEGORY_ID)^