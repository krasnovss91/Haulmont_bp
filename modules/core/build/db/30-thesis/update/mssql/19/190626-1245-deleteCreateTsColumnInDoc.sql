-- $Id$

declare @default_constraint_name varchar(200);
declare @SQLString varchar(500);
select @default_constraint_name = (select NAME from SYS.DEFAULT_CONSTRAINTS where OBJECT_ID =
    (select DEFAULT_OBJECT_ID from SYS.COLUMNS where OBJECT_ID = OBJECT_ID('DF_DOC') and NAME = 'CREATE_TS'));
if (@default_constraint_name is not null) begin
    SET @SQLString = 'alter table DF_DOC drop constraint ' + @default_constraint_name;
    EXEC(@SQLString);
end^

drop index IDX_DF_DOC_CREATE_TS on DF_DOC^
alter table DF_DOC drop column CREATE_TS^