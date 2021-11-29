-- $Id$

exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='createOutgoingFormalizedDocumentWindow', @p_type=10, @p_value=0^
exec create_or_update_sec_permissi @r_name='Administrators', @p_target='createOutgoingFormalizedDocumentWindow', @p_type=10, @p_value=1^