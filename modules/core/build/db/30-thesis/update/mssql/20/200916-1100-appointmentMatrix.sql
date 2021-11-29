if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'AM_CONDITION')
begin
    -- begin AM_CONDITION
    create table AM_CONDITION (
        ID uniqueidentifier,
        CREATE_TS datetime2,
        CREATED_BY varchar(50),
        VERSION integer,
        UPDATE_TS datetime2,
        UPDATED_BY varchar(50),
        DELETE_TS datetime2,
        DELETED_BY varchar(50),
        --
        OPERATION varchar(50),
        PROPERTY varchar(255),
        APPOINTMENT_TYPE_ID uniqueidentifier,
        SORT_ORDER integer,
        --
        primary key nonclustered (ID)
    );
    -- end AM_CONDITION

    -- begin AM_CONDITION_VALUE
    create table AM_CONDITION_VALUE (
        ID uniqueidentifier,
        CREATE_TS datetime2,
        CREATED_BY varchar(50),
        VERSION integer,
        UPDATE_TS datetime2,
        UPDATED_BY varchar(50),
        DELETE_TS datetime2,
        DELETED_BY varchar(50),
        --
        VAL varchar(max),
        ENTITY_INSTANCE_NAME varchar(max),
        APPOINTMENT_ID uniqueidentifier,
        CONDITION_ID uniqueidentifier,
        --
        primary key nonclustered (ID)
    );
    -- end AM_CONDITION_VALUE

    -- begin AM_APPOINTMENT
    create table AM_APPOINTMENT (
        ID uniqueidentifier,
        CREATE_TS datetime2,
        CREATED_BY varchar(50),
        VERSION integer,
        UPDATE_TS datetime2,
        UPDATED_BY varchar(50),
        DELETE_TS datetime2,
        DELETED_BY varchar(50),
        --
        APPOINTMENT_TYPE_ID uniqueidentifier,
        ORDER_VALUE integer,
        CONDITION_SCRIPT_ID uniqueidentifier,
        PARTICIPANT_SCRIPT_ID uniqueidentifier,
        --
        primary key nonclustered (ID)
    );
    -- end AM_APPOINTMENT

    -- begin AM_APPOINTMENT_SCRIPT
    create table AM_APPOINTMENT_SCRIPT (
        ID uniqueidentifier,
        CREATE_TS datetime2,
        CREATED_BY varchar(50),
        VERSION integer,
        UPDATE_TS datetime2,
        UPDATED_BY varchar(50),
        DELETE_TS datetime2,
        DELETED_BY varchar(50),
        --
        SCRIPT_NAME varchar(255),
        SCRIPT_TEXT varchar(max),
        --
        primary key nonclustered (ID)
    );
    -- end AM_APPOINTMENT_SCRIPT

    -- begin AM_APPOINTMENT_LOG
    create table AM_APPOINTMENT_LOG (
        ID uniqueidentifier,
        CREATE_TS datetime2,
        CREATED_BY varchar(50),
        --
        LOG varchar(max),
        CARD_ID uniqueidentifier,
        --
        primary key nonclustered (ID)
    );
    -- end AM_APPOINTMENT_LOG

    -- begin AM_APPOINTMENT_USER
    create table AM_APPOINTMENT_USER (
        ID uniqueidentifier,
        CREATE_TS datetime2,
        CREATED_BY varchar(50),
        VERSION integer,
        UPDATE_TS datetime2,
        UPDATED_BY varchar(50),
        DELETE_TS datetime2,
        DELETED_BY varchar(50),
        --
        USER_ID uniqueidentifier,
        SORT_ORDER integer,
        APPOINTMENT_ID uniqueidentifier,
        DURATION integer,
        TIME_UNIT varchar(50),
        --
        primary key nonclustered (ID)
    );
    -- end AM_APPOINTMENT_USER

    -- begin AM_APPOINTMENT_TYPE
    create table AM_APPOINTMENT_TYPE (
        ID uniqueidentifier,
        CREATE_TS datetime2,
        CREATED_BY varchar(50),
        VERSION integer,
        UPDATE_TS datetime2,
        UPDATED_BY varchar(50),
        DELETE_TS datetime2,
        DELETED_BY varchar(50),
        --
        NAME varchar(255),
        ENTITY_NAME varchar(255),
        COMMENT_ varchar(500),
        PROC_ROLE_ID uniqueidentifier,
        --
        primary key nonclustered (ID)
    );
    -- end AM_APPOINTMENT_TYPE

    -- begin AM_APPOINTMENT_CARD_ROLE_INFO
    create table AM_APPOINTMENT_CARD_ROLE_INFO (
        ID uniqueidentifier,
        CREATE_TS datetime2,
        CREATED_BY varchar(50),
        --
        CARD_ROLE_ID uniqueidentifier not null,
        --
        primary key nonclustered (ID)
    );
    -- end AM_APPOINTMENT_CARD_ROLE_INFO

    -- begin AM_CONDITION
    alter table AM_CONDITION add constraint FK_AM_CONDITION_APPOINTMENT_TYPE_ID foreign key (APPOINTMENT_TYPE_ID) references AM_APPOINTMENT_TYPE(ID);
    create index IDX_AM_CONDITION_APPOINTMENT_TYPE on AM_CONDITION (APPOINTMENT_TYPE_ID);
    -- end AM_CONDITION

    -- begin AM_CONDITION_VALUE
    alter table AM_CONDITION_VALUE add constraint FK_AM_CONDITION_VALUE_APPOINTMENT_ID foreign key (APPOINTMENT_ID) references AM_APPOINTMENT(ID);
    alter table AM_CONDITION_VALUE add constraint FK_AM_CONDITION_VALUE_CONDITION_ID foreign key (CONDITION_ID) references AM_CONDITION(ID);
    create index IDX_AM_CONDITION_VALUE_APPOINTMENT on AM_CONDITION_VALUE (APPOINTMENT_ID);
    create index IDX_AM_CONDITION_VALUE_CONDITION on AM_CONDITION_VALUE (CONDITION_ID);
    -- end AM_CONDITION_VALUE

    -- begin AM_APPOINTMENT
    alter table AM_APPOINTMENT add constraint FK_AM_APPOINTMENT_APPOINTMENT_TYPE_ID foreign key (APPOINTMENT_TYPE_ID) references AM_APPOINTMENT_TYPE(ID);
    alter table AM_APPOINTMENT add constraint FK_AM_APPOINTMENT_CONDITION_SCRIPT_ID foreign key (CONDITION_SCRIPT_ID) references AM_APPOINTMENT_SCRIPT(ID);
    alter table AM_APPOINTMENT add constraint FK_AM_APPOINTMENT_PARTICIPANT_SCRIPT_ID foreign key (PARTICIPANT_SCRIPT_ID) references AM_APPOINTMENT_SCRIPT(ID);
    create index IDX_AM_APPOINTMENT_PARTICIPANT_SCRIPT on AM_APPOINTMENT (PARTICIPANT_SCRIPT_ID);
    create index IDX_AM_APPOINTMENT_CONDITION_SCRIPT on AM_APPOINTMENT (CONDITION_SCRIPT_ID);
    create index IDX_AM_APPOINTMENT_APPOINTMENT_TYPE on AM_APPOINTMENT (APPOINTMENT_TYPE_ID);
    -- end AM_APPOINTMENT

    -- begin AM_APPOINTMENT_USER
    alter table AM_APPOINTMENT_USER add constraint FK_AM_APPOINTMENT_USER_USER_ID foreign key (USER_ID) references SEC_USER(ID);
    alter table AM_APPOINTMENT_USER add constraint FK_AM_APPOINTMENT_USER_APPOINTMENT_ID foreign key (APPOINTMENT_ID) references AM_APPOINTMENT(ID);
    create index IDX_AM_APPOINTMENT_USER_USER on AM_APPOINTMENT_USER (USER_ID);
    create index IDX_AM_APPOINTMENT_USER_APPOINTMENT on AM_APPOINTMENT_USER (APPOINTMENT_ID);
    -- end AM_APPOINTMENT_USER

    -- begin AM_APPOINTMENT_TYPE
    alter table AM_APPOINTMENT_TYPE add constraint FK_AM_APPOINTMENT_TYPE_PROC_ROLE_ID foreign key (PROC_ROLE_ID) references WF_PROC_ROLE(ID);
    create index IDX_AM_APPOINTMENT_TYPE_PROC_ROLE on AM_APPOINTMENT_TYPE (PROC_ROLE_ID);
    -- end AM_APPOINTMENT_TYPE

    -- begin AM_APPOINTMENT_CARD_ROLE_INFO
    alter table AM_APPOINTMENT_CARD_ROLE_INFO add constraint FK_CARD_ROLE_INFO_CARD_ROLE_ID foreign key (CARD_ROLE_ID) references WF_CARD_ROLE(ID);
    create index IDX_CARD_ROLE_INFO_CARD_ROLE on AM_APPOINTMENT_CARD_ROLE_INFO (CARD_ROLE_ID);
    -- end AM_APPOINTMENT_CARD_ROLE_INFO
end
^