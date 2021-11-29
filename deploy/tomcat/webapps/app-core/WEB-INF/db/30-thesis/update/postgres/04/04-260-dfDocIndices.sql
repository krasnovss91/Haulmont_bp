-- $Id$

drop index if exists IDX_DF_DOC_DATE;
create index IDX_DF_DOC_DATE on DF_DOC(DATE);

drop index if exists IDX_DF_DOC_DATETIME;
create index IDX_DF_DOC_DATETIME on DF_DOC(DATETIME);

drop index if exists IDX_DF_DOC_REG_DATE;
create index IDX_DF_DOC_REG_DATE on DF_DOC(REG_DATE);