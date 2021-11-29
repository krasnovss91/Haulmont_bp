-- $Id$
-- Description:

update wf_card set parent_card_access = FALSE where parent_card_access is NULL;