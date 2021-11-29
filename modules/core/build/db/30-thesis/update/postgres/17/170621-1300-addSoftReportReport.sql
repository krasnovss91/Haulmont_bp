-- $Id:
alter table DF_DOC_KIND_REPORT_REPORT add DELETED_BY varchar(50);
alter table DF_DOC_KIND_REPORT_REPORT add DELETE_TS timestamp;
alter table DF_DOC_KIND_REPORT_REPORT add ID UUID;
alter table DF_DOC_KIND_REPORT_REPORT add CREATED_BY varchar(50);
alter table DF_DOC_KIND_REPORT_REPORT add CREATE_TS timestamp;
update DF_DOC_KIND_REPORT_REPORT set ID=NEWID();
alter table DF_DOC_KIND_REPORT_REPORT alter ID set not null;
ALTER TABLE DF_DOC_KIND_REPORT_REPORT ADD PRIMARY KEY (ID);