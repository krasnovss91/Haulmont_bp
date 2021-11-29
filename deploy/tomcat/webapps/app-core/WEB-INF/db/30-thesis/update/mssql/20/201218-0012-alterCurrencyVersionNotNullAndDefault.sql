alter table df_currency alter column version integer not null^

if exists(select * from information_schema.columns where table_name = 'DF_CURRENCY' and column_name = 'VERSION' and column_default is null)
begin
  alter table df_currency add default 1 for version
end^
