-- $Id$

create table DF_ACCOUNT_DOC (
    CARD_ID varchar2(32 char),
    primary key (CARD_ID)
)^

alter table DF_ACCOUNT_DOC add constraint FK_DF_ACCOUNT_DOC_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^