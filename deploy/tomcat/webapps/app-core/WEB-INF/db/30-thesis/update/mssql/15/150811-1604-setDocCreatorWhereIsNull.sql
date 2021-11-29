-- $Id$
-- Description:

update wf_card set creator_id  = (select top 1 id from sec_user where login = wf_card.created_by) where creator_id is NULL;