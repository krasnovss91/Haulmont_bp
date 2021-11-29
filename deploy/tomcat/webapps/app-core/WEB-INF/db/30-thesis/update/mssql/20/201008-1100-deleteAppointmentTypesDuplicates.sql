create procedure deleteAppointTypeDuplicates
as
begin
    declare @rec cursor,
            @proc_role_id uniqueidentifier,
            @entity_name varchar(400);

    set @rec = cursor scroll
    for select PROC_ROLE_ID, ENTITY_NAME from AM_APPOINTMENT_TYPE where DELETE_TS is null
        group by PROC_ROLE_ID, ENTITY_NAME having count(*) > 1
    open @rec
    fetch next from @rec into @proc_role_id, @entity_name

    while @@fetch_status = 0
  	begin
        update AM_APPOINTMENT_TYPE set DELETE_TS = CREATE_TS, DELETED_BY = 'system'
        where PROC_ROLE_ID = @proc_role_id and ENTITY_NAME = @entity_name and DELETE_TS is null;

        fetch next from @rec into @proc_role_id, @entity_name
    end
    close @rec;
end;
^
exec deleteAppointTypeDuplicates;
^
drop procedure deleteAppointTypeDuplicates;

update AM_APPOINTMENT set DELETE_TS = current_timestamp, DELETED_BY = 'system'
where APPOINTMENT_TYPE_ID in (select ID from AM_APPOINTMENT_TYPE where DELETE_TS is not null);