-- $Id$

alter table TS_PUSH_NOTIFICATION add CARD_ID uuid;
alter table TS_PUSH_NOTIFICATION add constraint FK_TS_PUSH_NOTIFICATION_CARD foreign key (CARD_ID) references WF_CARD(ID);