-- $Id$
-- Description:

update wf_card set state = ',New,' where state is null and id in (select card_id from tm_task);