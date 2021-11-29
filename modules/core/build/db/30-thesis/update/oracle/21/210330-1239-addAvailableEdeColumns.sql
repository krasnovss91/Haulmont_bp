alter table WF_PROC add AVAILABLE_EDE char(1)^
update WF_PROC set AVAILABLE_EDE = 0 where AVAILABLE_EDE is null^