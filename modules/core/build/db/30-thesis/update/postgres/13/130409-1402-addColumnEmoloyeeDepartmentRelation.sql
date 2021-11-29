--$Id$
--$Description:
alter table DF_EMPLOYEE_DEPARTMENT_RELATION add position_id uuid^

alter table DF_EMPLOYEE_DEPARTMENT_RELATION add constraint FK_DF_EMPLOYEE_DEPARTMENT_RELATION_ACCOUNT_DF_POSITION foreign key (POSITION_ID) references DF_POSITION(ID)^