--$Id$
--$Description:
alter table DF_EMPLOYEE_DEPARTMENT_RELATION add IS_MAIN tinyint^

update DF_EMPLOYEE_DEPARTMENT_RELATION set  IS_MAIN=1;