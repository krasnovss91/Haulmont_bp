-- $Id$
-- Description:

update wf_card set parent_card_access = 0 where parent_card_access is NULL;