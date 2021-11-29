--$Id$

alter table TM_TASK_PATTERN add PROJECT_ID uniqueidentifier;

alter table TM_TASK_PATTERN add constraint FK_TASK_PATTERN_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID);