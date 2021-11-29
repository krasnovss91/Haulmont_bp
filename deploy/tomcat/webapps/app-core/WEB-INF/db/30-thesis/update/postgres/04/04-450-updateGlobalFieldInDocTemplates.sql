-- $Id$
-- Description
UPDATE df_doc SET "global"='FALSE'
WHERE is_template='TRUE' and "global" is null;