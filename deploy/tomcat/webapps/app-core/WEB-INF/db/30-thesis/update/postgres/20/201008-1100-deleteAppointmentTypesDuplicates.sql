create or replace function deleteAppointTypeDuplicates()
  returns void as
$body$
declare
    r record;
begin
    for r in select PROC_ROLE_ID, ENTITY_NAME from AM_APPOINTMENT_TYPE where DELETE_TS is null
             group by PROC_ROLE_ID, ENTITY_NAME having count(*) > 1
        loop
            update AM_APPOINTMENT_TYPE set DELETE_TS = current_timestamp, DELETED_BY = 'system'
            where PROC_ROLE_ID = r.PROC_ROLE_ID and ENTITY_NAME = r.ENTITY_NAME and DELETE_TS is null;
        end loop;
    return;
end;
$body$
language plpgsql^
select deleteAppointTypeDuplicates()^
drop function deleteAppointTypeDuplicates()^

update AM_APPOINTMENT set DELETE_TS = current_timestamp, DELETED_BY = 'system'
where APPOINTMENT_TYPE_ID in (select ID from AM_APPOINTMENT_TYPE where DELETE_TS is not null);