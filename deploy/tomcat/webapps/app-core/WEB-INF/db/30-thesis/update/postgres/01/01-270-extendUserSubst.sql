-- $Id$
-- Description:

alter table SEC_USER_SUBSTITUTION add NOTIFY_BY_CARD_INFO boolean
^

update SEC_USER_SUBSTITUTION set NOTIFY_BY_CARD_INFO = false
^
