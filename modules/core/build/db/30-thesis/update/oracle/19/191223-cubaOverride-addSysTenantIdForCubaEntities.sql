CREATE OR REPLACE FUNCTION make_sec_group_names_unique
RETURN varchar2 IS
    suf integer;
    newname varchar2(255);
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    for gr in (select name as name, count(*) as count from sec_group group by name)
    loop
        IF (gr.name is null or gr.count <= 1) THEN
            CONTINUE;
        END IF;

        suf := 1;
        for dup in (select id, name from sec_group where name = gr.name order by create_ts)
        loop
            IF (suf > 1) THEN
                newname := dup.name || ' ' || suf;
                update sec_group set name = newname where id = dup.id;
            END IF;
            suf := suf + 1;
        end loop;
    end loop;
    COMMIT;
    return 'finished';
END make_sec_group_names_unique;
^

alter table SYS_FILE add SYS_TENANT_ID varchar2(255)^
alter table SYS_SCHEDULED_TASK add SYS_TENANT_ID varchar2(255)^
alter table SYS_SCHEDULED_EXECUTION add SYS_TENANT_ID varchar2(255)^
alter table SEC_ROLE add SYS_TENANT_ID varchar2(255)^
alter table SEC_GROUP add SYS_TENANT_ID varchar2(255)^
alter table SEC_GROUP_HIERARCHY add SYS_TENANT_ID varchar2(255)^
alter table SEC_USER add SYS_TENANT_ID varchar2(255)^
alter table SEC_CONSTRAINT add SYS_TENANT_ID varchar2(255)^
alter table SEC_SESSION_ATTR add SYS_TENANT_ID varchar2(255)^
alter table SEC_USER_SUBSTITUTION add SYS_TENANT_ID varchar2(255)^
alter table SEC_ENTITY_LOG add SYS_TENANT_ID varchar2(255)^
alter table SEC_FILTER add SYS_TENANT_ID varchar2(255)^
alter table SYS_FOLDER add SYS_TENANT_ID varchar2(255)^
alter table SEC_PRESENTATION add SYS_TENANT_ID varchar2(255)^
alter table SEC_SCREEN_HISTORY add SYS_TENANT_ID varchar2(255)^
alter table SYS_SENDING_MESSAGE add SYS_TENANT_ID varchar2(255)^
alter table SYS_SENDING_ATTACHMENT add SYS_TENANT_ID varchar2(255)^
alter table SYS_ENTITY_SNAPSHOT add SYS_TENANT_ID varchar2(255)^
alter table SEC_SESSION_LOG add SYS_TENANT_ID varchar2(255)^

drop index IDX_SEC_USER_UNIQ_LOGIN^
create unique index IDX_SEC_USER_UNIQ_LOGIN on SEC_USER(LOGIN_LC, SYS_TENANT_ID, DELETE_TS)^

drop index IDX_SEC_ROLE_UNIQ_NAME^
create unique index IDX_SEC_ROLE_UNIQ_NAME on SEC_ROLE(NAME, SYS_TENANT_ID, DELETE_TS)^

DECLARE
  COUNT_INDEXES INTEGER;
BEGIN
  SELECT COUNT(*) INTO COUNT_INDEXES
    FROM USER_INDEXES
    WHERE INDEX_NAME = 'IDX_SEC_GROUP_UNIQ_NAME';

  IF COUNT_INDEXES > 0 THEN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SEC_GROUP_UNIQ_NAME';
  END IF;
END;
^
update SEC_GROUP set NAME = ID where NAME is null^
select make_sec_group_names_unique() from dual^
create unique index IDX_SEC_GROUP_UNIQ_NAME on SEC_GROUP(NAME, SYS_TENANT_ID, DELETE_TS)^

drop function make_sec_group_names_unique^