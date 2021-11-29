-- $Id$

alter table DF_DOC add CONTRACTOR_ID uniqueidentifier^
alter table DF_DOC add constraint FK_DF_DOC_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID)^
create index IDX_DF_DOC_CONTRACTOR on DF_DOC (CONTRACTOR_ID)^

update d set CONTRACTOR_ID = c.CONTRACTOR_ID from DF_DOC d join DF_CONTRACT c on d.CARD_ID = c.CARD_ID where c.CONTRACTOR_ID is not null^

alter table DF_CONTRACT drop constraint FK_DF_CONTRACT_CONTRACTOR^
alter table DF_CONTRACT drop column CONTRACTOR_ID^