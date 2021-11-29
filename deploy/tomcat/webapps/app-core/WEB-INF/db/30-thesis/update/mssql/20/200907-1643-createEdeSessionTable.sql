CREATE TABLE TS_EDE_SESSION (
    ID uniqueidentifier,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),
    VERSION integer,
    INITIATOR_ID uniqueidentifier,
    SUBSTITUTED_INITIATOR_ID uniqueidentifier,
    ATTACHMENT_ID uniqueidentifier,
    EDE_FILE_REV_ID uniqueidentifier,
    EDE_SESSION_TYPE integer,
    EDE_SESSION_STATE integer,
    primary key nonclustered(ID)
)^

create clustered index IDX_EDE_SESSION_CREATE_TS on TS_EDE_SESSION (CREATE_TS)^

alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_INITIATOR foreign key (INITIATOR_ID) references SEC_USER(ID)^
alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_SUBST_INITIATOR foreign key (SUBSTITUTED_INITIATOR_ID) references SEC_USER(ID)^
alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_SUBST_ATTACH foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID)^
alter table TS_EDE_SESSION add constraint FK_EDE_SESSION_EDE_FILE_REV_ID foreign key (EDE_FILE_REV_ID) references TS_EDE_FILE_REVISION(ID)^

create index IDX_EDE_SESSION_ATTACHMENT on TS_EDE_SESSION(ATTACHMENT_ID)^
