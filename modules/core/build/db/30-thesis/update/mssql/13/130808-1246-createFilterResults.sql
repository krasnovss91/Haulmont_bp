-- $Id$
-- Description

create table TS_FILTER_RESULT (
    ID bigint identity not null,
    SESSION_ID uniqueidentifier not null,
    FILTER_KEY integer not null,
    ENTITY_ID uniqueidentifier,
    --
    primary key (ID)
)^

create index IDX_TS_FILTER_RESULT_ENTITY_FIELD_NAME_SESSION_KEY on TS_FILTER_RESULT (ENTITY_ID, SESSION_ID, FILTER_KEY);

create index IDX_TS_FILTER_RESULT_SESSION_KEY on TS_FILTER_RESULT (SESSION_ID, FILTER_KEY);
