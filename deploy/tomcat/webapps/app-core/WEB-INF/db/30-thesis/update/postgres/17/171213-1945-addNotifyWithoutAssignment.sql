alter table WF_PROC_ROLE add NOTIFY_WITHOUT_ASSIGNMENT boolean;

update WF_PROC_ROLE set NOTIFY_WITHOUT_ASSIGNMENT = false where NOTIFY_WITHOUT_ASSIGNMENT is null;

update WF_PROC_ROLE set NOTIFY_WITHOUT_ASSIGNMENT = true where CODE = '30-Controller' or code = '90-Observer';