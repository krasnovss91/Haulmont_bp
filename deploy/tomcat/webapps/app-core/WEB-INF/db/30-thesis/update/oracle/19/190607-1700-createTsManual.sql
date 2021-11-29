create table TS_MANUAL(
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),

    NAME_ varchar2(50 char),
    FILE_ID varchar2(32 char),
    CREATOR_ID varchar2(32 char),
    COMMENT_ varchar2(500 char),
    CREATE_DATE timestamp,

    primary key (ID)
)^

alter table TS_MANUAL add constraint FK_TS_MANUAL_FILE_ID foreign key (FILE_ID) references SYS_FILE(ID)^
alter table TS_MANUAL add constraint FK_TS_MANUAL_CREATOR_ID foreign key (CREATOR_ID) references SEC_USER(ID)^

create index IDX_TS_MANUAL_FILE_ID on TS_MANUAL (FILE_ID)^
create index IDX_TS_MANUAL_CREATOR_ID on TS_MANUAL (CREATOR_ID)^