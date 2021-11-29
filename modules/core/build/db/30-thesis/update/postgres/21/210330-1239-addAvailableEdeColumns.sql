alter table WF_PROC add column AVAILABLE_EDE boolean^
update WF_PROC set AVAILABLE_EDE = false where AVAILABLE_EDE is null^