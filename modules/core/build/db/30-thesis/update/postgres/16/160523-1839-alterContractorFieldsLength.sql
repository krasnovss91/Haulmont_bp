-- $Id$
-- Description: increasing text columns length for 1C integration

DO
$BODY$
BEGIN
if 255 > (select character_maximum_length from information_schema.columns
where table_name = 'df_contractor' and COLUMN_NAME = 'email')
then
	ALTER TABLE df_contractor ALTER COLUMN email type VARCHAR(255);
end if;
END;
$BODY$
^

DO
$BODY$
BEGIN
if 255 > (select character_maximum_length from information_schema.columns
where table_name = 'df_contractor' and COLUMN_NAME = 'phone')
then
	ALTER TABLE df_contractor ALTER COLUMN phone type VARCHAR(255);
end if;
END;
$BODY$
^