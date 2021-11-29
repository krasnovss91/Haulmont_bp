-- $Id$

create table TS_MOB_CLIENT_REF_METADATA (
    ID uniqueidentifier not null,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    ENTITY_NAME varchar(255),
    primary key (ID)
);