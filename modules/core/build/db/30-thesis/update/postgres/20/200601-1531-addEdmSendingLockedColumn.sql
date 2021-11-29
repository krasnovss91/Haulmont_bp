alter table TS_EDM_SENDING add LOCKED boolean default false^
update TS_EDM_SENDING set LOCKED = false^

alter table TS_EDM_SENDING alter column LOCKED set not null^