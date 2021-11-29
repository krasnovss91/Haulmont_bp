--$Id$
--Description:
ALTER TABLE df_doc ADD COLUMN available_for_all boolean^
UPDATE df_doc SET available_for_all=global WHERE is_template=false^