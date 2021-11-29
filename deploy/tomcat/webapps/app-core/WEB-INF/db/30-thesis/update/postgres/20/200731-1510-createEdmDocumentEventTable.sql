CREATE TABLE TS_EDM_DOCUMENT_EVENT (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    VERSION integer,
    ---
	EDM_EVENT_ID varchar(255),
    EDM_MESSAGE_ID varchar(255),
    EDM_ENTITY_ID varchar(255),
    EDM_DOCUMENT_EVENT_TYPE integer,
    BOX_ID varchar(255),
	EVENT_DATE timestamp,
    primary key(ID)
)^

create index IDX_EDM_DOC_EVENT_CREATE_TS on TS_EDM_DOCUMENT_EVENT (CREATE_TS)^
create index IDX_EDM_DOC_EVENT_MSG_ENT on TS_EDM_DOCUMENT_EVENT(EDM_MESSAGE_ID, EDM_ENTITY_ID)^