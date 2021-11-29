alter table WF_PROC add FORBID_PROCESS_RESTART tinyint;
alter table WF_PROC add FORBID_RESTART_STATES varchar(1500);
^
update WF_PROC set FORBID_PROCESS_RESTART = 0 where FORBID_PROCESS_RESTART is null;

alter table WF_CARD_PROC add RESTART_FORBIDDEN tinyint;
^
update WF_CARD_PROC set RESTART_FORBIDDEN = 0 where RESTART_FORBIDDEN  is null;