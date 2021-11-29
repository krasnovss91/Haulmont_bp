CREATE TABLE TS_OPERATOR_EDM(
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
    login varchar(255),
    password varchar(255),
    last_inbound_date timestamp,
    primary key(id)
)^

INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('c0972ef2-631c-448b-9d47-6738fe4caf92',current_timestamp,current_timestamp,'admin',1,20,'ts$OperatorEdm:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('5792b007-83bd-4d9b-9f10-44af7b4fff86',current_timestamp,current_timestamp,'admin',1,20,'ts$OperatorEdm:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('5de976a9-5ccb-4bce-90da-96fb429eb920',current_timestamp,current_timestamp,'admin',1,20,'ts$OperatorEdm:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('6e0bb2cb-4708-422f-960d-9a0dfffd1420',current_timestamp,current_timestamp,'admin',1,20,'ts$OperatorEdm:read',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('c3dd2cb7-e232-492a-b894-cc7552435aa4',current_timestamp,current_timestamp,'admin',1,10,'ts$OperatorEdm.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');