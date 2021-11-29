CREATE TABLE TS_EDE_CONNECTION (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    VERSION integer,
    SESSION_ID uuid,
    USER_ID uuid,
    SUBSTITUTED_USER_ID uuid,
    USER_SESSION_ID uuid,
    CONNECTION_STATE integer,
    primary key(ID)
)^

alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_SESSION foreign key (SESSION_ID) references TS_EDE_SESSION(ID)^
alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_USER foreign key (USER_ID) references SEC_USER(ID)^
alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_SUBST_USER foreign key (SUBSTITUTED_USER_ID) references SEC_USER(ID)^

create index IDX_EDE_CONNECTION_SESSION on TS_EDE_CONNECTION(SESSION_ID)^
