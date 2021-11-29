alter table WF_CARD add IS_EDM_INBOUND tinyint constraint WF_CARD_IS_EDM_INB_DEF default 0^
update WF_CARD set IS_EDM_INBOUND = 0^