--$Id$
--$Description:

update TM_TASK set EXECUTOR_ID = null where CARD_ID in (select ID from WF_CARD where STATE = ',Assigned,')
and START_TASK_TYPE = 1 and EXECUTOR_ID is not null;