-- $Id$

alter table DF_DOC_KIND add AVAILABLE_TO_CREATE_ON_MOB_CL boolean default true^
update DF_DOC_KIND set AVAILABLE_TO_CREATE_ON_MOB_CL = true^

-- Входящий документ (ЭДО)
update DF_DOC_KIND set AVAILABLE_TO_CREATE_ON_MOB_CL = false where CATEGORY_ID = 'e7b46d3e-ff89-4f64-8118-3cd057584b19'^