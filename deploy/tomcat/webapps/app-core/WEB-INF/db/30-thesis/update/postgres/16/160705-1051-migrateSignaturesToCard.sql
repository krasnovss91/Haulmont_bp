-- $Id$
-- Description:

alter table WF_CARD add SIGNATURES text;
^
update WF_CARD c set SIGNATURES = d.SIGNATURES from DF_DOC d where c.ID = d.Card_ID and d.SIGNATURES is not null;
^
alter table DF_DOC drop column SIGNATURES;
