-- $Id$

update wf_proc set  available_for_mobile_client = true
where jbpm_process_key in ('TaskManagement', 'Acquaintance', 'Resolution', 'Endorsement', 'ProtocolEndorsement', 'AgendaEndorsement');