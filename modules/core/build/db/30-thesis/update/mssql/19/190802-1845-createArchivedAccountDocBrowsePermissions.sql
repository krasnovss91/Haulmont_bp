-- $Id$

exec create_or_update_sec_permissi @r_name='SimpleUser', @p_target='ts$ArchivedAccountDoc.browse', @p_type=10, @p_value=0^
exec create_or_update_sec_permissi @r_name='doc_secretary', @p_target='ts$ArchivedAccountDoc.browse', @p_type=10, @p_value=1^
exec create_or_update_sec_permissi @r_name='Archivist', @p_target='ts$ArchivedAccountDoc.browse', @p_type=10, @p_value=1^
exec create_or_update_sec_permissi @r_name='Archive access', @p_target='ts$ArchivedAccountDoc.browse', @p_type=10, @p_value=1^
exec create_or_update_sec_permissi @r_name='Administrators', @p_target='ts$ArchivedAccountDoc.browse', @p_type=10, @p_value=1^