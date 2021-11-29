CREATE TABLE TS_EDE_FILE_REVISION (
    ID varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer,
    FILE_ID varchar2(50 char),
    IS_INITIAL char(1) default 0,
    primary key(ID)
)^

alter table TS_EDE_FILE_REVISION add constraint FK_EDE_FILE_REVISION_FILE_ID foreign key (FILE_ID) references SYS_FILE(ID)^
