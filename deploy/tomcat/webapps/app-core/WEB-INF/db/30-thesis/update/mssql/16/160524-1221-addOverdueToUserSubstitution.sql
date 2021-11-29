-- $Id$
-- Description:

alter table SEC_USER_SUBSTITUTION add OVERDUE tinyint^

update SEC_USER_SUBSTITUTION set OVERDUE=0 where OVERDUE is null^

update SEC_USER_SUBSTITUTION set OVERDUE=1 where END_DATE < CURRENT_TIMESTAMP^