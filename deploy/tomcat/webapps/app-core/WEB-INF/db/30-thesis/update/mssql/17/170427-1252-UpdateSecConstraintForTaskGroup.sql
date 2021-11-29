-- $Id$
-- Description:

UPDATE SEC_CONSTRAINT SET WHERE_CLAUSE = REPLACE(WHERE_CLAUSE, 'or p.id = :session$userId', '')
WHERE entity_name = 'tm$TaskGroup';
