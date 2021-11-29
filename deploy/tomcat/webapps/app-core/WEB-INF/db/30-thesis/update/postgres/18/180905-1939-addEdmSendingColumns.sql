alter table DF_DOC drop column RESPONSE_SIGNATURE_REQUIRED^
alter table TS_EDM_SENDING add FILE_ID uuid^
alter table TS_EDM_SENDING add SUBSCRIBER_ID uuid^
alter table TS_EDM_SENDING add RESPONSE_SIGNATURE_REQUIRED boolean^

alter table TS_EDM_SENDING add constraint TS_EDM_SENDING_FILE foreign key (FILE_ID) references SYS_FILE(ID)^
alter table TS_EDM_SENDING add constraint TS_EDM_SENDING_CARD foreign key (DOC_ID) references WF_CARD(ID)^
alter table TS_EDM_SENDING add constraint TS_EDM_SENDING_SUBSCRIBER foreign key (SUBSCRIBER_ID) references TS_SUBSCRIBER_EDM(ID)^