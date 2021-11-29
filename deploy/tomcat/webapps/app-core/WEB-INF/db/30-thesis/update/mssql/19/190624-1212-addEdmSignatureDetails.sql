CREATE TABLE TS_EDM_SIGNATURE_DETAILS (
    ID uniqueidentifier,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),
    VERSION integer,
    ---
    SIGNER_ID uniqueidentifier,
    CARD_ID uniqueidentifier,
    ATTACHMENT_ID uniqueidentifier,
    PATCHED_CONTENT_ID text,
    SIGNATURE text,
    primary key(ID)
)^

create index IDX_TS_EDM_SIGN_DET_SIGNER_ID on TS_EDM_SIGNATURE_DETAILS(SIGNER_ID)^
create index IDX_TS_EDM_SIGN_DET_CARD_ID on TS_EDM_SIGNATURE_DETAILS(CARD_ID)^
create index IDX_TS_EDM_SIGN_DET_ATT_ID on TS_EDM_SIGNATURE_DETAILS(ATTACHMENT_ID)^

alter table TS_EDM_SIGNATURE_DETAILS add constraint TS_EDM_SIGN_DET_SIGNER foreign key (SIGNER_ID) references SEC_USER(ID)^
alter table TS_EDM_SIGNATURE_DETAILS add constraint TS_EDM_SIGN_DET_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TS_EDM_SIGNATURE_DETAILS add constraint TS_EDM_SIGN_DET_ATTACHMENT foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID)^
