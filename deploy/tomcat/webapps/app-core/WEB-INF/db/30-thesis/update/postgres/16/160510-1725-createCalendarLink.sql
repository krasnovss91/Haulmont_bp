--$Id$
----- DF_CALENDAR_LINK creation -----
create table TS_CALENDAR_LINK (
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    ID uuid not null,
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    USER_ID uuid,
    ICS_NAME varchar(255),
    primary key (ID)
)^

alter table TS_CALENDAR_LINK add constraint FK_TS_CALENDAR_LINK_TO_SEC_USER
foreign key (USER_ID) references SEC_USER(ID)^

