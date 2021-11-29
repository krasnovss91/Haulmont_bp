CREATE TABLE TS_EDE_FILE_REVISION (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    VERSION integer,
    FILE_ID uuid,
    IS_INITIAL boolean default false,
    primary key(ID)
)^

alter table TS_EDE_FILE_REVISION add constraint FK_EDE_FILE_REVISION_FILE_ID foreign key (FILE_ID) references SYS_FILE(ID)^
