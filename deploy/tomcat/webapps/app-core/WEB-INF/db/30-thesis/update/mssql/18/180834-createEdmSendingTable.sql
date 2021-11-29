CREATE TABLE TS_EDM_SENDING (
    ID uniqueidentifier,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),
    VERSION integer,
    ---
    EDM_MESSAGE_ID varchar(255),
    EDM_ENTITY_ID varchar(255),
    EDM_STATE integer,
    RESPONSE_SIGNATURE_REFUSE_MSG varchar(1000),
    SIGNATURE varchar(max),
    DOC_ID uniqueidentifier,
    BOX_ID varchar(255),
    primary key nonclustered(ID)
)^

create clustered index IDX_TS_EDM_SENDING_CREATE_TS on TS_EDM_SENDING (CREATE_TS)^
create index IDX_EDM_SENDING_DOC_ID on TS_EDM_SENDING(DOC_ID)^

INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('baeb378f-31db-4aa5-a98e-c02f7697aebc',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('e4d9f371-7773-439d-bb50-62a906b7252d',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('46086834-c2ac-4e18-92f0-97008f9f96fe',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('cfcc3054-3f65-42aa-8cc6-dbc74c8e585d',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:read',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('a761f635-f6f4-4bf3-82b7-37c97ad19d08',current_timestamp,current_timestamp,'admin',1,10,'ts$EdmSending.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');