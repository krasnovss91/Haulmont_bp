-- $Id$

update WF_PROC set CARD_TYPES = regexp_replace(CARD_TYPES, ',df\$AccountDoc', '') where JBPM_PROCESS_KEY in ('Endorsement','Acquaintance','Registration')^
update WF_PROC set CARD_TYPES = CARD_TYPES || 'df$AccountDoc,' where JBPM_PROCESS_KEY in ('Endorsement','Acquaintance','Registration')^