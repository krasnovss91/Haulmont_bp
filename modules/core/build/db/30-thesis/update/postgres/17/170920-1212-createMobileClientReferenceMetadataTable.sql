-- $Id$

create table TS_MOB_CLIENT_REF_METADATA (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    ENTITY_NAME varchar(255),
    primary key (ID)
);