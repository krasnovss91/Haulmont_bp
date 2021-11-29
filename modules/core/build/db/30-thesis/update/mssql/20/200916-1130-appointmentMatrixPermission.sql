exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='appointmentSettingsWindow', @p_type=10, @p_value=0^
exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='am$AppointmentType.browse', @p_type=10, @p_value=0^
exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='am$Appointment.browse', @p_type=10, @p_value=0^
exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='am$AppointmentScript.browse', @p_type=10, @p_value=0^