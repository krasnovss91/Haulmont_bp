-- $Id$

update SEC_ROLE set NAME = 'EdmCuratorRole', LOC_NAME = 'Куратор ЭДО' where NAME = 'OperatorEdmRole'^

update WF_CARD_ROLE set CODE = 'EdmCurator' where PROC_ROLE_ID in
    (select ID from WF_PROC_ROLE where CODE = 'OperatorEdm' and PROC_ID in (select ID from WF_PROC where JBPM_PROCESS_KEY in ('EdmReceiving', 'Endorsement')))^

update WF_PROC_ROLE set CODE = 'EdmCurator', NAME = 'Куратор ЭДО',
    LOC_NAME = '{"captionWithLanguageList":[{"language":"ru","caption":"Куратор ЭДО"},{"language":"en","caption":"EDM curator"}]}'
    where CODE = 'OperatorEdm' and PROC_ID in (select ID from WF_PROC where JBPM_PROCESS_KEY in ('EdmReceiving', 'Endorsement'))^