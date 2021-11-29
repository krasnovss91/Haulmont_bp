--$Id$
--$Description:

update sec_permission set target='sys$' || substring(target from 6) where target like 'core$%'