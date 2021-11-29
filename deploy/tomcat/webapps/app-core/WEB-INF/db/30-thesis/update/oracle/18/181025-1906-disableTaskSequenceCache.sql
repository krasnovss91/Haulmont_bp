-- $Id$
declare
  not_exist  exception;
  pragma exception_init(not_exist, -02289);
begin
  execute immediate 'alter sequence SEQ_UN_TASK_NUM nocache';
exception
  when not_exist then dbms_output.put_line( 'Sequence not exist');
end;