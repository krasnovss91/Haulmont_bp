-- $Id$
-- Description: increasing text columns length for 1C integration

if 255 > (select character_maximum_length from information_schema.columns
where table_name = 'df_contractor' and COLUMN_NAME = 'email')
begin
	ALTER TABLE df_contractor ALTER COLUMN email VARCHAR(255);
end

if 255 > (select character_maximum_length from information_schema.columns
where table_name = 'df_contractor' and COLUMN_NAME = 'phone')
begin
	ALTER TABLE df_contractor ALTER COLUMN phone VARCHAR(255);
end
