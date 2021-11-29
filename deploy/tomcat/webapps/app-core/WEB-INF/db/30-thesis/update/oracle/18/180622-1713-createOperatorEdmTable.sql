CREATE TABLE TS_OPERATOR_EDM(
    ID varchar2(32 char),
    create_ts timestamp,
    created_by varchar2(50 char),
    update_ts timestamp,
    updated_by varchar2(50 char),
    delete_ts timestamp,
    deleted_by varchar2(50 char),
    version integer,
    ---
    name varchar2(255 char),
    box_id varchar2(255 char),
    login varchar2(255 char),
    password varchar2(255 char),
    last_inbound_date timestamp,
    primary key (id)
)^

INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('c0972ef2631c448b9d476738fe4caf92',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'admin',1,20,'ts$OperatorEdm:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('5792b00783bd4d9b9f1044af7b4fff86',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'admin',1,20,'ts$OperatorEdm:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('5de976a95ccb4bce90da96fb429eb920',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'admin',1,20,'ts$OperatorEdm:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('6e0bb2cb4708422f960d9a0dfffd1420',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'admin',1,20,'ts$OperatorEdm:read',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('c3dd2cb7e232492ab894cc7552435aa4',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'admin',1,10,'ts$OperatorEdm.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^