-- $Id$
-- Description:

update DF_DOC set REG_DATE = null where REGISTERED = 'false' and REG_NO is null;