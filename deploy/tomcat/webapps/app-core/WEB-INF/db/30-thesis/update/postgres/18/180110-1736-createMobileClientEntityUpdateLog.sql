-- $Id$
create table TS_MOB_CLIENT_ENTITY_UPD_LOG (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    ENTITY_NAME varchar(255),
    ENTITY_ID uuid,
    UPDATE_TS timestamp,
    primary key (ID)
) ^

CREATE INDEX IDX_MOB_ENT_UPD_LOG_ENT_NAME
  ON TS_MOB_CLIENT_ENTITY_UPD_LOG (ENTITY_NAME) ^
CREATE INDEX IDX_MOB_ENT_UPD_LOG_ENT_ID
  ON TS_MOB_CLIENT_ENTITY_UPD_LOG (ENTITY_ID) ^