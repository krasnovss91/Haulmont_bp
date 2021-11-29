-- $Id$

alter table TS_MOBILE_CLIENT_CARD_METADATA add VERSION integer;
alter table TS_MOBILE_CLIENT_CARD_METADATA add UPDATE_TS datetime;
alter table TS_MOBILE_CLIENT_CARD_METADATA add UPDATED_BY varchar(50);
alter table TS_MOBILE_CLIENT_CARD_METADATA add DELETE_TS datetime;
alter table TS_MOBILE_CLIENT_CARD_METADATA add DELETED_BY varchar(50);
