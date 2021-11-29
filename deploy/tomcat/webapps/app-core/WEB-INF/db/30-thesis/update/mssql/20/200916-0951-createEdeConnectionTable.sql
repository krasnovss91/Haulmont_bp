CREATE TABLE TS_EDE_CONNECTION (
    ID uniqueidentifier,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),
    VERSION integer,
    SESSION_ID uniqueidentifier,
    USER_ID uniqueidentifier,
    SUBSTITUTED_USER_ID uniqueidentifier,
    USER_SESSION_ID uniqueidentifier,
    CONNECTION_STATE integer,
    primary key nonclustered(ID)
)^

create clustered index IDX_EDE_CONNECTION_CREATE_TS on TS_EDE_CONNECTION (CREATE_TS)^

alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_SESSION foreign key (SESSION_ID) references TS_EDE_SESSION(ID)^
alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_USER foreign key (USER_ID) references SEC_USER(ID)^
alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_SUBST_USER foreign key (SUBSTITUTED_USER_ID) references SEC_USER(ID)^

create index IDX_EDE_CONNECTION_SESSION on TS_EDE_CONNECTION(SESSION_ID)^
