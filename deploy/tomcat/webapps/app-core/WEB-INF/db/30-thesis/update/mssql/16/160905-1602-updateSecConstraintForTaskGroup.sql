-- $Id$
-- Description:
update SEC_CONSTRAINT set WHERE_CLAUSE = REPLACE(WHERE_CLAUSE, '
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId', '') where entity_name = 'tm$TaskGroup';

update SEC_CONSTRAINT set WHERE_CLAUSE = REPLACE(WHERE_CLAUSE, '
 or {E}.chairman.id = :session$userId
 or {E}.secretary.id = :session$userId
 or {E}.initiator.id = :session$userId', '') where entity_name = 'tm$TaskGroup';