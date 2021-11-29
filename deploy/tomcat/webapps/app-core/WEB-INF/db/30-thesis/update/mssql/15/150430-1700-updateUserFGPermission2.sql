--$Id$

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='sec$User:timeZone', @p_type=30, @p_value=1^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='sec$User:timeZoneAuto', @p_type=30, @p_value=1^