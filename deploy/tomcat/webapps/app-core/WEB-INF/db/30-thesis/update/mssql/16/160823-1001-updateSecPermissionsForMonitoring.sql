-- $Id$
-- Description:

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='performanceStatistics', @p_type=10, @p_value=0^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='screenProfiler', @p_type=10, @p_value=0^
