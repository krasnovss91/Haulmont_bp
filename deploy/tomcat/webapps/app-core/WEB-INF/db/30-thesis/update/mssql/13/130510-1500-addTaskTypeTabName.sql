--$Id$
--$Description : adds field Tab name to store user setting of additional fields tab name

alter table TM_TASK_TYPE add TAB_NAME varchar(30)^

update TM_TASK_TYPE set TAB_NAME = 'Доп. поля'^