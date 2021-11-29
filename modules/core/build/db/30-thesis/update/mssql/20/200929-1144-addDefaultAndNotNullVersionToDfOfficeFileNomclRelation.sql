update DF_OFF_FILE_NOMENCL_RELATION set VERSION = 1 where VERSION is null^
alter table DF_OFF_FILE_NOMENCL_RELATION alter column VERSION integer NOT NULL^
IF EXISTS(SELECT * FROM information_schema.columns
           WHERE table_name='DF_OFF_FILE_NOMENCL_RELATION' AND column_name='VERSION'
             AND column_default IS NULL)
BEGIN
  ALTER TABLE DF_OFF_FILE_NOMENCL_RELATION ADD DEFAULT 1 FOR VERSION
END^
