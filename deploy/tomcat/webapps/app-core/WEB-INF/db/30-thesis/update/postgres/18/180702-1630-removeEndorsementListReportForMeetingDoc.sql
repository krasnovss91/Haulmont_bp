-- $Id$

update DF_DOC_KIND_REPORT_REPORT set DELETE_TS = now(), DELETED_BY = 'system' where
    CATEGORY_ID = '9415792f-c473-cbeb-d150-8ae687c4dcd2' and
    REPORT_ID in (select ID from REPORT_REPORT where CODE = 'EndorsementList') and
    DELETE_TS is null;