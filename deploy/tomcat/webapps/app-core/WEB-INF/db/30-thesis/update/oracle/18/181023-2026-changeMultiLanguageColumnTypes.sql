-- $Id$

alter table DF_NUMERATOR add temp_loc_name varchar2(2000 char)^
alter table SEC_GROUP add temp_loc_name varchar2(2000 char)^
alter table WF_PROC add temp_loc_name varchar2(2000 char)^
alter table WF_PROC_ROLE add temp_loc_name varchar2(2000 char)^

-- client databases won't contain columns which length exceeds 2000
update DF_NUMERATOR set temp_loc_name = dbms_lob.substr(loc_name, 2000, 1)^
update SEC_GROUP set temp_loc_name = dbms_lob.substr(loc_name, 2000, 1)^
update WF_PROC set temp_loc_name = dbms_lob.substr(loc_name, 2000, 1)^
update WF_PROC_ROLE set temp_loc_name = dbms_lob.substr(loc_name, 2000, 1)^

alter table DF_NUMERATOR drop column loc_name^
alter table SEC_GROUP drop column loc_name^
alter table WF_PROC drop column loc_name^
alter table WF_PROC_ROLE drop column loc_name^

alter table DF_NUMERATOR rename column temp_loc_name to loc_name^
alter table SEC_GROUP rename column temp_loc_name to loc_name^
alter table WF_PROC rename column temp_loc_name to loc_name^
alter table WF_PROC_ROLE rename column temp_loc_name to loc_name^