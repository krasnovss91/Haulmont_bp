--$Id$
--Description:

update SEC_CONSTRAINT set
WHERE_CLAUSE='{E}.id = acl.card.id and (acl.department.id in :session$departmentIds or acl.global = true or {E}.department.id in :session$departmentIds)'
where WHERE_CLAUSE='{E}.id = acl.card.id and (acl.department.id in :session$departmentIds or acl.global = true or card.department.id in :session$departmentIds)';