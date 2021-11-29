alter table DF_NUMERATOR add CODE varchar2(255 char)^

update DF_NUMERATOR set CODE = NAME^

alter table DF_NUMERATOR rename column NAME to LOC_NAME^

update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Совещания"},{"language":"en","caption":"Meetings"}]}' where dbms_lob.compare(LOC_NAME, 'Совещания') = 0 or dbms_lob.compare(LOC_NAME, 'Meetings') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Вложения"},{"language":"en","caption":"Attachments"}]}' where dbms_lob.compare(LOC_NAME, 'Вложения') = 0 or dbms_lob.compare(LOC_NAME, 'Attachments') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Документы и договоры"},{"language":"en","caption":"Documents and contracts"}]}' where dbms_lob.compare(LOC_NAME, 'Документы и договоры') = 0 or dbms_lob.compare(LOC_NAME, 'Documents and contracts') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Приложение к договору"},{"language":"en","caption":"Annex to a contract"}]}' where dbms_lob.compare(LOC_NAME, 'Приложение к договору') = 0 or dbms_lob.compare(LOC_NAME, 'Annex to a contract') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Дополнительное соглашение"},{"language":"en","caption":"Supplementary agreement"}]}' where dbms_lob.compare(LOC_NAME, 'Дополнительное соглашение') = 0 or dbms_lob.compare(LOC_NAME, 'Supplementary agreement') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Инструкция"},{"language":"en","caption":"Instruction"}]}' where dbms_lob.compare(LOC_NAME, 'Инструкция') = 0 or dbms_lob.compare(LOC_NAME, 'Instruction') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Письмо"},{"language":"en","caption":"Letter"}]}' where dbms_lob.compare(LOC_NAME, 'Письмо') = 0 or dbms_lob.compare(LOC_NAME, 'Letter') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Приказ"},{"language":"en","caption":"Order"}]}' where dbms_lob.compare(LOC_NAME, 'Приказ') = 0 or dbms_lob.compare(LOC_NAME, 'Order') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Регламент"},{"language":"en","caption":"Regulations"}]}' where dbms_lob.compare(LOC_NAME, 'Регламент') = 0 or dbms_lob.compare(LOC_NAME, 'Regulations') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Служебная записка"},{"language":"en","caption":"Memorandum"}]}' where dbms_lob.compare(LOC_NAME, 'Служебная записка') = 0 or dbms_lob.compare(LOC_NAME, 'Memorandum') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Входящий"},{"language":"en","caption":"Income"}]}' where dbms_lob.compare(LOC_NAME, 'Входящий') = 0 or dbms_lob.compare(LOC_NAME, 'Income') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Исходящий"},{"language":"en","caption":"Outcome"}]}' where dbms_lob.compare(LOC_NAME, 'Исходящий') = 0 or dbms_lob.compare(LOC_NAME, 'Outcome') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Внутренний"},{"language":"en","caption":"Internal"}]}' where dbms_lob.compare(LOC_NAME, 'Внутренний') = 0 or dbms_lob.compare(LOC_NAME, 'Internal') = 0^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Входящий документ (ЭДО)"},{"language":"en","caption":"Inbound document (EDM)"}]}' where dbms_lob.compare(LOC_NAME, 'Входящий документ (ЭДО)') = 0 or dbms_lob.compare(LOC_NAME, 'Inbound document (EDM)') = 0^