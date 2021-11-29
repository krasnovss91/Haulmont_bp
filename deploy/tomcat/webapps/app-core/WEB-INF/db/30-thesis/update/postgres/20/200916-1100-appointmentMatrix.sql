create or replace function create_appointment_table() returns void as
$$
begin
    if not exists(select * from information_schema.columns
        where
            table_catalog = current_database() and table_schema = current_schema()
            and upper(table_name) = 'AM_CONDITION')
    then
        create table AM_CONDITION (
            ID uuid,
            CREATE_TS timestamp,
            CREATED_BY varchar(50),
            VERSION integer,
            UPDATE_TS timestamp,
            UPDATED_BY varchar(50),
            DELETE_TS timestamp,
            DELETED_BY varchar(50),
            --
            OPERATION varchar(50),
            PROPERTY varchar(255),
            APPOINTMENT_TYPE_ID uuid,
            SORT_ORDER integer,
            --
            primary key (ID)
        );

        create table AM_CONDITION_VALUE (
            ID uuid,
            CREATE_TS timestamp,
            CREATED_BY varchar(50),
            VERSION integer,
            UPDATE_TS timestamp,
            UPDATED_BY varchar(50),
            DELETE_TS timestamp,
            DELETED_BY varchar(50),
            --
            VAL text,
            ENTITY_INSTANCE_NAME text,
            APPOINTMENT_ID uuid,
            CONDITION_ID uuid,
            --
            primary key (ID)
        );

        create table AM_APPOINTMENT (
            ID uuid,
            CREATE_TS timestamp,
            CREATED_BY varchar(50),
            VERSION integer,
            UPDATE_TS timestamp,
            UPDATED_BY varchar(50),
            DELETE_TS timestamp,
            DELETED_BY varchar(50),
            --
            APPOINTMENT_TYPE_ID uuid,
            ORDER_VALUE integer,
            CONDITION_SCRIPT_ID uuid,
            PARTICIPANT_SCRIPT_ID uuid,
            --
            primary key (ID)
        );

        create table AM_APPOINTMENT_SCRIPT (
            ID uuid,
            CREATE_TS timestamp,
            CREATED_BY varchar(50),
            VERSION integer,
            UPDATE_TS timestamp,
            UPDATED_BY varchar(50),
            DELETE_TS timestamp,
            DELETED_BY varchar(50),
            --
            SCRIPT_NAME varchar(255),
            SCRIPT_TEXT text,
            --
            primary key (ID)
        );

        create table AM_APPOINTMENT_LOG (
            ID uuid,
            CREATE_TS timestamp,
            CREATED_BY varchar(50),
            --
            LOG text,
            CARD_ID uuid,
            --
            primary key (ID)
        );

        create table AM_APPOINTMENT_USER (
            ID uuid,
            CREATE_TS timestamp,
            CREATED_BY varchar(50),
            VERSION integer,
            UPDATE_TS timestamp,
            UPDATED_BY varchar(50),
            DELETE_TS timestamp,
            DELETED_BY varchar(50),
            --
            USER_ID uuid,
            SORT_ORDER integer,
            APPOINTMENT_ID uuid,
            DURATION integer,
            TIME_UNIT varchar(50),
            --
            primary key (ID)
        );

        create table AM_APPOINTMENT_TYPE (
            ID uuid,
            CREATE_TS timestamp,
            CREATED_BY varchar(50),
            VERSION integer,
            UPDATE_TS timestamp,
            UPDATED_BY varchar(50),
            DELETE_TS timestamp,
            DELETED_BY varchar(50),
            --
            NAME varchar(255),
            ENTITY_NAME varchar(255),
            COMMENT_ varchar(500),
            PROC_ROLE_ID uuid,
            --
            primary key (ID)
        );

        create table AM_APPOINTMENT_CARD_ROLE_INFO (
            ID uuid,
            CREATE_TS timestamp,
            CREATED_BY varchar(50),
            --
            CARD_ROLE_ID uuid not null,
            --
            primary key (ID)
        );

        alter table AM_CONDITION add constraint FK_AM_CONDITION_APPOINTMENT_TYPE_ID foreign key (APPOINTMENT_TYPE_ID) references AM_APPOINTMENT_TYPE(ID);
        create index IDX_AM_CONDITION_APPOINTMENT_TYPE on AM_CONDITION (APPOINTMENT_TYPE_ID);

        alter table AM_CONDITION_VALUE add constraint FK_AM_CONDITION_VALUE_APPOINTMENT_ID foreign key (APPOINTMENT_ID) references AM_APPOINTMENT(ID);
        alter table AM_CONDITION_VALUE add constraint FK_AM_CONDITION_VALUE_CONDITION_ID foreign key (CONDITION_ID) references AM_CONDITION(ID);
        create index IDX_AM_CONDITION_VALUE_APPOINTMENT on AM_CONDITION_VALUE (APPOINTMENT_ID);
        create index IDX_AM_CONDITION_VALUE_CONDITION on AM_CONDITION_VALUE (CONDITION_ID);

        alter table AM_APPOINTMENT add constraint FK_AM_APPOINTMENT_APPOINTMENT_TYPE_ID foreign key (APPOINTMENT_TYPE_ID) references AM_APPOINTMENT_TYPE(ID);
        alter table AM_APPOINTMENT add constraint FK_AM_APPOINTMENT_CONDITION_SCRIPT_ID foreign key (CONDITION_SCRIPT_ID) references AM_APPOINTMENT_SCRIPT(ID);
        alter table AM_APPOINTMENT add constraint FK_AM_APPOINTMENT_PARTICIPANT_SCRIPT_ID foreign key (PARTICIPANT_SCRIPT_ID) references AM_APPOINTMENT_SCRIPT(ID);
        create index IDX_AM_APPOINTMENT_PARTICIPANT_SCRIPT on AM_APPOINTMENT (PARTICIPANT_SCRIPT_ID);
        create index IDX_AM_APPOINTMENT_CONDITION_SCRIPT on AM_APPOINTMENT (CONDITION_SCRIPT_ID);
        create index IDX_AM_APPOINTMENT_APPOINTMENT_TYPE on AM_APPOINTMENT (APPOINTMENT_TYPE_ID);

        alter table AM_APPOINTMENT_USER add constraint FK_AM_APPOINTMENT_USER_USER_ID foreign key (USER_ID) references SEC_USER(ID);
        alter table AM_APPOINTMENT_USER add constraint FK_AM_APPOINTMENT_USER_APPOINTMENT_ID foreign key (APPOINTMENT_ID) references AM_APPOINTMENT(ID);
        create index IDX_AM_APPOINTMENT_USER_USER on AM_APPOINTMENT_USER (USER_ID);
        create index IDX_AM_APPOINTMENT_USER_APPOINTMENT on AM_APPOINTMENT_USER (APPOINTMENT_ID);

        alter table AM_APPOINTMENT_TYPE add constraint FK_AM_APPOINTMENT_TYPE_PROC_ROLE_ID foreign key (PROC_ROLE_ID) references WF_PROC_ROLE(ID);
        create index IDX_AM_APPOINTMENT_TYPE_PROC_ROLE on AM_APPOINTMENT_TYPE (PROC_ROLE_ID);

        alter table AM_APPOINTMENT_CARD_ROLE_INFO add constraint FK_CARD_ROLE_INFO_CARD_ROLE_ID foreign key (CARD_ROLE_ID) references WF_CARD_ROLE(ID);
        create index IDX_CARD_ROLE_INFO_CARD_ROLE on AM_APPOINTMENT_CARD_ROLE_INFO (CARD_ROLE_ID);
	end if;
end;
$$
language 'plpgsql';
^
select create_appointment_table();
^
drop function create_appointment_table();