-- $Id$

update WF_PROC set AVAILABLE_FOR_MOBILE_CLIENT = 1 where JBPM_PROCESS_KEY = 'Endorsement';
update WF_PROC set AVAILABLE_FOR_MOBILE_CLIENT = 0 where JBPM_PROCESS_KEY = 'Registration';