alter table DF_NUMERATOR add CODE varchar(255)^

update DF_NUMERATOR set CODE = NAME^

alter table DF_NUMERATOR rename column NAME to LOC_NAME^

update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Совещания"},{"language":"en","caption":"Meetings"}]}' where LOC_NAME = 'Совещания' or LOC_NAME = 'Meetings'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Вложения"},{"language":"en","caption":"Attachments"}]}' where LOC_NAME = 'Вложения' or LOC_NAME = 'Attachments'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Документы и договоры"},{"language":"en","caption":"Documents and contracts"}]}' where LOC_NAME = 'Документы и договоры' or LOC_NAME = 'Documents and contracts'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Приложение к договору"},{"language":"en","caption":"Annex to a contract"}]}' where LOC_NAME = 'Приложение к договору' or LOC_NAME = 'Annex to a contract'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Дополнительное соглашение"},{"language":"en","caption":"Supplementary agreement"}]}' where LOC_NAME = 'Дополнительное соглашение' or LOC_NAME = 'Supplementary agreement'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Инструкция"},{"language":"en","caption":"Instruction"}]}' where LOC_NAME = 'Инструкция' or LOC_NAME = 'Instruction'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Письмо"},{"language":"en","caption":"Letter"}]}' where LOC_NAME = 'Письмо' or LOC_NAME = 'Letter'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Приказ"},{"language":"en","caption":"Order"}]}' where LOC_NAME = 'Приказ' or LOC_NAME = 'Order'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Регламент"},{"language":"en","caption":"Regulations"}]}' where LOC_NAME = 'Регламент' or LOC_NAME = 'Regulations'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Служебная записка"},{"language":"en","caption":"Memorandum"}]}' where LOC_NAME = 'Служебная записка' or LOC_NAME = 'Memorandum'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Входящий"},{"language":"en","caption":"Income"}]}' where LOC_NAME = 'Входящий' or LOC_NAME = 'Income'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Исходящий"},{"language":"en","caption":"Outcome"}]}' where LOC_NAME = 'Исходящий' or LOC_NAME = 'Outcome'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Внутренний"},{"language":"en","caption":"Internal"}]}' where LOC_NAME = 'Внутренний' or LOC_NAME = 'Internal'^
update DF_NUMERATOR set LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Входящий документ (ЭДО)"},{"language":"en","caption":"Inbound document (EDM)"}]}' where LOC_NAME = 'Входящий документ (ЭДО)' or LOC_NAME = 'Inbound document (EDM)'^