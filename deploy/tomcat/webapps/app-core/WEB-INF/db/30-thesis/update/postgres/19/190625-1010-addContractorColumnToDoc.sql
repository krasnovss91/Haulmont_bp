-- $Id$

alter table DF_DOC add CONTRACTOR_ID uuid^
alter table DF_DOC add constraint FK_DF_DOC_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID)^
create index IDX_DF_DOC_CONTRACTOR on DF_DOC (CONTRACTOR_ID)^

update DF_DOC as d set CONTRACTOR_ID = c.CONTRACTOR_ID from DF_CONTRACT c where d.CARD_ID = c.CARD_ID and c.CONTRACTOR_ID is not null^

alter table DF_CONTRACT drop constraint FK_DF_CONTRACT_CONTRACTOR^
alter table DF_CONTRACT drop column CONTRACTOR_ID^