-- $Id$

--remove account doc update deny permission for SimpleUser role
delete from SEC_PERMISSION where TARGET = 'df$AccountDoc:update' and ROLE_ID = '96fa7fe9-397d-4bac-b14a-eec2d94de68c'^