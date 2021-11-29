-- $Id$
-- Description:

update TM_TASK as T set PROJECT_ID =
(select C.PROJECT_ID from TM_CARD_PROJECT C where C.CARD_ID = T.CARD_ID limit 1) where PROJECT_ID IS NULL