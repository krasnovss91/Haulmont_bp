-- $Id$
-- Description:

alter table DF_EMPLOYEE add column SEX boolean;

update DF_EMPLOYEE set SEX = true;