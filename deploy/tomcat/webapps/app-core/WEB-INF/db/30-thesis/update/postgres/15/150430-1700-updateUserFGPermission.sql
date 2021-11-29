--$Id$

delete from sec_permission where target = 'tm$User.edit:fieldGroup';

select create_or_update_sec_permission('SimpleUser', 'tm$User.edit:fieldGroupLeft', 50, 1)^
select create_or_update_sec_permission('SimpleUser', 'tm$User.edit:fieldGroupRight', 50, 1)^
