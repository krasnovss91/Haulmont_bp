-- $Id$
-- Description:
UPDATE sec_constraint SET where_clause='{E}.id = acl.card.id and (TYPE({E}) in (:session$contractEffectiveClass) or acl.user.id = :session$userId or acl.global = true)' WHERE id='99961b6f-d798-479c-9b93-04b16a99ff62'^
UPDATE sec_constraint SET where_clause='{E}.id = acl.card.id and (TYPE({E}) in (:session$simpleDocEffectiveClass) or acl.user.id = :session$userId or acl.global = true)' WHERE id='3f520104-d798-479c-9b93-04b16a99ff62'^