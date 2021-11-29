-- $Id$
-- Description:
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('6d380898-297f-11e2-b2d9-278fef9a3a98',now(),'admin',1,now(),'admin',null,null,'SimplifiedRegistration','Упрощенная регистрация входящих',null,null)^

select create_or_update_sec_permission('SimpleUser', 'df$FastRegistration', 10, 0)^
select create_or_update_sec_permission('SimplifiedRegistration', 'df$FastRegistration', 10, 1)^
select create_or_update_sec_permission('Administrators', 'df$FastRegistration', 10, 1)^