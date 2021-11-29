--$Id$
--$Description :


delete from sys_file  where name is null and id not in (select file_id from wf_attachment);