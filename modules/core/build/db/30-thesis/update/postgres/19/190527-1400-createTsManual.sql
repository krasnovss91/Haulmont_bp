create table TS_MANUAL(
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),

    NAME varchar(50),
    FILE_ID uuid,
    CREATOR_ID uuid,
    COMMENT varchar(500),
    CREATE_DATE timestamp,

    primary key (ID)

)^

alter table TS_MANUAL add constraint FK_TS_MANUAL_FILE_ID foreign key (FILE_ID) references SYS_FILE(ID)^
alter table TS_MANUAL add constraint FK_TS_MANUAL_CREATOR_ID foreign key (CREATOR_ID) references SEC_USER(ID)^
create index IDX_TS_MANUAL_FILE_ID on TS_MANUAL (FILE_ID)^
create index IDX_TS_MANUAL_CREATOR_ID on TS_MANUAL (CREATOR_ID)^