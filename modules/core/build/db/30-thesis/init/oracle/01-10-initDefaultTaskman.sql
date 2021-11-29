-- $Id$
-- Description:
--Update Proc an ProcRole--
update WF_PROC set name = 'Управление задачами', card_types = ',tm$Task,', available_for_mobile_client = '1' where jbpm_process_key = 'TaskManagement' and updated_by is null^
update WF_PROC set name = 'Управление задачами', HIDDEN_DECISIONS_BPMN = 'ControlByInitiatorDecision,IsSelfAssignedTaskAfterStart,IsSelfAssignedTask' where jbpm_process_key = 'TaskManagement'^
update WF_PROC_ROLE set name = 'Инициатор', loc_name = '{"captionWithLanguageList":[{"language":"ru","caption":"Инициатор"},{"language":"en","caption":"Initiator"}]}', role_id = (select id from SEC_ROLE where name = 'task_initiator'),assign_to_creator=1 where code = '10-Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'TaskManagement') and updated_by is null^
update WF_PROC_ROLE set name = 'Исполнитель', loc_name = '{"captionWithLanguageList":[{"language":"ru","caption":"Исполнитель"},{"language":"en","caption":"Executor"}]}', role_id = (select id from SEC_ROLE where name = 'task_executor'), order_filling_type = 'P', is_multi_user = 1 where code = '20-Executor' and proc_id = (select id from WF_PROC where jbpm_process_key = 'TaskManagement') and updated_by is null^
update WF_PROC_ROLE set name = 'Контролёр', loc_name = '{"captionWithLanguageList":[{"language":"ru","caption":"Контролёр"},{"language":"en","caption":"Controller"}]}', role_id = (select id from SEC_ROLE where name = 'task_controller') where code = '30-Controller' and proc_id = (select id from WF_PROC where jbpm_process_key = 'TaskManagement') and updated_by is null^
update WF_PROC_ROLE set name = 'Наблюдатель', loc_name = '{"captionWithLanguageList":[{"language":"ru","caption":"Наблюдатель"},{"language":"en","caption":"Observer"}]}', role_id = (select id from SEC_ROLE where name = 'task_observer'), order_filling_type = 'P', is_multi_user = 1 where code = '90-Observer' and proc_id = (select id from WF_PROC where jbpm_process_key = 'TaskManagement') and updated_by is null^
update WF_PROC_ROLE set name = 'Создатель', loc_name = '{"captionWithLanguageList":[{"language":"ru","caption":"Создатель"},{"language":"en","caption":"Creator"}]}', role_id = (select id from SEC_ROLE where name = 'task_creator') where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'TaskManagement') and updated_by is null^

update wf_proc_role set sort_order = 1 where code = '10-Initiator' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null^
update wf_proc_role set sort_order = 2 where code = '20-Executor' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null^
update wf_proc_role set sort_order = 3, notify_without_assignment = '1' where code = '30-Controller' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null^
update wf_proc_role set sort_order = 4, notify_without_assignment = '1' where code = '90-Observer' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null^
update wf_proc_role set sort_order = 5 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null^


select assign_card_creator_default('10-Initiator', 'TaskManagement') from dual^



CREATE OR REPLACE FUNCTION baseInsert
RETURN integer IS
	cnt integer;
    PRAGMA AUTONOMOUS_TRANSACTION;  -- start anonymous transaction
BEGIN
    --Insert roles by Administrator--
    select count(id) into cnt from SEC_USER_ROLE where id = '2bf2d72cd77345b69775826e8294f926'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = '0c018061b26f4de2a5bedff348347f93');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('2bf2d72cd77345b69775826e8294f926', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', '0c018061b26f4de2a5bedff348347f93');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = '505c696d94604712ba2755053b8f3757'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = 'c06c0cee2f2142418d6f76b4cd462f96');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('505c696d94604712ba2755053b8f3757', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', 'c06c0cee2f2142418d6f76b4cd462f96');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = '35b174b6b3b34c55bc62b854414cef57'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = 'e41f5aa232964fdc906eaf2f8660f806');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('35b174b6b3b34c55bc62b854414cef57', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', 'e41f5aa232964fdc906eaf2f8660f806');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = 'c362eb7bf4234f62beb22fa100e6f116'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = '7091f5efa77a450a834a39406885676e');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('c362eb7bf4234f62beb22fa100e6f116', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', '7091f5efa77a450a834a39406885676e');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = '2728276810154120bbc914a8e5ab7276'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = '47135f12071b43d8bc212ff77cd08fb6');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('2728276810154120bbc914a8e5ab7276', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', '47135f12071b43d8bc212ff77cd08fb6');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = 'fc843d303a614dcea3f578ae23fedcdb'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = '3c9abffb2fae484e990c343b3c1197ca');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('fc843d303a614dcea3f578ae23fedcdb', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', '3c9abffb2fae484e990c343b3c1197ca');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = '922e85eeefef4ffabfce214d51ce5c52'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = '7a35c6f86a2d4347a8c23bc887e23c83');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('922e85eeefef4ffabfce214d51ce5c52', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', '7a35c6f86a2d4347a8c23bc887e23c83');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = '58f80bee58d743dcb14dd57de959b36f'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = 'f7ff1ec7802d4a42a7db1a97e17f893f');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('58f80bee58d743dcb14dd57de959b36f', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', 'f7ff1ec7802d4a42a7db1a97e17f893f');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = '836d8822ca484197bb7b78fd37b5076b'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = '0038f3dbac9c432383e7356996cc63ae');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('836d8822ca484197bb7b78fd37b5076b', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', '0038f3dbac9c432383e7356996cc63ae');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = '3bafe8fd09674d3da2519c4b5ca30fa8'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = '64fec16454084e489e725a1d214c533e');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('3bafe8fd09674d3da2519c4b5ca30fa8', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', '64fec16454084e489e725a1d214c533e');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = '264a0a9137434528a713e0ce329fb80b'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = 'c0e15ca317914e529882c88fd72fbac1');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('264a0a9137434528a713e0ce329fb80b', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', 'c0e15ca317914e529882c88fd72fbac1');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = '8bb3653de8c9433a93d83aa2f1d142a9'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = '5115e83341464c98a1191c06053adb92');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('8bb3653de8c9433a93d83aa2f1d142a9', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', '5115e83341464c98a1191c06053adb92');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = 'd99144374a9a48c3b42e12febe47c61b'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = 'af4398100f114a21b2397df2df83bbc6');
    if (cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('d99144374a9a48c3b42e12febe47c61b', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, '608859871b61424794c7dff348347f93', 'af4398100f114a21b2397df2df83bbc6');
        COMMIT;     -- commit anonymous transaction
    end if;
    select count(id) into cnt from SEC_USER_ROLE where id = '1186d87136634f29889b7d0ffa56b267'
    or (user_id = '608859871b61424794c7dff348347f93' and role_id = '80145594f020e85cd2597a293c035495');
    if(cnt = 0) then
        insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('1186d87136634f29889b7d0ffa56b267', current_timestamp, 'admin', 1, '608859871b61424794c7dff348347f93', '80145594f020e85cd2597a293c035495');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from TM_PROJECT_GROUP where id = 'b875aded88e740909f81a1a5fac75192';
    if (cnt = 0) then
        insert into TM_PROJECT_GROUP (id, name, create_ts, created_by, version) values ('b875aded88e740909f81a1a5fac75192', 'Основной проект', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1);
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(CATEGORY_ID) into cnt from TM_TASK_TYPE where CATEGORY_ID = '836d02a068a94aa5b11a08e9b32c589b';
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('836d02a068a94aa5b11a08e9b32c589b', 'Основной', 'tm$Task', 0, CURRENT_TIMESTAMP, USER, 1, 2);
        insert into TM_TASK_TYPE (CATEGORY_ID, create_ts, created_by, version, category_attrs_place, tab_name)
        values ('836d02a068a94aa5b11a08e9b32c589b', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 1, 'Доп. поля');
        COMMIT;     -- commit anonymous transaction
    end if;

    select count(id) into cnt from SYS_CONFIG where name = 'workflow.sms.smsProviderClassName';
    if (cnt = 0) then
        insert into SYS_CONFIG (id, create_ts, created_by, version, name, value_) values ('f6a9be4016ac11e287837b7ddae9940d', TO_TIMESTAMP('2010-10-28 00:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 'admin', 1, 'workflow.sms.smsProviderClassName', 'com.haulmont.thesis.core.app.SmsTrafficProvider');
        COMMIT;     -- commit anonymous transaction
    end if;

    return 0;
END;^

select baseInsert() from dual^

DECLARE
    func_does_not_exist EXCEPTION;
    PRAGMA exception_init(func_does_not_exist, -04043);
BEGIN
    EXECUTE IMMEDIATE 'drop function baseInsert';
EXCEPTION
    WHEN func_does_not_exist THEN NULL;
END;^