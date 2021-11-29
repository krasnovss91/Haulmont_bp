update WF_CARD d set IS_EDM_INBOUND = true
where exists(select * from TS_EDM_SENDING e where e.doc_id = d.id and e.EDM_STATE in (0,1,2,3,4,5));