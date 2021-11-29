-- $Id$

create table TS_MOBILE_CLIENT_ACTION_LOG (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    --
    USER_ID varchar2(32 char),
    --
    primary key (ID)
) ^