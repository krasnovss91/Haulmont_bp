-- $Id$
-- Description:
UPDATE SEC_CONSTRAINT SET join_clause = regexp_replace(join_clause, ' left join {E}.participants p', '')
WHERE entity_name = 'tm$TaskGroup';