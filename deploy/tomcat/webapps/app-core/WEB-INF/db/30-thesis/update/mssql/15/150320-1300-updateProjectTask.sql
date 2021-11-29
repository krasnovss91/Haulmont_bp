-- $Id$
-- Description:

update T set PROJECT_ID =
(select top 1 C.PROJECT_ID from TM_CARD_PROJECT C where C.CARD_ID = T.CARD_ID)
from TM_TASK T where PROJECT_ID IS NULL