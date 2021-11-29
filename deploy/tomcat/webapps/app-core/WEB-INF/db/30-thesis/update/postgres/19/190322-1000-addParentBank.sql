-- $Id$
alter table DF_BANK add PARENT_BANK_ID uuid;
alter table DF_BANK add constraint FK_DF_BANK_PARENT_BANK foreign key (PARENT_BANK_ID) references DF_BANK(ID);