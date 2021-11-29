-- $Id$
-- Description:

EXEC sp_rename 'df_employee.faksimile_file_id', 'facsimile_file_id';

UPDATE SYS_CONFIG
SET name = 'thesis.useFacsimile'
where name like '%Faksimile%';