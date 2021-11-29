--$Id$
--$Description:

update sec_permission set target='sys$' + substring(target, 6, len(target)) where target like 'core$%'