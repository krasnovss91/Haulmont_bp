-- $Id$

create table TS_MOBILE_DEVICE (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    IMEI varchar(64),
    DEVICE_ID varchar(64),
    OS_ID varchar(64),
    OS_VERSION varchar(64),
    APP_ID varchar(100),
    APP_VERSION varchar(10),
    MOBILE_DEVICE_TYPE varchar(20),
    USER_ID uuid,
    NOTIFICATION_TOKEN varchar(255),
    primary key (ID)
);

alter table TS_MOBILE_DEVICE add constraint FK_TS_MOBILE_DEVICE_USER foreign key (USER_ID) references SEC_USER(ID);
create index IDX_TS_MOB_DEVICE_DEVICE_ID on TS_MOBILE_DEVICE (DEVICE_ID) where DELETE_TS is null;