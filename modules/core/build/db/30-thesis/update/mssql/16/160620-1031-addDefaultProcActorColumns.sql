-- $Id$
-- Description:

alter table WF_DEFAULT_PROC_ACTOR add STRATEGY_ID varchar(255)^

insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, VERSION, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID)
select newid(), current_timestamp, 'admin', 1, pr.ID, 1, 'ts_CardAuthorProcessActorStrategy'
from WF_PROC_ROLE pr where pr.CODE <> 'CARD_CREATOR' and pr.ASSIGN_TO_CREATOR = 1 and pr.DELETE_TS is null
and (pr.IS_MULTI_USER = 1 or (select count(*) from WF_DEFAULT_PROC_ACTOR where PROC_ROLE_ID = pr.ID and DELETE_TS is null) = 0)^

CREATE PROCEDURE assign_card_creator_default_process_actor
  @proc_role_code varchar(50), -- sec_role.name
  @proc_code varchar(255) -- sec_permission.target
AS
BEGIN
	DECLARE @proc_role_id uniqueidentifier;
	DECLARE @is_multi_user tinyint;

    if(@proc_role_code is null or @proc_code is null)
    begin
        return 'Process and role codes must not be null';
    end;
    else
    begin
    	select top 1 @proc_role_id = pr.ID, @is_multi_user = pr.IS_MULTI_USER from WF_PROC_ROLE pr join WF_PROC p on p.ID = pr.PROC_ID
    	where pr.CODE = @proc_role_code and p.CODE = @proc_code and pr.DELETE_TS is null;

        if (@proc_role_id is not null)
        begin
            if(@is_multi_user = 1
                and exists (select ID from WF_DEFAULT_PROC_ACTOR where PROC_ROLE_ID = @proc_role_id and USER_ID is null
                and STRATEGY_ID = 'ts_CardAuthorProcessActorStrategy' and DELETE_TS is null))
            begin
                print 'Process role already have creator process actor';
                return 1;
            end;

            if(@is_multi_user = 0 and (select count(*) from WF_DEFAULT_PROC_ACTOR where PROC_ROLE_ID = @proc_role_id and DELETE_TS is null) > 0)
            begin
                print 'Process role multi assignment disabled and it already has default actor';
                return 1;
            end;

            insert into WF_DEFAULT_PROC_ACTOR (ID, CREATE_TS, CREATED_BY, VERSION, PROC_ROLE_ID, NOTIFY_BY_EMAIL, STRATEGY_ID)
            values (newid(), current_timestamp, 'admin', 1, @proc_role_id, 1, 'ts_CardAuthorProcessActorStrategy');
            print 'Creator default process actor has been successfully created';
            return 0;
        end;
        else
        begin
             print 'Can not find corresponded process role';
             return 1;
        end;
    end;
END;