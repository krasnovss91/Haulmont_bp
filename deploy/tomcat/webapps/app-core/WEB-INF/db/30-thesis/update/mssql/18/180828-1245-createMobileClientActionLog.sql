-- $Id$

create table TS_MOBILE_CLIENT_ACTION_LOG (
    ID uniqueidentifier not null,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    --
    USER_ID uniqueidentifier,
    --
    primary key (ID)
);