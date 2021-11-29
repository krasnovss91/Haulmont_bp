--$Id$

update SEC_USER_SUBSTITUTION set NOTIFY_BY_CARD_INFO = false where NOTIFY_BY_CARD_INFO is null
^

update SEC_USER_SUBSTITUTION set NOTIFY_BY_EMAIL = false where NOTIFY_BY_EMAIL is null
^