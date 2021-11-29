CREATE TABLE TS_EDE_CONNECTION (
    ID varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer,
    SESSION_ID varchar2(50 char),
    USER_ID varchar2(50 char),
    SUBSTITUTED_USER_ID varchar2(50 char),
    USER_SESSION_ID varchar2(50 char),
    CONNECTION_STATE integer,
    primary key(ID)
)^

alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_SESSION foreign key (SESSION_ID) references TS_EDE_SESSION(ID)^
alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_USER foreign key (USER_ID) references SEC_USER(ID)^
alter table TS_EDE_CONNECTION add constraint FK_EDE_CONNECTION_SUBST_USER foreign key (SUBSTITUTED_USER_ID) references SEC_USER(ID)^

create index IDX_EDE_CONNECTION_SESSION on TS_EDE_CONNECTION(SESSION_ID)^
