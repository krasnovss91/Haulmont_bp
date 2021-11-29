--$Id$
--Description
DECLARE @dfpId uniqueidentifier;

select @dfpId= id from  DF_POSITION where name is null or name='';
update DF_EMPLOYEE set position_id=null where position_id in(@dfpId)^
delete from DF_POSITION where name is null or name=''^