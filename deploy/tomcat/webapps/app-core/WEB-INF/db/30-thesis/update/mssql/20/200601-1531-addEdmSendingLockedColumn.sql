alter table TS_EDM_SENDING add LOCKED tinyint constraint TS_EDM_SENDING_LOCKED_DEF default 0^
update TS_EDM_SENDING set LOCKED = 0^

alter table TS_EDM_SENDING alter column LOCKED tinyint not null^