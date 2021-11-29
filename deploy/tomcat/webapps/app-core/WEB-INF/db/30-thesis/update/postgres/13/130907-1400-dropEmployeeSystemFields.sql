--$Id$
--$Description: drop employee system fields

alter table DF_EMPLOYEE
drop column CREATE_TS,
drop column CREATED_BY,
drop column VERSION,
drop column UPDATE_TS,
drop column UPDATED_BY,
drop column DELETE_TS,
drop column DELETED_BY;