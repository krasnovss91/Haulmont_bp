update d set IS_EDM_INBOUND = 1 from WF_CARD d
where exists(select * from TS_EDM_SENDING e where e.doc_id = d.id and e.EDM_STATE in (0,1,2,3,4,5));