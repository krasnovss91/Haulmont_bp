create table DF_PACKAGE_DOC (
    CARD_ID varchar2(32 char),
    LOCKED char(1) default 0 not null,
    primary key (CARD_ID)
)^

alter table DF_PACKAGE_DOC add constraint FK_DF_PACKAGE_DOC_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^
