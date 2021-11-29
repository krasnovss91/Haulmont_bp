-- $Id$
declare
  already_exists  exception;
  columns_indexed exception;
  pragma exception_init( already_exists, -955 );
  pragma exception_init(columns_indexed, -1408);
begin
  execute immediate 'create index IDX_BASE_ACL_ID on TS_CARD_ACL(BASE_ACL_ID)';
  execute immediate 'create index IDX_PARTICIPANT_ITEM on TS_CALENDAR_EVENT_PARTICIPANT (CALENDAR_EVENT_ITEM_ID)';
  execute immediate 'create index FK_TS_PUSH_NOT_CARD_INFO ON TS_PUSH_NOTIFICATION(CARD_INFO_ID)';
  dbms_output.put_line( 'created' );
exception
  when already_exists or columns_indexed then
  dbms_output.put_line( 'skipped' );
end;