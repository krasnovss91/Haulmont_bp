alter table WF_PROC add column FORBID_PROCESS_RESTART boolean;
alter table WF_PROC add column FORBID_RESTART_STATES varchar(1500);
update WF_PROC set FORBID_PROCESS_RESTART = false where FORBID_PROCESS_RESTART is null;

alter table WF_CARD_PROC add column RESTART_FORBIDDEN boolean;
update WF_CARD_PROC set RESTART_FORBIDDEN = false where RESTART_FORBIDDEN  is null;