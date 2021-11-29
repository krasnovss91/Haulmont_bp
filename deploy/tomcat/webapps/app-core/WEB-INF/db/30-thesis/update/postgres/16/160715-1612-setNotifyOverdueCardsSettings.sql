-- $Id$
-- Description:
CREATE OR REPLACE FUNCTION insertSettings()
RETURNS integer
AS $$
DECLARE
		rec CURSOR IS select u.id, u.login from SEC_USER u where u.delete_ts is null;
		userId uuid;
		login varchar(100);
		r integer:=0;
BEGIN
  OPEN rec;
  loop
     FETCH rec INTO userId, login;
     EXIT WHEN not FOUND ;
     if not exists(select s.id from SEC_USER_SETTING s where s.user_id = userId and name = 'notifyUserOnceADay') then
     	insert into SEC_USER_SETTING(ID, CREATE_TS, CREATED_BY, USER_ID, NAME, VALUE)
        values (newid(), current_timestamp, login, userId, 'notifyUserOnceADay', 'true');
     end if;

     if not exists(select s.id from SEC_USER_SETTING s where s.user_id = userId and name = 'notifyOverdueCardsByScheduler') then
        insert into SEC_USER_SETTING(ID, CREATE_TS, CREATED_BY, USER_ID, NAME, VALUE)
        values (newid(), current_timestamp, login, userId, 'notifyOverdueCardsByScheduler', '17:50');
     end if;
  end loop;
  CLOSE rec;
  return r;
END;
$$
LANGUAGE plpgsql^
select insertSettings()^
drop function if exists insertSettings()^
