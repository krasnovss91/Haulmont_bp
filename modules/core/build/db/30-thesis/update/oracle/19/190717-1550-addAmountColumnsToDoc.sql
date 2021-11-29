-- $Id$

alter table DF_DOC add AMOUNT numeric(19,4)^
alter table DF_DOC add VAT_INCLUSIVE char(1)^
alter table DF_DOC add VAT_RATE numeric(19,4)^
alter table DF_DOC add VAT_AMOUNT numeric(19,4)^
alter table DF_DOC add CURRENCY_ID varchar2(32 char)^

alter table DF_DOC add constraint FK_DF_DOC_CURRENCY foreign key (CURRENCY_ID) references DF_CURRENCY (ID)^
create index IDX_DF_DOC_CURRENCY on DF_DOC (CURRENCY_ID)^

update DF_DOC d set (AMOUNT, VAT_INCLUSIVE, VAT_RATE, VAT_AMOUNT, CURRENCY_ID) =
    (select c.AMOUNT, c.VAT_INCLUSIVE, c.VAT_RATE, c.VAT_AMOUNT, c.CURRENCY_ID from DF_CONTRACT c where d.CARD_ID = c.CARD_ID)
    where exists (select 1 from DF_CONTRACT con where d.CARD_ID = con.CARD_ID)^

alter table DF_CONTRACT drop constraint FK_DF_CONTRACT_CURRENCY^
alter table DF_CONTRACT drop column AMOUNT^
alter table DF_CONTRACT drop column VAT_INCLUSIVE^
alter table DF_CONTRACT drop column VAT_RATE^
alter table DF_CONTRACT drop column VAT_AMOUNT^
alter table DF_CONTRACT drop column CURRENCY_ID^