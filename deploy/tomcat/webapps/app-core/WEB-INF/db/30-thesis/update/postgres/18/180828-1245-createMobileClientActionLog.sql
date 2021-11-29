-- $Id$

create table TS_MOBILE_CLIENT_ACTION_LOG (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    --
    USER_ID uuid,
    --
    primary key (ID)
);