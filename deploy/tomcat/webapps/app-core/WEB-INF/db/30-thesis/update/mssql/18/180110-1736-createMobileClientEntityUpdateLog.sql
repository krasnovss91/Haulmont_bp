-- $Id$
create table TS_MOB_CLIENT_ENTITY_UPD_LOG (
    ID uniqueidentifier not null,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    ENTITY_NAME varchar(255),
    ENTITY_ID uniqueidentifier,
    UPDATE_TS datetime,
    primary key (ID)
) ^

CREATE INDEX IDX_MOB_ENT_UPD_LOG_ENT_NAME
  ON TS_MOB_CLIENT_ENTITY_UPD_LOG (ENTITY_NAME) ^
CREATE INDEX IDX_MOB_ENT_UPD_LOG_ENT_ID
  ON TS_MOB_CLIENT_ENTITY_UPD_LOG (ENTITY_ID) ^