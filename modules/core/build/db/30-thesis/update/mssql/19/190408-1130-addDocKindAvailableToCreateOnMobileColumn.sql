-- $Id$

alter table DF_DOC_KIND add AVAILABLE_TO_CREATE_ON_MOB_CL tinyint constraint DF_DOC_KIND_AVAIL_TO_CR_DEF default 1^
update DF_DOC_KIND set AVAILABLE_TO_CREATE_ON_MOB_CL = 1^

-- Входящий документ (ЭДО)
update DF_DOC_KIND set AVAILABLE_TO_CREATE_ON_MOB_CL = 0 where CATEGORY_ID = 'e7b46d3e-ff89-4f64-8118-3cd057584b19'^