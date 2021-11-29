-- $Id$
drop index if exists IDX_DF_DOC_NUMBER;
create index IDX_DF_DOC_NUMBER on DF_DOC(NUMBER);