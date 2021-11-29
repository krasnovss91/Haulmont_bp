-- $Id$
alter table WF_PROC add column AVAILABLE_FOR_MOBILE_CLIENT boolean;
update wf_proc set AVAILABLE_FOR_MOBILE_CLIENT = false where AVAILABLE_FOR_MOBILE_CLIENT is null;