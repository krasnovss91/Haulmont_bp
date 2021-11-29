--$Id$

do $$
begin

if not exists
    (select 1 from pg_class c where c.relname = 'idx_sec_entity_log_entity_id')
    then
    create index IDX_SEC_ENTITY_LOG_ENTITY_ID on SEC_ENTITY_LOG (ENTITY_ID);
end if;

end $$;

^