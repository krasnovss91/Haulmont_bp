alter table SEC_USER add GROUP_NAMES varchar2(255)^
--alter table SEC_USER modify GROUP_ID null^

DECLARE
   allready_null EXCEPTION;
   PRAGMA EXCEPTION_INIT(allready_null, -1451);
BEGIN
   execute immediate 'alter table SEC_USER modify GROUP_ID null';
EXCEPTION
   WHEN allready_null THEN
      null;
END;
^