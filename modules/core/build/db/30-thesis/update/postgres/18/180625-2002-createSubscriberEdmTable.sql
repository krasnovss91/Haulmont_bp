CREATE TABLE TS_SUBSCRIBER_EDM(
    id uuid,
    create_ts timestamp,
    created_by varchar(50),
    update_ts timestamp,
    updated_by varchar(50),
    delete_ts timestamp,
    deleted_by varchar(50),
    version integer,
    ---
    name varchar(255),
    box_id varchar(255),
    contractor_id uuid,
    operator_edm_id uuid,

    primary key(id)
)^

alter table TS_SUBSCRIBER_EDM add constraint TS_SUBSCR_EDM_CONR_ID foreign key (CONTRACTOR_ID) references DF_CONTRACTOR(CORRESPONDENT_ID)^
alter table TS_SUBSCRIBER_EDM add constraint TS_SUBSCR_EDM_OPER_EDM_ID foreign key (OPERATOR_EDM_ID) references TS_OPERATOR_EDM(ID)^
create unique index IDX_SUBSCR_CONTR_UNIQ on TS_SUBSCRIBER_EDM (OPERATOR_EDM_ID) where DELETE_TS is null^

INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('b902b79d-4423-4ccc-9a8e-40799b017b57',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('5a86e217-4dab-4d27-a322-0626b9cde9ee',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('8b63b7e3-a740-4823-93c9-96e8e79c95d8',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('25dbe4f0-b23c-4a04-9f89-21476d6fb6fe',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:read',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('0f39428b-c042-4a4d-b350-0fdf25bc6d9d',current_timestamp,current_timestamp,'admin',1,10,'ts$SubscriberEdm.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');