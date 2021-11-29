create table TS_SEARCH_FOLDER_TS_ROLE (
    FOLDER_ID varchar2(32 char),
    ROLE_ID varchar2(32 char)
)^

alter table TS_SEARCH_FOLDER_TS_ROLE add constraint FK_SEARCH_FOLDER_ROLE_FOLDER foreign key (FOLDER_ID) references SEC_SEARCH_FOLDER(FOLDER_ID)^
alter table TS_SEARCH_FOLDER_TS_ROLE add constraint FK_SEARCH_FOLDER_ROLE_ROLE foreign key (ROLE_ID) references SEC_ROLE(ID)^

create index IDX_TS_SEARCH_FOLDER_TS_ROLE on TS_SEARCH_FOLDER_TS_ROLE (FOLDER_ID)^