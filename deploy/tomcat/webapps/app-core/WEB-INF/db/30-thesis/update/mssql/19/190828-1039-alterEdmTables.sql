
alter table TS_EDM_SIGNATURE_DETAILS add SIGNATURE_COMMENT text^

alter table TS_EDM_SENDING drop column RESPONSE_SIGNATURE_REFUSE_MSG^
alter table TS_EDM_SENDING drop column SIGNATURE^
alter table TS_EDM_SENDING drop constraint TS_EDM_SENDING_FILE^
alter table TS_EDM_SENDING drop column FILE_ID^