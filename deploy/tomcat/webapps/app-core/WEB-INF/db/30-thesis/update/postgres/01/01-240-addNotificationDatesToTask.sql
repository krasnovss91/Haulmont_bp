-- $Id$
-- Description:

alter table TM_TASK drop notified;
alter table TM_TASK add OVERDUE_NOTIFIED varchar(1);