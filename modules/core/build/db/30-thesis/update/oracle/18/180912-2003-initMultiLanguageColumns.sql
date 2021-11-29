alter table SEC_GROUP add LOC_NAME clob^
alter table WF_PROC add LOC_NAME clob^
alter table DF_NUMERATOR add LOC_NAME clob^
update DF_NUMERATOR set LOC_NAME = NAME^
alter table DF_NUMERATOR drop column NAME^
alter table DF_NUMERATOR rename column LOC_NAME to NAME^