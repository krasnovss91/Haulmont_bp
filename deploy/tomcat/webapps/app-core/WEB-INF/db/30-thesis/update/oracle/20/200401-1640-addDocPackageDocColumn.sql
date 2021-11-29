alter table DF_DOC add PACKAGE_DOC_ID varchar2(32 char)^
alter table DF_DOC add constraint FK_DF_DOC_PACKAGE_DOC foreign key (PACKAGE_DOC_ID) references DF_PACKAGE_DOC(CARD_ID)^