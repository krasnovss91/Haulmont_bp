--$Id$
--Description:
create table DF_SHORT_URL (
       ID uniqueidentifier,
       CREATE_TS datetime,
       CREATED_BY varchar(50),
       VERSION integer,
       UPDATE_TS datetime,
       UPDATED_BY varchar(50),
       DELETE_TS datetime,
       DELETED_BY varchar(50),

       LONG_URL varchar(1000),
       SHORT_URL varchar(100),

       primary key (ID)
  )^