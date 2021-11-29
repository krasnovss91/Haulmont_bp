-- $Id$
-- Description:

update wf_card set creator_id  = (select id from sec_user where login = wf_card.created_by limit 1) where creator_id is NULL;