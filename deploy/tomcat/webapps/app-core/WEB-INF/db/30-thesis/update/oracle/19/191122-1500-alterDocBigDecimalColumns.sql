alter table DF_DOC add AMOUNT_TEMP numeric(19,2)^
alter table DF_DOC add VAT_RATE_TEMP numeric(19,2)^
alter table DF_DOC add VAT_AMOUNT_TEMP numeric(19,2)^

update DF_DOC set AMOUNT_TEMP = AMOUNT^
update DF_DOC set VAT_RATE_TEMP = VAT_RATE^
update DF_DOC set VAT_AMOUNT_TEMP = VAT_AMOUNT^

update DF_DOC set AMOUNT = null^
update DF_DOC set VAT_RATE = null^
update DF_DOC set VAT_AMOUNT = null^

alter table DF_DOC modify AMOUNT numeric(19,2)^
alter table DF_DOC modify VAT_RATE numeric(19,2)^
alter table DF_DOC modify VAT_AMOUNT numeric(19,2)^

update DF_DOC set AMOUNT = AMOUNT_TEMP^
update DF_DOC set VAT_RATE = VAT_RATE_TEMP^
update DF_DOC set VAT_AMOUNT = VAT_AMOUNT_TEMP^

alter table DF_DOC drop column AMOUNT_TEMP^
alter table DF_DOC drop column VAT_RATE_TEMP^
alter table DF_DOC drop column VAT_AMOUNT_TEMP^
