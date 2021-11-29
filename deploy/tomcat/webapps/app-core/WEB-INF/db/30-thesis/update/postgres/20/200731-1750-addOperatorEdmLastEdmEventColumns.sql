alter table TS_OPERATOR_EDM add LAST_DOC_EVENT_DATE timestamp^
alter table TS_OPERATOR_EDM add LAST_DOC_EVENT_AI_KEY varchar(255)^

update TS_OPERATOR_EDM set LAST_DOC_EVENT_DATE = (select COALESCE(max(e.create_ts), now()) - interval '1 day'
from SYS_SCHEDULED_TASK t
join SYS_SCHEDULED_EXECUTION e on t.id = e.task_id
where t.bean_name like 'ts_LegalDocIntegrationApi' and t.method_name like 'processDocsStates') where LAST_DOC_EVENT_DATE is NULL^