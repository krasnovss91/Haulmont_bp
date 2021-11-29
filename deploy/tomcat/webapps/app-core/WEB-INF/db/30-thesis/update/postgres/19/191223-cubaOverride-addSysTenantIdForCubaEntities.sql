CREATE OR REPLACE FUNCTION make_sec_group_names_unique()
  RETURNS void AS
$BODY$
DECLARE
    r record;
    dup record;
    suf integer;
    newname varchar;
BEGIN
    create temp table temp_sec_groups on commit drop as
      select name as name, count(*) as count from sec_group group by name;

    for r in select * from temp_sec_groups where name is not null and count > 1
    loop
      create temp table temp_dups on commit drop as
        select id, create_ts, name from sec_group where name = r.name;

      suf = 1;
      for dup in select * from temp_dups order by create_ts
      loop
        if (suf > 1) then
            newname = dup.name || ' ' || suf;
            update sec_group set name = newname where id = dup.id;
        end if;
        suf = suf + 1;
      end loop;

      drop table temp_dups;
    end loop;
    return;
END;
$BODY$
LANGUAGE plpgsql^

alter table SYS_FILE add SYS_TENANT_ID varchar(255)^
alter table SYS_SCHEDULED_TASK add SYS_TENANT_ID varchar(255)^
alter table SYS_SCHEDULED_EXECUTION add SYS_TENANT_ID varchar(255)^
alter table SEC_ROLE add SYS_TENANT_ID varchar(255)^
alter table SEC_GROUP add SYS_TENANT_ID varchar(255)^
alter table SEC_GROUP_HIERARCHY add SYS_TENANT_ID varchar(255)^
alter table SEC_USER add SYS_TENANT_ID varchar(255)^
alter table SEC_CONSTRAINT add SYS_TENANT_ID varchar(255)^
alter table SEC_SESSION_ATTR add SYS_TENANT_ID varchar(255)^
alter table SEC_USER_SUBSTITUTION add SYS_TENANT_ID varchar(255)^
alter table SEC_ENTITY_LOG add SYS_TENANT_ID varchar(255)^
alter table SEC_FILTER add SYS_TENANT_ID varchar(255)^
alter table SYS_FOLDER add SYS_TENANT_ID varchar(255)^
alter table SEC_PRESENTATION add SYS_TENANT_ID varchar(255)^
alter table SEC_SCREEN_HISTORY add SYS_TENANT_ID varchar(255)^
alter table SYS_SENDING_MESSAGE add SYS_TENANT_ID varchar(255)^
alter table SYS_SENDING_ATTACHMENT add SYS_TENANT_ID varchar(255)^
alter table SYS_ENTITY_SNAPSHOT add SYS_TENANT_ID varchar(255)^
alter table SEC_SESSION_LOG add SYS_TENANT_ID varchar(255)^

drop index IDX_SEC_USER_UNIQ_LOGIN^
create unique index IDX_SEC_USER_UNIQ_LOGIN on SEC_USER (LOGIN_LC) where DELETE_TS is null and SYS_TENANT_ID is null^
create unique index IDX_SEC_USER_UNIQ_LOGIN_SYS_TENANT_ID_NN on SEC_USER (LOGIN_LC, SYS_TENANT_ID)
    where DELETE_TS is null and SYS_TENANT_ID is not null^

drop index IDX_SEC_ROLE_UNIQ_NAME^
create unique index IDX_SEC_ROLE_UNIQ_NAME on SEC_ROLE (NAME) where DELETE_TS is null and SYS_TENANT_ID is null^
create unique index IDX_SEC_ROLE_UNIQ_NAME_SYS_TENANT_ID_NN on SEC_ROLE (NAME, SYS_TENANT_ID)
    where DELETE_TS is null and SYS_TENANT_ID is not null^

drop index if exists IDX_SEC_GROUP_UNIQ_NAME^
update SEC_GROUP set NAME = ID where NAME is null^
select make_sec_group_names_unique()^
create unique index IDX_SEC_GROUP_UNIQ_NAME on SEC_GROUP (NAME) where DELETE_TS is null and SYS_TENANT_ID is null^
create unique index IDX_SEC_GROUP_UNIQ_NAME_SYS_TENANT_ID_NN on SEC_GROUP (NAME, SYS_TENANT_ID)
    where DELETE_TS is null and SYS_TENANT_ID is not null^

drop function make_sec_group_names_unique()^