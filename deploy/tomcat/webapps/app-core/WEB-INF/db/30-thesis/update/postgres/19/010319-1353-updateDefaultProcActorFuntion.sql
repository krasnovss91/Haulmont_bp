CREATE OR REPLACE FUNCTION assign_card_creator_default(varchar(50), varchar(255))
RETURNS varchar AS $$
DECLARE
    proc_role_code alias for $1; -- process role code
    proc_code alias for $2; -- process code

    proc_role_rec record;
    default_proc_actors_count integer;
BEGIN
    if(proc_role_code is null or proc_code is null) then
	    return 'Process and role codes must not be null';
    else
	    select * from WF_PROC_ROLE pr join WF_PROC p on p.ID = pr.PROC_ID where pr.CODE = proc_role_code
	    and p.CODE = proc_code and pr.DELETE_TS is null limit 1 into proc_role_rec;

        if (proc_role_rec.id is not null) then
            if(proc_role_rec.IS_MULTI_USER = true
                and exists (select ID from WF_DEFAULT_PROC_ACTOR where PROC_ROLE_ID = proc_role_rec.ID and USER_ID is null
                and STRATEGY_ID = 'ts_CardAuthorProcessActorStrategy' and DELETE_TS is null)) then
                    return 'Process role already have creator process actor';
            end if;

            if(proc_role_rec.IS_MULTI_USER = false
                and (select count(*) from WF_DEFAULT_PROC_ACTOR where PROC_ROLE_ID = proc_role_rec.ID and DELETE_TS is null) > 0) then
                    return 'Process role multi assignment disabled and it already has default actor';
            end if;

            insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, VERSION, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID, DTYPE)
            values (newid(), current_timestamp, 'admin', 1, proc_role_rec.ID, true, 'ts_CardAuthorProcessActorStrategy', '10');
            return 'Creator default process actor has been successfully created';
        else
             return 'Can not find corresponded process role';
        end if;
    end if;
END;
$$ LANGUAGE plpgsql;
^