-- $Id$
-- Description:
UPDATE SEC_CONSTRAINT SET join_clause = REPLACE(join_clause, ' left join {E}.participants p', '') WHERE entity_name = 'tm$TaskGroup';