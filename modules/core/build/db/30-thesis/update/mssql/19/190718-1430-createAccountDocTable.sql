-- $Id$

create table DF_ACCOUNT_DOC (
    CARD_ID uniqueidentifier not null,
    primary key nonclustered  (CARD_ID),
	constraint FK_DF_ACCOUNT_DOC_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)
)^