create table TS_ACCEPTANCE_DATA(
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),

    CARD_ID uuid,
    RECEIVING_DATE timestamp,
    ACCEPTANCE_RESULT varchar(50),
    DISAGREEMENTS varchar(1000),
    ACCEPTED_BY varchar(255),
    LAST_NAME varchar(255),
    NAME_ varchar(255),
    PATRONYMIC varchar(255),
    POSITION_ varchar(255),
    ORGANIZATION varchar(255),
    SOURCE_OF_AUTHORITY varchar(1000),
    ORG_SOURCE_OF_AUTHORITY varchar(1000),
    OTHER_DATA varchar(1000),
    primary key (ID)
)^

alter table TS_ACCEPTANCE_DATA add constraint FK_TS_ACCEPTANCE_DATA_CARD_ID foreign key (CARD_ID) references WF_CARD(ID)^
create index IDX_TS_ACCEPTANCE_DATA_CARD_ID on TS_ACCEPTANCE_DATA (CARD_ID)^