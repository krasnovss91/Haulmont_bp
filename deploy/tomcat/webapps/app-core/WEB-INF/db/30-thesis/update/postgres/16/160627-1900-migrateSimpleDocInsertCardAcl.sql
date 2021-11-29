-- $Id$
-- Description:

CREATE OR REPLACE FUNCTION insertAclEntry()
RETURNS integer
AS $$
DECLARE
	rec refcursor;
	cardId uuid;
	userId uuid;
	docSenderId uuid;
	docReceiverId uuid;
	docCopyReceiverId uuid;
	departmentId uuid;
	r integer:=0;
BEGIN
    OPEN rec for execute 'select d.card_id, d.doc_sender_id from DF_SIMPLE_DOC d join DF_DOC dd on d.CARD_ID = dd.CARD_ID join wf_card c on dd.CARD_ID = c.id
	where (dd.IS_TEMPLATE = false or dd.IS_TEMPLATE is null) and c.DELETE_TS is null and doc_sender_id is not null and not exists (select a.id from TS_CARD_ACL a
	where a.CARD_ID = d.CARD_ID and a.USER_ID = (select e.USER_ID from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = d.doc_sender_id) and a.CODE = 11)';
	
    loop
	FETCH rec INTO cardId, docSenderId;
	EXIT WHEN not FOUND;
	select e.USER_ID, e.DEPARTMENT_ID into userId, departmentId from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = docSenderId;
	insert into TS_CARD_ACL(id, create_ts, created_by, card_id, user_id, department_id, code)
			values(newid(), CURRENT_TIMESTAMP, USER, cardId, userId, departmentId, 11);
    end loop;
    close rec;

    --------------------------------------------------------------

    OPEN rec for execute 'select d.card_id, d.doc_receiver_id from DF_SIMPLE_DOC d join DF_DOC dd on d.CARD_ID = dd.CARD_ID join wf_card c on dd.CARD_ID = c.id
	where (dd.IS_TEMPLATE = false or dd.IS_TEMPLATE is null) and c.DELETE_TS is null and d.doc_receiver_id is not null and not exists (select a.id from TS_CARD_ACL a
	where a.CARD_ID = d.CARD_ID and a.USER_ID = (select e.USER_ID from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = d.doc_receiver_id) and a.CODE = 12)';
	
    loop
	FETCH rec INTO cardId, docReceiverId;
	EXIT WHEN not FOUND;
	select e.USER_ID, e.DEPARTMENT_ID into userId, departmentId from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = docReceiverId;
	insert into TS_CARD_ACL(id, create_ts, created_by, card_id, user_id, department_id, code)
			values(newid(), CURRENT_TIMESTAMP, USER, cardId, userId, departmentId, 12);
    end loop;
    close rec;

    ---------------------------------------------------------------------------------
    
    OPEN rec for execute 'select d.card_id, d.doc_copy_receiver_id from DF_SIMPLE_DOC d join DF_DOC dd on d.CARD_ID = dd.CARD_ID join wf_card c on dd.CARD_ID = c.id
	where (dd.IS_TEMPLATE = false or dd.IS_TEMPLATE is null) and c.DELETE_TS is null and d.doc_copy_receiver_id is not null and not exists (select a.id from TS_CARD_ACL a
	where a.CARD_ID = d.CARD_ID and a.USER_ID = (select e.USER_ID from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = d.doc_copy_receiver_id) and a.CODE = 13)';
	
    loop
	FETCH rec INTO cardId, docCopyReceiverId;
	EXIT WHEN not FOUND;
	select e.USER_ID, e.DEPARTMENT_ID into userId, departmentId from DF_EMPLOYEE e where  e.CORRESPONDENT_ID = docCopyReceiverId;
	insert into TS_CARD_ACL(id, create_ts, created_by, card_id, user_id, department_id, code)
			values(newid(), CURRENT_TIMESTAMP, USER, cardId, userId, departmentId, 13);
    end loop;
    close rec;
    return r;

END;
$$
LANGUAGE plpgsql;
^
select insertAclEntry();
^
drop function if exists insertAclEntry();
