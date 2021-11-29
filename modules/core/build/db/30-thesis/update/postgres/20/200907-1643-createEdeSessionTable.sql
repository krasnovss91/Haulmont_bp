CREATE TABLE TS_EDE_SESSION (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    VERSION integer,
    INITIATOR_ID uuid,
    SUBSTITUTED_INITIATOR_ID uuid,
    ATTACHMENT_ID uuid,
    EDE_FILE_REV_ID uuid,
    EDE_SESSION_TYPE integer,
    EDE_SESSION_STATE integer,
    primary key(ID)
)^

alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_INITIATOR foreign key (INITIATOR_ID) references SEC_USER(ID)^
alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_SUBST_INITIATOR foreign key (SUBSTITUTED_INITIATOR_ID) references SEC_USER(ID)^
alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_SUBST_ATTACH foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID)^
alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_EDE_FILE_REV_ID foreign key (EDE_FILE_REV_ID) references TS_EDE_FILE_REVISION(ID)^

create index IDX_EDE_SESSION_ATTACHMENT on TS_EDE_SESSION(ATTACHMENT_ID)^
