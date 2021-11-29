-- $Id$
-- Description:
alter table DF_ORGANIZATION add SECRETARY_ID uniqueidentifier^
alter table DF_ORGANIZATION add constraint FK_DF_ORGANIZATION_SECRETARY foreign key (SECRETARY_ID) references SEC_USER(ID)^