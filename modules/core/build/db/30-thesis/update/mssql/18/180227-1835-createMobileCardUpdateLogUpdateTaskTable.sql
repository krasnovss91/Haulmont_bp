-- $Id$

create table TS_MOB_CL_CARD_LOG_UPD_TASK (
    ID uniqueidentifier not null,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    CARD_ENTITY_NAME varchar(255),
    REFERENCE_ENTITY_PROPERTY_PATH varchar(1000),
    REFERENCE_ENTITY_ID uniqueidentifier,
    primary key (ID)
);