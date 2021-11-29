-- $Id$
-- Description: update user group permissions

exec create_or_update_sec_permission @r_name='Administrators', @p_target='wf$UserGroup:create', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='wf$UserGroup:update', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='wf$UserGroup:delete', @p_type=20, @p_value=1^

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='wf$UserGroup:create', @p_type=20, @p_value=0^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='wf$UserGroup:update', @p_type=20, @p_value=0^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='wf$UserGroup:delete', @p_type=20, @p_value=0^