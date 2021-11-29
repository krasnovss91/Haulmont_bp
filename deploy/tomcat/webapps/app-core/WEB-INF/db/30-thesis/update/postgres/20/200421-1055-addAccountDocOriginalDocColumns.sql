alter table DF_ACCOUNT_DOC add ORIGIN_DOC_ID uuid^
alter table DF_ACCOUNT_DOC add constraint FK_ACCOUNT_DOC_ORIGIN_DOC foreign key (ORIGIN_DOC_ID) references DF_ACCOUNT_DOC(CARD_ID)^

alter table DF_ACCOUNT_DOC add ORIGIN_DOC_NO varchar(50)^

alter table DF_ACCOUNT_DOC add ORIGIN_DOC_DATE date^

---

alter table DF_ACCOUNT_DOC add ORIGIN_REV_DOC_ID uuid^
alter table DF_ACCOUNT_DOC add constraint FK_ACCOUNT_DOC_ORIGIN_REV_DOC foreign key (ORIGIN_REV_DOC_ID) references DF_ACCOUNT_DOC(CARD_ID)^

alter table DF_ACCOUNT_DOC add ORIGIN_REV_DOC_NO varchar(50)^

alter table DF_ACCOUNT_DOC add ORIGIN_REV_DOC_DATE date^

---

alter table DF_ACCOUNT_DOC add ORIGIN_COR_DOC_ID uuid^
alter table DF_ACCOUNT_DOC add constraint FK_ACCOUNT_DOC_ORIGIN_COR_DOC foreign key (ORIGIN_COR_DOC_ID) references DF_ACCOUNT_DOC(CARD_ID)^

alter table DF_ACCOUNT_DOC add ORIGIN_COR_DOC_NO varchar(50)^

alter table DF_ACCOUNT_DOC add ORIGIN_COR_DOC_DATE date^
