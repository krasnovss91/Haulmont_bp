--roles permissions
exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='df$PackageDoc:create', @p_type=20, @p_value=0^
exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='df$PackageDoc:delete', @p_type=20, @p_value=0^
exec create_or_update_sec_permissi @r_name='doc_initiator', @p_target='df$PackageDoc:create', @p_type=20, @p_value=1^
exec create_or_update_sec_permissi @r_name='doc_initiator', @p_target='df$PackageDoc:update', @p_type=20, @p_value=1^
exec create_or_update_sec_permissi @r_name='doc_initiator', @p_target='df$PackageDoc:delete', @p_type=20, @p_value=1^
exec create_or_update_sec_permissi @r_name='Administrators', @p_target='df$PackageDoc:create', @p_type=20, @p_value=1^
exec create_or_update_sec_permissi @r_name='Administrators', @p_target='df$PackageDoc:update', @p_type=20, @p_value=1^
exec create_or_update_sec_permissi @r_name='Administrators', @p_target='df$PackageDoc:delete', @p_type=20, @p_value=1^
