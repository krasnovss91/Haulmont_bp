--$Id$
--Description:
ALTER TABLE df_doc ADD available_for_all tinyint^
UPDATE df_doc SET available_for_all=global WHERE is_template=0^