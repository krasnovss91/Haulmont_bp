-- $Id$
-- Description:
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='tm$User.edit:fieldGroup', @p_type=50, @p_value=1^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='tm$User.edit:split', @p_type=50, @p_value=0^
