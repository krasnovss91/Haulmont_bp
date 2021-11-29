-- $Id$
alter table WF_PROC add AVAILABLE_FOR_MOBILE_CLIENT tinyint^
update wf_proc set AVAILABLE_FOR_MOBILE_CLIENT = 0 where AVAILABLE_FOR_MOBILE_CLIENT is null;