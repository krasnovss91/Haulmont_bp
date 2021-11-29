alter table WF_ASSIGNMENT add DTYPE varchar(50)^
alter table WF_CARD_PROC add DTYPE varchar(50)^

update WF_ASSIGNMENT set DTYPE = '10'^
update WF_CARD_PROC set DTYPE = '10'^