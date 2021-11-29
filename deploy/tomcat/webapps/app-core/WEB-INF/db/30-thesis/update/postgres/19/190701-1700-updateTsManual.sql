alter table TS_MANUAL drop column NAME_^
alter table TS_MANUAL drop column COMMENT_^

alter table TS_MANUAL add NAME_ varchar(500)^
alter table TS_MANUAL add COMMENT_ varchar(1000)^