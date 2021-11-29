CREATE TABLE TS_SUBSCRIBER_EDM(
    id varchar2(50 char),
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
    contractor_id varchar2(50 char),
    operator_edm_id varchar2(50 char),

    primary key(id)
)^

alter table TS_SUBSCRIBER_EDM add constraint TS_SUBSCR_EDM_CONR_ID foreign key (CONTRACTOR_ID) references DF_CONTRACTOR(CORRESPONDENT_ID)^
alter table TS_SUBSCRIBER_EDM add constraint TS_SUBSCR_EDM_OPER_EDM_ID foreign key (OPERATOR_EDM_ID) references TS_OPERATOR_EDM(ID)^
create unique index IDX_SUBSCR_CONTR_UNIQ on TS_SUBSCRIBER_EDM (OPERATOR_EDM_ID, DELETE_TS)^

INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('b902b79d44234ccc9a8e40799b017b57',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:create',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('5a86e2174dab4d27a3220626b9cde9ee',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:update',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('8b63b7e3a740482393c996e8e79c95d8',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:delete',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('25dbe4f0b23c4a049f8921476d6fb6fe',current_timestamp,current_timestamp,'admin',1,20,'ts$SubscriberEdm:read',0,'96fa7fe9397d4bacb14aeec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,update_ts,created_by,version,permission_type,target,value,role_id) VALUES ('0f39428bc0424a4db3500fdf25bc6d9d',current_timestamp,current_timestamp,'admin',1,10,'ts$SubscriberEdm.browse',0,'96fa7fe9397d4bacb14aeec2d94de68c')^