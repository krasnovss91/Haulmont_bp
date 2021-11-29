create table DF_PACKAGE_DOC (
    CARD_ID uniqueidentifier not null,
    LOCKED tinyint not null default 0,
    primary key nonclustered (CARD_ID),
    constraint FK_DF_PACKAGE_DOC_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)
)^
