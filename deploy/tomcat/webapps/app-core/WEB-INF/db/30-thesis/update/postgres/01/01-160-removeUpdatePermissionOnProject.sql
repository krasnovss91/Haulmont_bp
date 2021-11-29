-- $Id$
-- Description: Remove update permission on Project for SimpleUser

delete from "public"."sec_permission"
where target = 'tm$Project:update' and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and value = 0;