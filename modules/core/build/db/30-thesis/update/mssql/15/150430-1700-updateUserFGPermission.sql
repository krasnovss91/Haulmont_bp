--$Id$

delete from sec_permission where target = 'tm$User.edit:fieldGroup';

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='tm$User.edit:fieldGroupLeft', @p_type=50, @p_value=1^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='tm$User.edit:fieldGroupRight', @p_type=50, @p_value=1^
