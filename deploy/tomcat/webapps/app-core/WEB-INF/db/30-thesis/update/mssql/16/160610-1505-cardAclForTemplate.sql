
alter table TS_CARD_ACL add TEMPLATE_ID uniqueidentifier;
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_TEMPLATE_WF_CARD foreign key (TEMPLATE_ID) references WF_CARD(ID);
create index IDX_TS_CARD_ACL_TEMPLATE_WF_CARD on TS_CARD_ACL(TEMPLATE_ID);
^

--migrate cardAcl for template
insert into TS_CARD_ACL (ID, CREATE_TS, CREATED_BY, ENTITY, USER_ID, CARD_ROLE_ID, ORGANIZATION_ID, GLOBAL, DESCRIPTION, DEPARTMENT_ID, CODE, BASE_ACL_ID, TEMPLATE_ID)
  select newid(), CREATE_TS, CREATED_BY, ENTITY, USER_ID, CARD_ROLE_ID, ORGANIZATION_ID, GLOBAL, DESCRIPTION, DEPARTMENT_ID, CODE, BASE_ACL_ID, CARD_ID
  from TS_CARD_ACL as acl where exists (select * from DF_DOC as d where d.CARD_ID = acl.CARD_ID and d.IS_TEMPLATE = 1) and acl.CODE = 4;