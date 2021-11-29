-- $Id$

alter table DF_DOC add AMOUNT numeric(19,4)^
alter table DF_DOC add VAT_INCLUSIVE tinyint^
alter table DF_DOC add VAT_RATE numeric(19,4)^
alter table DF_DOC add VAT_AMOUNT numeric(19,4)^
alter table DF_DOC add CURRENCY_ID uniqueidentifier^

alter table DF_DOC add constraint FK_DF_DOC_CURRENCY foreign key (CURRENCY_ID) references DF_CURRENCY (ID)^
create index IDX_DF_DOC_CURRENCY on DF_DOC (CURRENCY_ID)^

update d set AMOUNT = c.AMOUNT, VAT_INCLUSIVE = c.VAT_INCLUSIVE, VAT_RATE = c.VAT_RATE, VAT_AMOUNT = c.VAT_AMOUNT, CURRENCY_ID = c.CURRENCY_ID
    from DF_DOC d join DF_CONTRACT c on d.CARD_ID = c.CARD_ID^

alter table DF_CONTRACT drop constraint FK_DF_CONTRACT_CURRENCY^
alter table DF_CONTRACT drop column AMOUNT^
alter table DF_CONTRACT drop column VAT_INCLUSIVE^
alter table DF_CONTRACT drop column VAT_RATE^
alter table DF_CONTRACT drop column VAT_AMOUNT^
alter table DF_CONTRACT drop column CURRENCY_ID^