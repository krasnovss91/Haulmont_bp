-- $Id$

alter table DF_DOC add CONTRACTOR_ID varchar2(32 char)^
alter table DF_DOC add constraint FK_DF_DOC_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID)^
create index IDX_DF_DOC_CONTRACTOR on DF_DOC (CONTRACTOR_ID)^

update DF_DOC d set d.CONTRACTOR_ID = (select c.CONTRACTOR_ID from DF_CONTRACT c where c.CARD_ID = d.CARD_ID)
  where exists (select con.CARD_ID from DF_CONTRACT con where con.CARD_ID = d.CARD_ID and con.CONTRACTOR_ID is not null)^

alter table DF_CONTRACT drop constraint FK_DF_CONTRACT_CONTRACTOR^
alter table DF_CONTRACT drop column CONTRACTOR_ID^