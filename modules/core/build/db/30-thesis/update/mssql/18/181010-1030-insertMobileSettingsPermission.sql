-- $Id$

delete from SEC_PERMISSION where ROLE_ID = (select ID from SEC_ROLE where NAME = 'Administrators') and TARGET = 'thesis.mobileSettings.edit'^

exec create_or_update_sec_permissi @r_name='Administrators', @p_target='thesis.mobileSettings.edit', @p_type=40, @p_value=1^
