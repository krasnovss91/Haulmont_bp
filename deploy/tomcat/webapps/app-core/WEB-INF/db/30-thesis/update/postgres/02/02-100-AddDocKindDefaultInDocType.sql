-- $Id$
-- Description:

alter table DF_DOC_TYPE add DOC_KIND_ID uuid;
alter table DF_DOC_TYPE add constraint FK_DF_DOC_TYPE_KIND foreign key (DOC_KIND_ID) references DF_DOC_KIND (ID);