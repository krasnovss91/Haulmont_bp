alter table TS_EDM_SENDING add EDM_SENDING_TYPE integer^

update TS_EDM_SENDING set EDM_SENDING_TYPE = 10^

alter table TS_EDM_SENDING alter column EDM_SENDING_TYPE set not null^