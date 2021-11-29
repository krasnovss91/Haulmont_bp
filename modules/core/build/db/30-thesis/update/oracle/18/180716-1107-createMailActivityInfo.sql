create table TS_MAIL_ACTIVITY_INFO (
    ID varchar2(32 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    VERSION number(10),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),

    PROC_ID varchar2(32 char),
    ACTIVITY_NAME varchar(255),
    MAIL_ENABLED char(1),

    primary key (ID),
    foreign key (PROC_ID) references WF_PROC (ID)
)^

create index IDX_TS_MAIL_ACT_INFO_PROC_ID on TS_MAIL_ACTIVITY_INFO (PROC_ID)^