--$Id$
create table TS_CALENDAR_LINK (
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    ID uniqueidentifier not null,
    VERSION integer,
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),
    USER_ID uniqueidentifier,
    ICS_NAME varchar(255),
    primary key (ID)
)^

alter table TS_CALENDAR_LINK add constraint FK_TS_CALENDAR_LINK_TO_SEC_USER
foreign key (USER_ID) references SEC_USER(ID)^