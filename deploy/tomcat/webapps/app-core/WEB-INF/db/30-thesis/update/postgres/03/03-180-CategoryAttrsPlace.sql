--$Id$
alter table DF_DOC_KIND add CATEGORY_ATTRS_PLACE integer;
alter table TM_TASK_TYPE add CATEGORY_ATTRS_PLACE integer;

update DF_DOC_KIND set CATEGORY_ATTRS_PLACE = 1;
update TM_TASK_TYPE set CATEGORY_ATTRS_PLACE = 1;