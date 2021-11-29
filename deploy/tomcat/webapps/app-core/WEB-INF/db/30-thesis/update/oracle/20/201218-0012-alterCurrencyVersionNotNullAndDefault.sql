alter table df_currency modify version default 1^

declare
  count_columns integer;
begin
  select count(*) into count_columns
    from user_tab_columns
    where table_name='DF_CURRENCY'
    AND column_name = 'VERSION'
    AND nullable = 'N';

  if count_columns = 0 then
    execute immediate 'alter table df_currency modify (version integer not null)';
  end if;
end;
^