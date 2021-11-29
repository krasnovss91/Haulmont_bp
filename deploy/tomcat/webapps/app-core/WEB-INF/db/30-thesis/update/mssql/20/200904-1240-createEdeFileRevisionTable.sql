CREATE TABLE TS_EDE_FILE_REVISION (
    ID uniqueidentifier,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),
    VERSION integer,
    FILE_ID uniqueidentifier,
    IS_INITIAL tinyint constraint TS_EDE_FILE_REV_IS_INIT_DEF default 0,
    primary key nonclustered(ID)
)^

create clustered index IDX_EDE_FILE_REV_CREATE_TS on TS_EDE_FILE_REVISION (CREATE_TS)^

alter table TS_EDE_FILE_REVISION add constraint FK_EDE_FILE_REVISION_FILE_ID foreign key (FILE_ID) references SYS_FILE(ID)^
