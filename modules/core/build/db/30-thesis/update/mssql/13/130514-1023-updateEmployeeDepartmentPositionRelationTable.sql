--$Id$
--$Description:

update DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION set position_id =
    (select e.position_id from DF_EMPLOYEE e where e.correspondent_id=employee_id) where is_main=1^