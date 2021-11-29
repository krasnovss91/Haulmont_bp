--$Id$
--Description:

alter table DF_DOC add column ENDORSED boolean^

update DF_DOC set ENDORSED = (case when APPROVAL_DATE is null then FALSE else TRUE end)^