-- $Id$
update DF_MEETING_DOC set status = 0 where card_id in (select card_id from DF_DOC where is_template = 1);