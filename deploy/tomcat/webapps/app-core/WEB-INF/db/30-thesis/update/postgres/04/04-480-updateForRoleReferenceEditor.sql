-- $Id$
update sec_permission set value=0 where (target='tm$TaskType.browse' or target='tm$TaskPattern.browse')
and role_id=(select id from sec_role where name='ReferenceEditor') and value=1