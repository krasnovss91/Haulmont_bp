-- $Id$

create table TS_MOBILE_DEVICE (
    ID varchar2(32 char) not null,
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    --
    IMEI varchar2(64 char),
    DEVICE_ID varchar2(64 char),
    OS_ID varchar2(64 char),
    OS_VERSION varchar2(64 char),
    APP_ID varchar2(100 char),
    APP_VERSION varchar2(10 char),
    MOBILE_DEVICE_TYPE varchar2(20 char),
    USER_ID varchar2(32 char),
    NOTIFICATION_TOKEN varchar2(255 char),
    primary key (ID)
)^

alter table TS_MOBILE_DEVICE add constraint FK_TS_MOBILE_DEVICE_USER foreign key (USER_ID) references SEC_USER(ID)^
create index IDX_TS_MOB_DEVICE_DEVICE_ID on TS_MOBILE_DEVICE (DEVICE_ID)^