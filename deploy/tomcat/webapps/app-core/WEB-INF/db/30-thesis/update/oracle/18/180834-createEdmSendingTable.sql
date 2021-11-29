CREATE TABLE TS_EDM_SENDING (
    ID varchar2(50 char),
    CREATE_TS timestamp,
    CREATED_BY varchar2(50 char),
    UPDATE_TS timestamp,
    UPDATED_BY varchar2(50 char),
    DELETE_TS timestamp,
    DELETED_BY varchar2(50 char),
    VERSION integer,
    ---
    EDM_MESSAGE_ID varchar2(255 char),
    EDM_ENTITY_ID varchar2(255 char),
    EDM_STATE integer,
    RESPONSE_SIGNATURE_REFUSE_MSG varchar2(1000 char),
    SIGNATURE clob,
    DOC_ID varchar2(32 char),
    BOX_ID varchar2(255 char),
    primary key(ID)
)^

create index IDX_EDM_SENDING_DOC_ID on TS_EDM_SENDING(DOC_ID)^

INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('baeb378f31db4aa5a98ec02f7697aebc',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('e4d9f3717773439dbb5062a906b7252d',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('46086834c2ac4e1892f097008f9f96fe',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('cfcc30543f6542aa8cc6dbc74c8e585d',current_timestamp,current_timestamp,'admin',1,20,'ts$EdmSending:read',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('a761f635f6f44bf382b737c97ad19d08',current_timestamp,current_timestamp,'admin',1,10,'ts$EdmSending.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^