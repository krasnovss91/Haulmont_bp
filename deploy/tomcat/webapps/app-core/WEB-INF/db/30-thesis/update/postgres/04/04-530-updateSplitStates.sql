--$Id$

update SEC_USER_SETTING set VALUE = replace(VALUE, 'false', 'true') where NAME = 'foldersState'^