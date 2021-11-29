create table TS_CARD_ADDITIONAL_INFO (
    ID uniqueidentifier not null,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    CARD_ID uniqueidentifier,
    LAST_ASSIGNMENT_UPDATE_DATE datetime,
    LAST_CARD_ROLES_UPDATE_DATE datetime,
    primary key nonclustered (ID),
	constraint FK_TS_CARD_ADDIT_INFO_WF_CARD foreign key (CARD_ID) references WF_CARD(ID)
)^

create clustered index IDX_TS_CARD_ADDITIONAL_INFO_CREATE_TS on TS_CARD_ADDITIONAL_INFO (CREATE_TS)^
create index IDX_TS_CARD_ADDIT_INFO_CARD_ID on TS_CARD_ADDITIONAL_INFO (CARD_ID)^