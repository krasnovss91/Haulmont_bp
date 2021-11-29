
update SYS_SCHEDULED_TASK
    set METHOD_NAME = 'synchronizeByScheduler'
    where BEAN_NAME = 'thesis_ActiveDirectorySynchronizationWorker' and METHOD_NAME = 'integrateByScheduler';