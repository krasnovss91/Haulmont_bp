-- $Id$
-- Description:

update sys_category s set deleted_by = 'admin', delete_ts = now()
where exists (select * from df_doc_kind d where d.delete_ts is not null and d.category_id = s.id);