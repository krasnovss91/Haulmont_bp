-- $Id$
-- Description:

alter table DF_NUMERATOR add NUMERATOR_FORMAT text;
alter table DF_NUMERATOR add SCRIPT_ENABLED boolean;
alter table DF_NUMERATOR add PERIODICITY varchar(1);
update df_numerator set script_enabled = true where script_enabled is null and script is not null;