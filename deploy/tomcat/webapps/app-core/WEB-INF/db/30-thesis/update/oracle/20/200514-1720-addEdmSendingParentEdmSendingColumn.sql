alter table TS_EDM_SENDING add PARENT_EDM_SENDING_ID varchar2(32 char)^
alter table TS_EDM_SENDING add constraint FK_EDM_SENDING_PARENT_SENDING foreign key (PARENT_EDM_SENDING_ID) references TS_EDM_SENDING(ID)^