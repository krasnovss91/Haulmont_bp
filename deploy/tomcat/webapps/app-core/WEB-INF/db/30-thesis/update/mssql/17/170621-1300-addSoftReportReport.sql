-- $Id
alter table DF_DOC_KIND_REPORT_REPORT add DELETE_TS datetime^
alter table DF_DOC_KIND_REPORT_REPORT add DELETED_BY varchar(50)^
alter table DF_DOC_KIND_REPORT_REPORT add ID uniqueidentifier^
alter table DF_DOC_KIND_REPORT_REPORT add CREATE_TS datetime^
alter table DF_DOC_KIND_REPORT_REPORT add CREATED_BY varchar(50)^
update DF_DOC_KIND_REPORT_REPORT set ID = newid()^
alter table DF_DOC_KIND_REPORT_REPORT alter column ID uniqueidentifier NOT NULL^
ALTER TABLE DF_DOC_KIND_REPORT_REPORT ADD PRIMARY KEY (ID);