-- $Id$
-- Description:

alter table TS_CARD_ACL add INIT_ACCESS_CARD_ID uniqueidentifier;
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_INIT_CARD_ID foreign key (INIT_ACCESS_CARD_ID) references WF_CARD(ID);