-- $Id$
-- Description: move FINISH_DATE_PLAN column to DF_DOC

alter table DF_DOC_OFFICE_DATA drop FINISH_DATE_PLAN;

alter table DF_DOC add FINISH_DATE_PLAN date;