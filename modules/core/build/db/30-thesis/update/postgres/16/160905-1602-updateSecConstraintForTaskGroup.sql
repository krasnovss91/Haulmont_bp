-- $Id$
-- Description:

update SEC_CONSTRAINT set WHERE_CLAUSE = regexp_replace(WHERE_CLAUSE, 'or \{E\}.chairman(.*)or exists', 'or exists', 'g')
where entity_name = 'tm$TaskGroup';