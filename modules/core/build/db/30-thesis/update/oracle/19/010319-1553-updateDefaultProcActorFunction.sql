CREATE OR REPLACE FUNCTION assign_card_creator_default( -- renamed: assign_card_creator_default_process_actor
    proc_role_code IN varchar2,     -- process role code
    proc_code IN varchar2)          -- process code
RETURN varchar2 IS
    proc_role_rec WF_PROC_ROLE%rowtype;
    default_proc_actors_count integer;
    is_default_actor_exists char(1);
    count_of_proc_actors integer;
    PRAGMA AUTONOMOUS_TRANSACTION;  -- start anonymous transaction
BEGIN
    if (proc_role_code is null or proc_code is null)
    then
	    return 'Process and role codes must not be null';
    else
        BEGIN
            select * into proc_role_rec
            from WF_PROC_ROLE proc_role
            where id = (select pr.id
                from WF_PROC_ROLE pr
                join WF_PROC p
                on p.ID = pr.PROC_ID
                where pr.CODE = proc_role_code and p.CODE = proc_code and pr.DELETE_TS is null and ROWNUM = 1);

            select case
                when exists (select ID
                    from WF_DEFAULT_PROC_ACTOR
                    where PROC_ROLE_ID = proc_role_rec.ID
                        and USER_ID is null
                        and STRATEGY_ID = 'ts_CardAuthorProcessActorStrategy'
                        and DELETE_TS is null)
                 then 1
                 else 0
            end
            into is_default_actor_exists
            from dual;

            if (proc_role_rec.id is not null) then
                if proc_role_rec.IS_MULTI_USER = 1 and is_default_actor_exists = 1
                then
                    return 'Process role already have creator process actor';
                end if;

                select count(*) into count_of_proc_actors from WF_DEFAULT_PROC_ACTOR where PROC_ROLE_ID = proc_role_rec.ID and DELETE_TS is null;
                if proc_role_rec.IS_MULTI_USER = 0 and count_of_proc_actors > 0
                then
                    return 'Process role multi assignment disabled and it already has default actor';
                end if;

                insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, VERSION, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE)
                values (newid(), current_timestamp, 'admin', 1, proc_role_rec.ID, 1, 'ts_CardAuthorProcessActorStrategy', '10');
                COMMIT;     -- commit anonymous transaction

                return 'Creator default process actor has been successfully created';
            end if;
        EXCEPTION
            WHEN NO_DATA_FOUND
            THEN return 'Can not find corresponded process role';
        END;
    end if;
END assign_card_creator_default;^