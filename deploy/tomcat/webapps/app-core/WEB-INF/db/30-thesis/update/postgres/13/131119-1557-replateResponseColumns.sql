-- $Id$
-- Description:

alter table DF_DOC drop column RESPOND_TO;
alter table DF_DOC drop column RESPOND_REGISTRATION_DATE;

alter table DF_DOC_OFFICE_DATA add RESPONSE_PLAN_DATE date;
alter table DF_DOC_OFFICE_DATA add RESPONSE_DATE date;
