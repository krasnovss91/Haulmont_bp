-- $Id$

update SEC_CONSTRAINT set WHERE_CLAUSE=replace(WHERE_CLAUSE,
'{E}.id in (select acl.card.id from ts$CardAcl acl where (acl.user.id = :session$userId or acl.global = true))',
'exists (select acl.id from ts$CardAcl acl where acl.card.id={E}.id and (acl.user.id = :session$userId or acl.global = true))'
)^

update SEC_CONSTRAINT set WHERE_CLAUSE=replace(WHERE_CLAUSE,
'{E}.id in (select acl.card.id from ts$CardAcl acl where acl.user.id = :session$userId)',
'exists (select acl.id from ts$CardAcl acl where acl.card.id={E}.id and acl.user.id = :session$userId)'
)^

update SEC_CONSTRAINT set WHERE_CLAUSE=replace(WHERE_CLAUSE,
'{E}.id in (select acl.card.id from ts$CardAcl acl where (acl.user.id = :session$userId or acl.department.id in :session$departmentIds or acl.global = true))',
'exists (select acl.id from ts$CardAcl acl where acl.card.id={E}.id and (acl.user.id = :session$userId or acl.department.id in :session$departmentIds or acl.global = true))'
)^

update SEC_CONSTRAINT set WHERE_CLAUSE=replace(WHERE_CLAUSE,
'{E}.id in (select acl.card.id from ts$CardAcl acl where (acl.department.id in :session$departmentIds or acl.user.id = :session$userId))',
'exists (select acl.id from ts$CardAcl acl where acl.card.id={E}.id and (acl.department.id in :session$departmentIds or acl.user.id = :session$userId))'
)^

--Ограниченный доступ + все документы
update SEC_CONSTRAINT set JOIN_CLAUSE=null, WHERE_CLAUSE='(TYPE({E}) in (:session$simpleDocEffectiveClass) or exists (select acl.id from ts$CardAcl acl where acl.card.id={E}.id and (acl.user.id = :session$userId or acl.global = true)))'
    where GROUP_ID = 'b3dc60f5-65b2-47ab-8802-9e8929bf8b29' and ENTITY_NAME = 'df$Doc'
        and WHERE_CLAUSE='{E}.id = acl.card.id and (TYPE({E}) in (:session$simpleDocEffectiveClass) or acl.user.id = :session$userId or acl.global = true)'^

--Ограниченный доступ + все договоры
update SEC_CONSTRAINT set JOIN_CLAUSE=null, WHERE_CLAUSE='(TYPE({E}) in (:session$contractEffectiveClass) or exists (select acl.id from ts$CardAcl acl where acl.card.id={E}.id and (acl.user.id = :session$userId or acl.global = true)))'
    where GROUP_ID = '9e44a053-a31f-4edd-b19b-39e942161dd2' and ENTITY_NAME = 'df$Doc'
        and WHERE_CLAUSE='{E}.id = acl.card.id and (TYPE({E}) in (:session$contractEffectiveClass) or acl.user.id = :session$userId or acl.global = true)'^