-- $Id$
-- Description:

alter table "DF_EMPLOYEE" rename column "FAKSIMILE_FILE_ID" to FACSIMILE_FILE_ID^

UPDATE SYS_CONFIG
SET name = 'thesis.useFacsimile'
where name like '%Faksimile%'^