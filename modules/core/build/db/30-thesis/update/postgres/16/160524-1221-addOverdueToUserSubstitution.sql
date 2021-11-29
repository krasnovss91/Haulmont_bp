-- $Id$
-- Description:

alter table SEC_USER_SUBSTITUTION add OVERDUE boolean^

update SEC_USER_SUBSTITUTION set OVERDUE=false where OVERDUE is null^

update SEC_USER_SUBSTITUTION set OVERDUE=true where END_DATE < current_timestamp^