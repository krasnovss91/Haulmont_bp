CREATE TABLE TS_EDM_DOCUMENT_EVENT (
    ID varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer,
    ---
	EDM_EVENT_ID varchar2(255 char),
    EDM_MESSAGE_ID varchar2(255 char),
    EDM_ENTITY_ID varchar2(255 char),
    EDM_DOCUMENT_EVENT_TYPE integer,
    BOX_ID varchar2(255 char),
    EVENT_DATE timestamp,
    primary key(ID)
)^

create index IDX_EDM_DOC_EVENT_CREATE_TS on TS_EDM_DOCUMENT_EVENT (CREATE_TS)^
create index IDX_EDM_DOC_EVENT_MSG_ENT on TS_EDM_DOCUMENT_EVENT(EDM_MESSAGE_ID, EDM_ENTITY_ID)^