alter table wf_card_comment add state varchar(255);
alter table wf_card_comment add ATTACHMENT_NAME varchar(500);
alter table wf_card_comment add CARD_ATTACHMENT_ID uniqueidentifier;
alter table wf_card_comment add COMMENT_TYPE varchar(1);
alter table wf_card_comment add ASSIGNMENT_ID uniqueidentifier;

alter table wf_card_comment
add constraint FK_TS_CARD_COMMENT_WF_CARD_ATTACHMENT foreign key (CARD_ATTACHMENT_ID) references WF_ATTACHMENT(ID);

alter table wf_card_comment
add constraint FK_TS_CARD_COMMENT_WF_ASSIGNMENT foreign key (ASSIGNMENT_ID) references WF_ASSIGNMENT(ID);