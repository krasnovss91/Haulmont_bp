-- $Id$
-- Description:

alter table TM_SCHEDULE_TRIGGER drop column START_TIME;
alter table TM_SCHEDULE_TRIGGER add START_DATE timestamp;