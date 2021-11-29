update wf_proc
set card_types = card_types + 'df$PackageDoc,'
where jbpm_process_key = 'Endorsement' and card_types like '%,' and card_types not like '%df$PackageDoc%'^

update wf_proc
set card_types = card_types + ',df$PackageDoc,'
where jbpm_process_key = 'Endorsement' and card_types not like '%,' and card_types not like '%df$PackageDoc%'^