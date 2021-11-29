update DF_OFF_FILE_NOMENCL_RELATION set VERSION = 1 where VERSION is null^
alter table DF_OFF_FILE_NOMENCL_RELATION alter column VERSION set not null^
alter table DF_OFF_FILE_NOMENCL_RELATION alter column VERSION set default 1^