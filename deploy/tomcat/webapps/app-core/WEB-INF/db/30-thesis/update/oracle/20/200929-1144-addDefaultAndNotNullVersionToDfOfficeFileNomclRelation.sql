update DF_OFF_FILE_NOMENCL_RELATION set VERSION = 1 where VERSION is NULL^

declare
  count_columns integer;
begin
  select count(*) into count_columns
    from user_tab_columns
    where table_name='DF_OFF_FILE_NOMENCL_RELATION'
    AND column_name = 'VERSION'
    AND data_default IS NOT NULL
    AND nullable = 'N';

  if count_columns = 0 then
    execute immediate 'alter table DF_OFF_FILE_NOMENCL_RELATION modify (VERSION default 1 not null)';
  end if;
end;
^