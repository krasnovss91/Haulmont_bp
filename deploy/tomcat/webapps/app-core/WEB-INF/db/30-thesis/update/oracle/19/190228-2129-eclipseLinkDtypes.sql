alter table WF_ASSIGNMENT add DTYPE varchar2(50 char)^
alter table WF_CARD_PROC add DTYPE varchar2(50 char)^

update WF_ASSIGNMENT set DTYPE = '10'^
update WF_CARD_PROC set DTYPE = '10'^