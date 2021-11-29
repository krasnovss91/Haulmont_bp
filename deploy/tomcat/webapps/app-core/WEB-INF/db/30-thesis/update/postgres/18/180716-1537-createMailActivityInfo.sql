create table TS_MAIL_ACTIVITY_INFO (
      ID uuid not null,
      CREATE_TS timestamp,
      CREATED_BY varchar(50),
      VERSION integer,
      UPDATE_TS timestamp,
      UPDATED_BY varchar(50),
      DELETE_TS timestamp,
      DELETED_BY varchar(50),

      PROC_ID uuid,
      ACTIVITY_NAME varchar(255),
      MAIL_ENABLED boolean,

      primary key (ID),
      foreign key (PROC_ID) references WF_PROC (ID)
)^

create index IDX_TS_MAIL_ACTIVITY_INFO_PROC_ID on TS_MAIL_ACTIVITY_INFO (PROC_ID)^