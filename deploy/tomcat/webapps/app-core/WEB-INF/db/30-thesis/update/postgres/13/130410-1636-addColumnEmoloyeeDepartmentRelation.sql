--$Id$
--$Description:
alter table DF_EMPLOYEE_DEPARTMENT_RELATION add IS_MAIN boolean^

update DF_EMPLOYEE_DEPARTMENT_RELATION set  IS_MAIN=true;