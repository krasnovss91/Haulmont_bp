UPDATE df_doc_kind_report_report
   SET delete_ts = null, deleted_by = null
 WHERE category_id = '9415792f-c473-cbeb-d150-8ae687c4dcd2'
   AND report_id IN (SELECT id FROM report_report WHERE code = 'EndorsementList')
   AND deleted_by = 'system';