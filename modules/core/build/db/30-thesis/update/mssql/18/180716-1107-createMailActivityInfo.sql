create table TS_MAIL_ACTIVITY_INFO (
    ID uniqueidentifier not null,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),

    PROC_ID uniqueidentifier,
    ACTIVITY_NAME varchar(255),
    MAIL_ENABLED tinyint,

    primary key (ID),
    foreign key (PROC_ID) references WF_PROC (ID)
)^

create index IDX_TS_MAIL_ACTIVITY_INFO_PROC_ID on TS_MAIL_ACTIVITY_INFO (PROC_ID)^