create table DF_PACKAGE_DOC (
    CARD_ID uuid,
    LOCKED boolean not null default false,
    primary key (CARD_ID)
)^

alter table DF_PACKAGE_DOC add constraint FK_DF_PACKAGE_DOC_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^
