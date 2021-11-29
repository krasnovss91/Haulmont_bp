create table TS_CARD_ADDITIONAL_INFO (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    CARD_ID uuid,
    LAST_ASSIGNMENT_UPDATE_DATE timestamp,
    LAST_CARD_ROLES_UPDATE_DATE timestamp,
    primary key (ID)
)^

alter table TS_CARD_ADDITIONAL_INFO add constraint FK_TS_CARD_ADDIT_INFO_WF_CARD foreign key (CARD_ID) references WF_CARD(ID)^
create index IDX_TS_CARD_ADDIT_INFO_CARD_ID on TS_CARD_ADDITIONAL_INFO (CARD_ID)^
