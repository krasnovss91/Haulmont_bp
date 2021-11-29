--$Id$
--Description:

alter table DF_DOC add ENDORSED tinyint^

update DF_DOC set ENDORSED = (case when APPROVAL_DATE is null then 0 else 1 end)^