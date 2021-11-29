-- $Id$
-- Description:

update DF_DOC set REG_DATE = null where REGISTERED = 0 and REG_NO is null;