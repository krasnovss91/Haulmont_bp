-- $Id$

--Ограниченный доступ
insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, VERSION, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID)
values (newid(), now(), 'system', 1, 'df$AccountDoc', ', ts$CardAcl acl',
'{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)',
'8e6306e2-9e10-414a-b437-24c91ffef804')^

--Ограниченный доступ + все договоры
insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, VERSION, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID)
values (newid(), now(), 'system', 1, 'df$AccountDoc', ', ts$CardAcl acl',
'{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)',
'9e44a053-a31f-4edd-b19b-39e942161dd2')^

--Руководитель департамента
insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, VERSION, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID)
values (newid(), now(), 'system', 1, 'df$AccountDoc', ', ts$CardAcl acl',
'{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
'9fa89a54-9ffa-11e1-b13e-9f4a54bff17e')^

--Руководитель подразделения
insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, VERSION, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID)
values (newid(), now(), 'system', 1, 'df$AccountDoc', ', ts$CardAcl acl',
 '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
'8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb')^

--Архивариус
insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, VERSION, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID)
values (newid(), now(), 'system', 1, 'df$AccountDoc', 'join {E}.aclList acl',
'({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true))',
'cff945e4-e363-0dc0-d70d-4b5bdb2a2269')^

--Ограниченный доступ + все документы
update SEC_CONSTRAINT set WHERE_CLAUSE = replace(WHERE_CLAUSE,
 '(:session$simpleDocEffectiveClass)', '(:session$simpleDocEffectiveClass, :session$accountDocEffectiveClass)')
 where ENTITY_NAME = 'df$Doc' and GROUP_ID = 'b3dc60f5-65b2-47ab-8802-9e8929bf8b29'^

--roles permissions
select create_or_update_sec_permissi('SimpleUser', 'df$AccountDoc:create', 20, 0)^
select create_or_update_sec_permissi('SimpleUser', 'df$AccountDoc:delete', 20, 0)^
select create_or_update_sec_permissi('doc_initiator', 'df$AccountDoc:create', 20, 1)^
select create_or_update_sec_permissi('doc_initiator', 'df$AccountDoc:update', 20, 1)^
select create_or_update_sec_permissi('doc_initiator', 'df$AccountDoc:delete', 20, 1)^
select create_or_update_sec_permissi('Administrators', 'df$AccountDoc:create', 20, 1)^
select create_or_update_sec_permissi('Administrators', 'df$AccountDoc:update', 20, 1)^
select create_or_update_sec_permissi('Administrators', 'df$AccountDoc:delete', 20, 1)^