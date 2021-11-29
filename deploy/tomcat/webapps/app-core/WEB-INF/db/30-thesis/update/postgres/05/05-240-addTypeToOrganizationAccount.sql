-- $Id$
-- Description:

create or replace function update_the_db() returns void as
$$
begin
    if not exists(select * from information_schema.columns
        where
            table_catalog = current_database() and table_schema = current_schema()
            and upper(table_name) = 'DF_ORGANIZATION_ACCOUNT' and upper(column_name) = 'TYPE') then
            alter table DF_ORGANIZATION_ACCOUNT add column TYPE varchar(1);
            update DF_ORGANIZATION_ACCOUNT set type = 'O';
    end if;
end;
$$
language 'plpgsql';
^
select update_the_db();
^
drop function update_the_db();

