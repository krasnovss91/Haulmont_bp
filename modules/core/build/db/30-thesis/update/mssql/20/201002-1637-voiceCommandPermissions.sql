exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='ts$ComplexVoiceCommand.browse', @p_type=10, @p_value=0^
exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='ts$VoiceCommandSynonym.browse', @p_type=10, @p_value=0^

exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='ts$ComplexVoiceCommand:create', @p_type=20, @p_value=0^
exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='ts$ComplexVoiceCommand:update', @p_type=20, @p_value=0^
exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='ts$ComplexVoiceCommand:delete', @p_type=20, @p_value=0^

