-- $Id$

delete from SEC_PERMISSION where ROLE_ID = (select ID from SEC_ROLE where NAME = 'Administrators') and TARGET = 'thesis.mobileSettings.edit'^

select create_or_update_sec_permissi('Administrators', 'thesis.mobileSettings.edit', 40, 1) from dual^