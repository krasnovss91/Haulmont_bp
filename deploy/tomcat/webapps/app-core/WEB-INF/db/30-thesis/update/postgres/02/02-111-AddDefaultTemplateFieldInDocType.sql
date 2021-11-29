-- $Id$
-- Description:

alter table DF_DOC_TYPE add DOC_TEMPLATE_ID uuid^
alter table DF_DOC_TYPE add constraint FK_DF_DOC_TYPE_TEMPLATE foreign key (DOC_TEMPLATE_ID) references DF_DOC(CARD_ID)^
