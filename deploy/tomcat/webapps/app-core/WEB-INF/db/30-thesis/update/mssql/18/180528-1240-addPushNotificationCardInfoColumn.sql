-- $Id$

alter table TS_PUSH_NOTIFICATION add CARD_INFO_ID uniqueidentifier;
alter table TS_PUSH_NOTIFICATION add constraint FK_TS_PUSH_NOT_CARD_INFO foreign key (CARD_INFO_ID) references WF_CARD_INFO(ID);