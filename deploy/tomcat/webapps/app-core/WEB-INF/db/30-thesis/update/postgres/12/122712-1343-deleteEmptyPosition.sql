--$Id$
--Description

update DF_EMPLOYEE set position_id=null where position_id in(select id from  DF_POSITION where name is null or name='')^
delete from DF_POSITION where name is null or name=''^