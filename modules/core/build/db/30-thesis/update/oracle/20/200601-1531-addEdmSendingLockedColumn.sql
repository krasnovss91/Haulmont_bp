alter table TS_EDM_SENDING add LOCKED char(1) default 0^
update TS_EDM_SENDING set LOCKED = 0^

alter table TS_EDM_SENDING modify (LOCKED not null)^