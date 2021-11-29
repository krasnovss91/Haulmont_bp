--$Id$
--Description:

exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$Position:update', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$Position:delete', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$Position:read', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$Position:create', @p_type=20, @p_value=1 ^

exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$Position:update', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$Position:delete', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$Position:read', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$Position:create', @p_type=20, @p_value=1 ^

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$Position:update', @p_type=20, @p_value=0 ^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$Position:delete', @p_type=20, @p_value=0 ^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$Position:create', @p_type=20, @p_value=0 ^


