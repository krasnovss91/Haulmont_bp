-- $Id$
-- Description:

create table TS_CALENDAR_EVENT_ITEM (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    START_TIME timestamp,
    DUE_DATE timestamp,
    CARD_ID uuid,
    PARENT_ENTITY_NAME varchar(100),
    PARENT_ENTITY_ID varchar(100),
    primary key (ID)
);
alter table TS_CALENDAR_EVENT_ITEM add constraint FK_TS_CALENDAR_EVENT_ITEM_TO_WF_CARD foreign key (CARD_ID) references WF_CARD(ID);

create index IDX_TS_CALENDAR_EVENT_ITEM_PARENT_ENTITY_ID on TS_CALENDAR_EVENT_ITEM (PARENT_ENTITY_ID);

^

create table TS_CALENDAR_EVENT_PARTICIPANT (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    USER_ID uuid,
    CALENDAR_EVENT_ITEM_ID uuid,
    primary key (ID)
);
alter table TS_CALENDAR_EVENT_PARTICIPANT add constraint FK_TS_CALENDAR_EVENT_PARTICIPANT_TO_SEC_USER foreign key (USER_ID) references SEC_USER(ID);
alter table TS_CALENDAR_EVENT_PARTICIPANT add constraint FK_TS_CALENDAR_EVENT_PARTICIPANT_TO_CALENDAR_EVENT_ITEM
    foreign key (CALENDAR_EVENT_ITEM_ID) references TS_CALENDAR_EVENT_ITEM(ID);