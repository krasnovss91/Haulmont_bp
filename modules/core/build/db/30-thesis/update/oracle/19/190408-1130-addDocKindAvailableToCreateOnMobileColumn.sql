-- $Id$

alter table DF_DOC_KIND add AVAILABLE_TO_CREATE_ON_MOB_CL char(1) default 1^
update DF_DOC_KIND set AVAILABLE_TO_CREATE_ON_MOB_CL = 1^

-- Входящий документ (ЭДО)
update DF_DOC_KIND set AVAILABLE_TO_CREATE_ON_MOB_CL = 0 where CATEGORY_ID = 'e7b46d3eff894f6481183cd057584b19'^