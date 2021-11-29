-- $Id$
-- Description:

alter table wf_card_role add readonly tinyint^

update wf_card_role set readonly = 0 where readonly is null^