-- $Id$
-- Description:

ALTER TABLE df_employee RENAME faksimile_file_id  TO facsimile_file_id;

UPDATE SYS_CONFIG
SET name = 'thesis.useFacsimile'
where name like '%Faksimile%';