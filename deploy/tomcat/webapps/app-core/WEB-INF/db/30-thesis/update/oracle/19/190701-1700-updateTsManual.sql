alter table TS_MANUAL drop column NAME_^
alter table TS_MANUAL drop column COMMENT_^

alter table TS_MANUAL add NAME_ varchar2(500 char)^
alter table TS_MANUAL add COMMENT_ clob^