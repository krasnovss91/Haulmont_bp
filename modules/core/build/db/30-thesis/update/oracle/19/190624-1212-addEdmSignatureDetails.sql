CREATE TABLE TS_EDM_SIGNATURE_DETAILS (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer,
    ---
    SIGNER_ID varchar2(32 char),
    CARD_ID varchar2(32 char),
    ATTACHMENT_ID varchar2(32 char),
    PATCHED_CONTENT_ID clob,
    SIGNATURE clob,
    primary key(ID)
)^

create index IDX_TS_EDM_SIGN_DET_SIGNER_ID on TS_EDM_SIGNATURE_DETAILS(SIGNER_ID)^
create index IDX_TS_EDM_SIGN_DET_CARD_ID on TS_EDM_SIGNATURE_DETAILS(CARD_ID)^
create index IDX_TS_EDM_SIGN_DET_ATT_ID on TS_EDM_SIGNATURE_DETAILS(ATTACHMENT_ID)^

alter table TS_EDM_SIGNATURE_DETAILS add constraint TS_EDM_SIGN_DET_SIGNER foreign key (SIGNER_ID) references SEC_USER(ID)^
alter table TS_EDM_SIGNATURE_DETAILS add constraint TS_EDM_SIGN_DET_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TS_EDM_SIGNATURE_DETAILS add constraint TS_EDM_SIGN_DET_ATTACHMENT foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID)^
