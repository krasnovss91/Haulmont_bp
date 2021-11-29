--$Id$
--$Description: adds Tab name field to Doc Kind to support rename of this tab

alter table DF_DOC_KIND add column TAB_NAME varchar(30);

update DF_DOC_KIND set TAB_NAME = 'Доп. поля';