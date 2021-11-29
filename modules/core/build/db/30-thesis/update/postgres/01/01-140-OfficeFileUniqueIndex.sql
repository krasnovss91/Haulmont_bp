-- $Id$
-- Description: Unique index for OFFICE_FILE table

create unique index IDX_DF_OFFICE_FILE_UNIQ on DF_OFFICE_FILE (VOLUME_NO, OFFICE_FILE_NOMENCLATURE_ID) where DELETE_TS is null;