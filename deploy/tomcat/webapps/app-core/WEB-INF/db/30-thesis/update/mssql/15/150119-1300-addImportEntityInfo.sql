--$Id$
--$Description:


create table TS_IMPORT_ENTITY_INFO (
    ID uniqueidentifier,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    IMPORT_ID uniqueidentifier,
    ENTITY_NAME varchar(100),
    ENTITY_ID uniqueidentifier,
    primary key (ID)
)^


create index IDX_TS_IMPORT_ENTITY_INFO_IMPORT_ID on TS_IMPORT_ENTITY_INFO (IMPORT_ID)^