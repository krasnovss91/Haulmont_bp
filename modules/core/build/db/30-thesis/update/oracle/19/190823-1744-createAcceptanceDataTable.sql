create table TS_ACCEPTANCE_DATA(
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),

    CARD_ID varchar2(32 char),
    RECEIVING_DATE timestamp,
    ACCEPTANCE_RESULT varchar2(50 char),
    DISAGREEMENTS varchar2(1000 char),
    ACCEPTED_BY varchar2(255 char),
    LAST_NAME varchar2(255 char),
    NAME_ varchar2(255 char),
    PATRONYMIC varchar2(255 char),
    POSITION_ varchar2(255 char),
    ORGANIZATION varchar2(255 char),
    SOURCE_OF_AUTHORITY varchar2(1000 char),
    ORG_SOURCE_OF_AUTHORITY varchar2(1000 char),
    OTHER_DATA varchar2(1000 char),
    primary key (ID)
)^

alter table TS_ACCEPTANCE_DATA add constraint FK_TS_ACCEPTANCE_DATA_CARD_ID foreign key (CARD_ID) references WF_CARD(ID)^
create index IDX_TS_ACCEPTANCE_DATA_CARD_ID on TS_ACCEPTANCE_DATA (CARD_ID)^