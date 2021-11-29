-- $Id$

--remove account doc update deny permission for SimpleUser role
delete from SEC_PERMISSION where TARGET = 'df$AccountDoc:update' and ROLE_ID = '96fa7fe9397d4bacb14aeec2d94de68c'^