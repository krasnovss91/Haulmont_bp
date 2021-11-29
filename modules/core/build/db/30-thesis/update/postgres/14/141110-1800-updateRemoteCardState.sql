--$Id$

alter table TS_REMOTE_CARD_STATE add UPDATE_TS timestamp;
alter table TS_REMOTE_CARD_STATE add UPDATED_BY varchar(50)^