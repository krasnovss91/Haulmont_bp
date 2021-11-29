alter table WF_CARD_COMMENT_USER add IS_READ tinyint;
alter table WF_CARD_COMMENT_USER add CREATE_TS datetime;
alter table WF_CARD_COMMENT_USER add CREATED_BY varchar(50);
alter table WF_CARD_COMMENT_USER add ID uniqueidentifier;
alter table WF_CARD_COMMENT_USER add VERSION integer;
alter table WF_CARD_COMMENT_USER add UPDATE_TS datetime;
alter table WF_CARD_COMMENT_USER add UPDATED_BY varchar(50);
alter table WF_CARD_COMMENT_USER add DELETE_TS datetime;
alter table WF_CARD_COMMENT_USER add DELETED_BY varchar(50);
^

alter table WF_CARD_COMMENT_USER add constraint FK_WF_CARD_COMMENT_USER_TO_WF_CARD_COMMENT
foreign key (CARD_COMMENT_ID) references WF_CARD_COMMENT(ID);

alter table WF_CARD_COMMENT_USER add constraint FK_WF_CARD_COMMENT_USER_TO_SEC_USER
foreign key (USER_ID) references SEC_USER(ID);
^

update WF_CARD_COMMENT_USER set id=newid(), create_ts=CURRENT_TIMESTAMP, update_ts=CURRENT_TIMESTAMP, version=1, CREATED_BY='admin', UPDATED_BY='admin', IS_READ=1;