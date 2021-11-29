-- $Id$
-- Description:

alter table wf_card_role add column readonly boolean;

update wf_card_role set readonly = false where readonly is null^