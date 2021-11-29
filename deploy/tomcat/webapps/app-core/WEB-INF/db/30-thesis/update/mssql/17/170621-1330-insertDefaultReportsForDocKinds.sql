-- $Id
--Регламент ~ Печать регламента
CREATE PROCEDURE baseInsert
AS
BEGIN
  DECLARE @cnt integer;
select @cnt = count(ID) from SYS_CATEGORY where ID = '44f912b6-fe8e-11e2-a6b7-5bb93c75e36b' and DELETE_TS is null;
  if(@cnt > 0) begin
     select @cnt = count(ID) from REPORT_REPORT where ID = 'e973ce05-db77-4f60-ba36-5645246536de';
        if(@cnt > 0) begin
          select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
          where CATEGORY_ID = '44f912b6-fe8e-11e2-a6b7-5bb93c75e36b'
          and REPORT_ID = 'e973ce05-db77-4f60-ba36-5645246536de';
	    if(@cnt = 0) begin
            insert into DF_DOC_KIND_REPORT_REPORT (ID, CATEGORY_ID, REPORT_ID, DELETE_TS, DELETED_BY)
            values (newID(),'44f912b6-fe8e-11e2-a6b7-5bb93c75e36b', 'e973ce05-db77-4f60-ba36-5645246536de', CURRENT_TIMESTAMP, 'admin');
	    end;
     end;
end;

--Инструкция ~ Печать инструкции
select @cnt = count(ID) from SYS_CATEGORY where ID = '7f1b0314-fe8e-11e2-85d5-f7a577d85b9f' and DELETE_TS is null;
  if(@cnt > 0) begin
     select @cnt = count(ID) from REPORT_REPORT where ID = 'b147156f-c505-48cc-9736-37c786984cac';
        if(@cnt > 0) begin
          select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
          where CATEGORY_ID = '7f1b0314-fe8e-11e2-85d5-f7a577d85b9f'
          and REPORT_ID = 'b147156f-c505-48cc-9736-37c786984cac';
	    if(@cnt = 0) begin
            insert into DF_DOC_KIND_REPORT_REPORT (ID, CATEGORY_ID, REPORT_ID, DELETE_TS, DELETED_BY)
            values (newID(),'7f1b0314-fe8e-11e2-85d5-f7a577d85b9f', 'b147156f-c505-48cc-9736-37c786984cac', CURRENT_TIMESTAMP, 'admin');
	    end;
     end;
end;

--Договор ~ Печатная форма типового договора
select @cnt = count(ID) from SYS_CATEGORY where ID = '9cd678e3-7978-4f53-a503-a36bce3a76d6' and DELETE_TS is null;
  if(@cnt > 0) begin
     select @cnt = count(ID) from REPORT_REPORT where ID = 'ffeb2250-c2ca-46c2-9e42-42c771c6d5e3';
        if(@cnt > 0) begin
          select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
          where CATEGORY_ID = '9cd678e3-7978-4f53-a503-a36bce3a76d6'
          and REPORT_ID = 'ffeb2250-c2ca-46c2-9e42-42c771c6d5e3';
	    if(@cnt = 0) begin
            insert into DF_DOC_KIND_REPORT_REPORT (ID, CATEGORY_ID, REPORT_ID, DELETE_TS, DELETED_BY)
            values (newID(),'9cd678e3-7978-4f53-a503-a36bce3a76d6', 'ffeb2250-c2ca-46c2-9e42-42c771c6d5e3', CURRENT_TIMESTAMP, 'admin');
	    end;
     end;
end;

  --Письмо ~ Печать письма
select @cnt = count(ID) from SYS_CATEGORY where ID = 'c40ea551-d399-4a11-b6be-347ca5f27837' and DELETE_TS is null;
  if(@cnt > 0) begin
     select @cnt = count(ID) from REPORT_REPORT where ID = 'f4d67569-ad56-417f-a6dd-c7fcdd9785d5';
        if(@cnt > 0) begin
          select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
          where CATEGORY_ID = 'c40ea551-d399-4a11-b6be-347ca5f27837'
          and REPORT_ID = 'f4d67569-ad56-417f-a6dd-c7fcdd9785d5';
	    if(@cnt = 0) begin
            insert into DF_DOC_KIND_REPORT_REPORT (ID, CATEGORY_ID, REPORT_ID, DELETE_TS, DELETED_BY)
            values (newID(),'c40ea551-d399-4a11-b6be-347ca5f27837', 'f4d67569-ad56-417f-a6dd-c7fcdd9785d5', CURRENT_TIMESTAMP, 'admin');
	    end;
     end;
end;

  --Дополнительное соглашение ~ Печать дополнительного соглашения
select @cnt = count(ID) from SYS_CATEGORY where ID = '3c59f74c-fe98-11e2-9e49-a30cc182d375' and DELETE_TS is null;
  if(@cnt > 0) begin
     select @cnt = count(ID) from REPORT_REPORT where ID = 'f03ee4fe-4e48-465d-b166-9ba5579dc2f9';
        if(@cnt > 0) begin
          select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
          where CATEGORY_ID = '3c59f74c-fe98-11e2-9e49-a30cc182d375'
          and REPORT_ID = 'f03ee4fe-4e48-465d-b166-9ba5579dc2f9';
	    if(@cnt = 0) begin
            insert into DF_DOC_KIND_REPORT_REPORT (ID, CATEGORY_ID, REPORT_ID, DELETE_TS, DELETED_BY)
            values (newID(),'3c59f74c-fe98-11e2-9e49-a30cc182d375', 'f03ee4fe-4e48-465d-b166-9ba5579dc2f9', CURRENT_TIMESTAMP, 'admin');
	    end;
     end;
end;

  --Приложение к договору ~ Печать приложения к договору
select @cnt = count(ID) from SYS_CATEGORY where ID = '648a5b6c-fe98-11e2-89ed-635286aa63eb' and DELETE_TS is null;
  if(@cnt > 0) begin
     select @cnt = count(ID) from REPORT_REPORT where ID = '99d922c9-5e97-40ea-87bd-2d793da78c23';
        if(@cnt > 0) begin
          select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
          where CATEGORY_ID = '648a5b6c-fe98-11e2-89ed-635286aa63eb'
          and REPORT_ID = '99d922c9-5e97-40ea-87bd-2d793da78c23';
	    if(@cnt = 0) begin
            insert into DF_DOC_KIND_REPORT_REPORT (ID, CATEGORY_ID, REPORT_ID, DELETE_TS, DELETED_BY)
            values (newID(),'648a5b6c-fe98-11e2-89ed-635286aa63eb', '99d922c9-5e97-40ea-87bd-2d793da78c23', CURRENT_TIMESTAMP, 'admin');
	    end;
     end;
end;

  --Приказ ~ Печать приказа
select @cnt = count(ID) from SYS_CATEGORY where ID = '34370700-fe69-11e2-9d98-abe6f3d1eedc' and DELETE_TS is null;
  if(@cnt > 0) begin
     select @cnt = count(ID) from REPORT_REPORT where ID = 'fb5c1c08-491c-44c0-bae7-fa921a1020ec';
        if(@cnt > 0) begin
          select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
          where CATEGORY_ID = '34370700-fe69-11e2-9d98-abe6f3d1eedc'
          and REPORT_ID = 'fb5c1c08-491c-44c0-bae7-fa921a1020ec';
	    if(@cnt = 0) begin
            insert into DF_DOC_KIND_REPORT_REPORT (ID, CATEGORY_ID, REPORT_ID, DELETE_TS, DELETED_BY)
            values (newID(),'34370700-fe69-11e2-9d98-abe6f3d1eedc', 'fb5c1c08-491c-44c0-bae7-fa921a1020ec', CURRENT_TIMESTAMP, 'admin');
	    end;
     end;
end;

    --Служебная записка ~ Печать служебной записки
select @cnt = count(ID) from SYS_CATEGORY where ID = '24e40c08-fe87-11e2-8c8a-3354b77dcb1f' and DELETE_TS is null;
  if(@cnt > 0) begin
     select @cnt = count(ID) from REPORT_REPORT where ID = 'e5a5d959-372b-4ca3-93da-7902c21b2c05';
        if(@cnt > 0) begin
          select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
          where CATEGORY_ID = '24e40c08-fe87-11e2-8c8a-3354b77dcb1f'
          and REPORT_ID = 'e5a5d959-372b-4ca3-93da-7902c21b2c05';
	    if(@cnt = 0) begin
            insert into DF_DOC_KIND_REPORT_REPORT (ID, CATEGORY_ID, REPORT_ID, DELETE_TS, DELETED_BY)
            values (newID(),'24e40c08-fe87-11e2-8c8a-3354b77dcb1f', 'e5a5d959-372b-4ca3-93da-7902c21b2c05', CURRENT_TIMESTAMP, 'admin');
	    end;
     end;
end;
END;
^
exec baseInsert;
^
drop procedure baseInsert;