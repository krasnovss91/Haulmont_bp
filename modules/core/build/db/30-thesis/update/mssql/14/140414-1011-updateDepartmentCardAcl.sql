-- $Id$
-- Description:

INSERT INTO TS_CARD_ACL (id, create_ts, created_by, card_id, department_id, global)
     SELECT newid() ,current_timestamp, 'admin', d.card_id, d.department_id, 0 from df_Doc d where not d.department_id  is null^