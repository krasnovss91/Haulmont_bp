-- $Id$
-- Description:

delete from sec_permission  where role_id = '6d380898-297f-11e2-b2d9-278fef9a3a98';
delete from sec_user_role  where role_id = '6d380898-297f-11e2-b2d9-278fef9a3a98';
delete from sec_role where id = '6d380898-297f-11e2-b2d9-278fef9a3a98'^

select create_or_update_sec_permission('doc_secretary', 'df$FastRegistration', 10, 1);