-- $Id$

update wf_proc set  available_for_mobile_client = 1
where jbpm_process_key in ('TaskManagement', 'Acquaintance', 'Resolution', 'Endorsement', 'ProtocolEndorsement', 'AgendaEndorsement');