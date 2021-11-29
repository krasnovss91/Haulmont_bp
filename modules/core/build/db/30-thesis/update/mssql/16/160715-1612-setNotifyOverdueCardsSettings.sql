-- $Id$
-- Description:

CREATE PROCEDURE insertSettings
AS
BEGIN
    DECLARE
		@rec CURSOR,
		@user_id uniqueidentifier,
		@login varchar(100),
		@settings_once_a_day uniqueidentifier,
		@settings_time uniqueidentifier;


	SET @rec = CURSOR SCROLL
    for select u.id, u.login from SEC_USER u where u.delete_ts is null;

    OPEN @rec
    FETCH NEXT FROM @rec INTO @user_id, @login

    WHILE @@FETCH_STATUS = 0
	BEGIN
		if(not exists(select s.id from SEC_USER_SETTING s where s.user_id = @user_id and name = 'notifyUserOnceADay'))
		begin
		    insert into SEC_USER_SETTING(ID, CREATE_TS, CREATED_BY, USER_ID, NAME, VALUE)
		    values (newid(), current_timestamp, @login, @user_id, 'notifyUserOnceADay', 'true')
		end;
		if(not exists(select s.id from SEC_USER_SETTING s where s.user_id = @user_id and name = 'notifyOverdueCardsByScheduler'))
		begin
            insert into SEC_USER_SETTING(ID, CREATE_TS, CREATED_BY, USER_ID, NAME, VALUE)
            values (newid(), current_timestamp, @login, @user_id, 'notifyOverdueCardsByScheduler', '17:50')
        end;

		FETCH NEXT FROM @rec INTO @user_id, @login
	END
	CLOSE @rec;
END;
^
exec insertSettings;
^
drop procedure insertSettings;