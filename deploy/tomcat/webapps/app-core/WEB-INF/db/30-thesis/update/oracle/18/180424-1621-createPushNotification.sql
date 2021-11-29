-- $Id$

create table TS_PUSH_NOTIFICATION (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    MESSAGE varchar2(600 char),
    PUSH_TYPE varchar2(25 char),
    STATUS integer,
    MOBILE_DEVICE_ID varchar2(32 char),
    primary key (ID)
)^

alter table TS_PUSH_NOTIFICATION add constraint FK_TS_PUSH_NOT_MOBILE_DEVICE foreign key (MOBILE_DEVICE_ID) references TS_MOBILE_DEVICE(ID)^
