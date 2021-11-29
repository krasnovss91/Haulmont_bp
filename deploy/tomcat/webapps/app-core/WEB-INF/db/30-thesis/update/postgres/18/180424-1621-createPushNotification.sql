-- $Id$

create table TS_PUSH_NOTIFICATION (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    MESSAGE varchar(600),
    PUSH_TYPE varchar(25),
    STATUS integer,
    MOBILE_DEVICE_ID uuid,
    primary key (ID)
);

alter table TS_PUSH_NOTIFICATION add constraint FK_TS_PUSH_NOT_MOBILE_DEVICE foreign key (MOBILE_DEVICE_ID) references TS_MOBILE_DEVICE(ID);
