create table TS_MANUAL(
    ID uniqueidentifier,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),

    NAME_ varchar(50),
    FILE_ID uniqueidentifier,
    CREATOR_ID uniqueidentifier,
    COMMENT_ varchar(500),
    CREATE_DATE timestamp,

    primary key (ID)
)^

alter table TS_MANUAL add constraint FK_TS_MANUAL_FILE_ID foreign key (FILE_ID) references SYS_FILE(ID)^
alter table TS_MANUAL add constraint FK_TS_MANUAL_CREATOR_ID foreign key (CREATOR_ID) references SEC_USER(ID)^

create index IDX_TS_MANUAL_FILE_ID on TS_MANUAL (FILE_ID)^
create index IDX_TS_MANUAL_CREATOR_ID on TS_MANUAL (CREATOR_ID)^