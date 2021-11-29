-- $Id$
-- Description:

CREATE PROCEDURE insertAclEntry
AS
BEGIN
    DECLARE
		@rec CURSOR,
		@card_id uniqueidentifier,
		@user_id uniqueidentifier,
		@doc_sender_id uniqueidentifier,
		@doc_receiver_id uniqueidentifier,
		@doc_copy_receiver_id uniqueidentifier,
		@department_id uniqueidentifier;


	SET @rec = CURSOR SCROLL
    for select d.card_id, d.doc_sender_id from DF_SIMPLE_DOC d join DF_DOC dd on d.CARD_ID = dd.CARD_ID join wf_card c on dd.CARD_ID = c.id
	where (dd.IS_TEMPLATE = 0 or dd.IS_TEMPLATE is null) and c.DELETE_TS is null and doc_sender_id is not null and not exists (select a.id from TS_CARD_ACL a
	where a.CARD_ID = d.CARD_ID and a.USER_ID = (select e.USER_ID from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = d.doc_sender_id) and a.CODE = 11)

    OPEN @rec
    FETCH NEXT FROM @rec INTO @card_id, @doc_sender_id

    WHILE @@FETCH_STATUS = 0
	BEGIN
		select @user_id = e.USER_ID, @department_id = e.DEPARTMENT_ID from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = @doc_sender_id;
		insert into TS_CARD_ACL(id, create_ts, created_by, card_id, user_id, department_id, code)
			values(newid(), CURRENT_TIMESTAMP, USER, @card_id, @user_id, @department_id, 11);

		FETCH NEXT FROM @rec INTO @card_id, @doc_sender_id
	END
	CLOSE @rec;

	select @user_id = null, @card_id = null, @department_id = null, @doc_sender_id = null;

	SET @rec = CURSOR SCROLL
    for select d.card_id, d.doc_receiver_id from DF_SIMPLE_DOC d join DF_DOC dd on d.CARD_ID = dd.CARD_ID join wf_card c on dd.CARD_ID = c.id
	where (dd.IS_TEMPLATE = 0 or dd.IS_TEMPLATE is null) and c.DELETE_TS is null and d.doc_receiver_id is not null and not exists (select a.id from TS_CARD_ACL a
	where a.CARD_ID = d.CARD_ID and a.USER_ID = (select e.USER_ID from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = d.doc_receiver_id) and a.CODE = 12)

     OPEN @rec
    FETCH NEXT FROM @rec INTO @card_id, @doc_receiver_id

    WHILE @@FETCH_STATUS = 0
	BEGIN
		select @user_id = e.USER_ID, @department_id = e.DEPARTMENT_ID from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = @doc_receiver_id;
		insert into TS_CARD_ACL(id, create_ts, created_by, card_id, user_id, department_id, code)
			values(newid(), CURRENT_TIMESTAMP, USER, @card_id, @user_id, @department_id, 12);

		FETCH NEXT FROM @rec INTO @card_id, @doc_receiver_id
	END
	CLOSE @rec;


	select @user_id = null, @card_id = null, @department_id = null, @doc_receiver_id = null;

	SET @rec = CURSOR SCROLL
    for select d.card_id, d.doc_copy_receiver_id from DF_SIMPLE_DOC d join DF_DOC dd on d.CARD_ID = dd.CARD_ID join wf_card c on dd.CARD_ID = c.id
	where (dd.IS_TEMPLATE = 0 or dd.IS_TEMPLATE is null) and c.DELETE_TS is null and d.doc_copy_receiver_id is not null and not exists (select a.id from TS_CARD_ACL a
	where a.CARD_ID = d.CARD_ID and a.USER_ID = (select e.USER_ID from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = d.doc_copy_receiver_id) and a.CODE = 13)

     OPEN @rec
    FETCH NEXT FROM @rec INTO @card_id, @doc_copy_receiver_id

    WHILE @@FETCH_STATUS = 0
	BEGIN
		select @user_id = e.USER_ID, @department_id = e.DEPARTMENT_ID from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = @doc_copy_receiver_id;
		insert into TS_CARD_ACL(id, create_ts, created_by, card_id, user_id, department_id, code)
			values(newid(), CURRENT_TIMESTAMP, USER, @card_id, @user_id, @department_id, 13);

		FETCH NEXT FROM @rec INTO @card_id, @doc_copy_receiver_id
	END
	CLOSE @rec;

	select @user_id = null, @card_id = null, @department_id = null, @doc_copy_receiver_id = null;

END;
^
exec insertAclEntry;
^
drop procedure insertAclEntry;