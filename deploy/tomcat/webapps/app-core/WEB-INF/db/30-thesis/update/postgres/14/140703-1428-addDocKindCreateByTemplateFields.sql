-- $Id$
-- Description:

alter table df_doc_kind add CREATE_ONLY_BY_TEMPLATE boolean;
alter table df_doc_kind add DISABLE_ADD_PROCESS_ACTORS boolean;

update df_doc_kind set create_only_by_template = false where create_only_by_template is null;
update df_doc_kind set disable_add_process_actors = false where disable_add_process_actors is null^