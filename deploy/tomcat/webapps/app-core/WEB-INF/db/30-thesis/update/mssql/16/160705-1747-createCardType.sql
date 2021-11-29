-- $Id$
-- Description:

EXEC sp_rename 'DF_DOC_TYPE', 'TS_CARD_TYPE';

update sec_permission set target = 'ts$CardType:delete' where target = 'df$DocType:delete';
update sec_permission set target = 'ts$CardType:create' where target = 'df$DocType:create';
update sec_permission set target = 'ts$CardType.browse' where target = 'df$DocType.browse';
update sec_permission set target = 'ts$CardType.edit' where target = 'df$DocType.edit';