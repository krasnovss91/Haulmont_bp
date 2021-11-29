-- $Id$
-- Description:
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$DocKind.edit', @p_type=10, @p_value=0^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$DocType.edit', @p_type=10, @p_value=0^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='sec$Role.edit', @p_type=10, @p_value=0^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='tm$TaskType.edit', @p_type=10, @p_value=0^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='tm$TaskType.edit', @p_type=10, @p_value=1;