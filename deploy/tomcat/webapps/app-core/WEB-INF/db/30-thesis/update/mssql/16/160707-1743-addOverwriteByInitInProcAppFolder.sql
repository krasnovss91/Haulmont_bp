-- $Id$
-- Description:
alter table WF_PROC_APP_FOLDER add OVERWRITE_BY_INIT tinyint^
update SYS_FOLDER set folder_type='T' where folder_type='P'^
update WF_PROC_APP_FOLDER set OVERWRITE_BY_INIT = 1^