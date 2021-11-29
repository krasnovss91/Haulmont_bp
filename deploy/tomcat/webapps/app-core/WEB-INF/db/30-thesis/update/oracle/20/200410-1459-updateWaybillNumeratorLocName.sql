update DF_NUMERATOR
set LOC_NAME = '{"captionWithLanguageList": [{"language":"ru","caption":"Товарная накладная"},{"language":"en","caption":"Waybill"}] }'
where ID = '42aa900571714815a426fe1d65cc809f' and LOC_NAME like '%"caption":"Накладная"%'^