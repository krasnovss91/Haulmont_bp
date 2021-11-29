-- $Id$

create table TS_MOBILE_CLIENT_CARD_METADATA (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    ENTITY_NAME varchar(255),
    NAME varchar(255),
    PROPERTIES text,
    primary key (ID)
);