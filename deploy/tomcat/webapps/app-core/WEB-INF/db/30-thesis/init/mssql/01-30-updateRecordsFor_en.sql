-- $Id$
-- Description:

--tm_priority
update TM_PRIORITY set NAME = 'Normal' where ID = '2562cb31-0ebc-477b-a124-1cc618108be3'; -- Нормальный
update TM_PRIORITY set NAME = 'High' where ID = '36518fcf-6fe9-42a9-ada2-e45b7e545cfa'; -- Высокий
update TM_PRIORITY set NAME = 'Low' where ID = '6d40219c-b258-45f0-96ef-2d3da048e76f'; -- Низкий
update TM_PRIORITY set NAME = 'Critical' where ID = '9567d315-1880-46ac-94ee-65de44e7e3e4'; -- Критический

--sec_role
update SEC_ROLE set LOC_NAME = 'Reference editor', DESCRIPTION = 'The role lets users edit references data'
    where NAME = 'ReferenceEditor';

update SEC_ROLE set LOC_NAME = 'Documents initiator', DESCRIPTION = 'The role lets users create documents/contracts and start processes'
    where NAME = 'doc_initiator';

update SEC_ROLE set LOC_NAME = 'Endorsement', DESCRIPTION = 'The role lets users endorse documents/contracts'
    where NAME = 'doc_endorsement';

update SEC_ROLE set LOC_NAME = 'Observer', DESCRIPTION = 'The role lets users receive notifications on the current state of the task'
    where NAME = 'task_observer';

update SEC_ROLE set LOC_NAME = 'Secretary', DESCRIPTION = 'The role lets users work with the office fnd register documents'
    where NAME = 'doc_secretary';

update SEC_ROLE set LOC_NAME = 'Task initiator', DESCRIPTION = 'The role lets users initiate the process "Task Management"'
    where NAME = 'task_initiator';

update SEC_ROLE set LOC_NAME = 'Simple user', DESCRIPTION = 'This role must be assigned to all users besides administrators'
    where NAME = 'SimpleUser';

update SEC_ROLE set LOC_NAME = 'Controller', DESCRIPTION = 'The role lets users check tasks and, if necessary, send them back for revision'
    where NAME = 'task_controller';

update SEC_ROLE set LOC_NAME = 'Approver', DESCRIPTION = 'The role lets users approve documents/contracts'
    where NAME = 'doc_approver';

update SEC_ROLE set LOC_NAME = 'Executor', DESCRIPTION = 'The role lets users execute tasks'
    where NAME = 'task_executor';

update SEC_ROLE set LOC_NAME = 'Task creator', DESCRIPTION = 'The role lets users create tasks'
    where NAME = 'task_creator';

update SEC_ROLE set LOC_NAME = 'Acquaintance', DESCRIPTION = 'The role lets users acquainted with the documents/contracts'
    where NAME = 'doc_acquaintance';

update SEC_ROLE set LOC_NAME = 'Schedule task creator', DESCRIPTION = 'The role lets users create scheduled tasks'
    where NAME = 'schedule_task_creator';

update SEC_ROLE set LOC_NAME = 'Department chief', DESCRIPTION = 'This role is assigned with the access group "Department Chief". The department must be write in at the appropriate employee card.'
    where NAME = 'DepartmentChief';

update SEC_ROLE set LOC_NAME = 'Subdivision chief', DESCRIPTION = 'This role is assigned with the access group "Subdivision Chief". The department must be write in at the appropriate employee card.'
    where NAME = 'SubdivisionChief';

update SEC_ROLE set LOC_NAME = 'User substitution editor', DESCRIPTION = 'The role lets users edit the directory "User substitution"'
    where NAME = 'UserSubstitutionEditor';

update SEC_ROLE set LOC_NAME = 'Access to the functions of the integration module with accounting systems', DESCRIPTION = 'Role lets users mark reference books and data to be unloaded in a third-party accounting systems'
    where NAME = 'AppIntegrationRole';

update SEC_ROLE set LOC_NAME = 'Documents publisher', DESCRIPTION = 'Documents publication on the portal'
    where NAME = 'doc_publisher';

update SEC_ROLE set LOC_NAME = 'Meeting creator', DESCRIPTION = 'The role lets users work with meetings'
    where NAME = 'meetingdoc_creator';

update SEC_ROLE set LOC_NAME = 'Portal integration', DESCRIPTION = 'The role lets users log in to the THESIS through a portal integration web service'
    where NAME = 'PortalIntegrationRole';

update SEC_ROLE set LOC_NAME = '', DESCRIPTION = 'The role provides system administration rights'
    where NAME = 'Administrators';

update SEC_ROLE set LOC_NAME = 'Archivist', DESCRIPTION = 'Archiving of office files'
    where NAME = 'Archivist';

update SEC_ROLE set LOC_NAME = 'Archive access', DESCRIPTION = 'Access to the cards in archive'
    where NAME = 'Archive access';

update SEC_ROLE set LOC_NAME = 'EDM curator', DESCRIPTION = 'The role lets user to send and receive EDM documents'
    where NAME = 'EdmCuratorRole';

--df_numerator
update DF_NUMERATOR set CODE = 'Meetings' where ID = '215C66B8-EF2E-6608-BD5D-59C3BAE94E5E'; -- Совещания
update DF_NUMERATOR set CODE = 'Attachments' where ID = '31DD46B2-2C00-11E3-BBE5-EF5C4A9D25E0'; -- Вложения
update DF_NUMERATOR set CODE = 'Documents and contracts' where ID = 'B3997576-456D-49E8-964A-24A247D4753D'; -- Документы и договоры
update DF_NUMERATOR set CODE = 'Annex to a contract' where ID = 'C91D9E66-0034-11E3-8CA5-3F77160974FF'; -- Приложение к договору
update DF_NUMERATOR set CODE = 'Supplementary agreement' where ID = 'F31DE086-0034-11E3-B761-873AA0372209'; -- Дополнительное соглашение
update DF_NUMERATOR set CODE = 'Instruction' where ID = 'C3B2F4A4-FE9E-11E2-A39A-83FE0D6B8DB7'; -- Инструкция
update DF_NUMERATOR set CODE = 'Letter' where ID = '70DFE954-FE9D-11E2-96E0-1F9C56FC4E22'; -- Письмо
update DF_NUMERATOR set CODE = 'Order' where ID = 'AB30B1B4-FE9E-11E2-9003-C79B48B9667D'; -- Приказ
update DF_NUMERATOR set CODE = 'Regulations' where ID = 'B8EE4D84-FE9E-11E2-8A75-2FF0C334CF13'; -- Регламент
update DF_NUMERATOR set CODE = 'Memorandum' where ID = 'D062C9F4-FE9E-11E2-A3FC-CF13C8FD96F7'; -- Служебная записка
update DF_NUMERATOR set CODE = 'Income' where ID = 'BEBC21E2-FCE0-40C6-9202-7CFFFF7CF88E'; -- Входящий
update DF_NUMERATOR set CODE = 'Outcome' where ID = '5618547C-A4C9-4BFD-A71E-D884CF49DF57'; -- Исходящий
update DF_NUMERATOR set CODE = 'Internal' where ID = '36708C7F-E232-4451-A239-3F5A8FA10726'; -- Внутренний
update DF_NUMERATOR set CODE = 'Inbound document (EDM)' where ID = '50055f2a-e04a-45f3-8773-f9538a8d5200'; -- Входящий документ (ЭДО)
update DF_NUMERATOR set CODE = 'Act' where ID = '2405864c-8875-4c59-8b35-b7ceb5727b2a'; -- Акт
update DF_NUMERATOR set CODE = 'Waybill' where ID = '42aa9005-7171-4815-a426-fe1d65cc809f'; -- Накладная
update DF_NUMERATOR set CODE = 'Bill' where ID = '6c4f01a3-f8a3-4104-b5c3-618cf8834c81'; -- Счет
update DF_NUMERATOR set CODE = 'Invoice' where ID = '8e3adb37-3f24-4076-b398-37fcd8c8e524'; -- Счет-фактура
update DF_NUMERATOR set CODE = 'UTD' where ID = '531c2ce3-1eb4-4872-90cc-6ffcb962f4ed'; -- УПД

--df_currency
update DF_CURRENCY set NAME = 'Rouble' where NAME = 'Рубль';


--tm_schedule_action_type
update TM_SCHEDULE_ACTION_TYPE set NAME = 'Task start' where NAME = 'Запуск задачи';

--sec_presentation
UPDATE SEC_PRESENTATION SET NAME = 'Extended' WHERE NAME = 'Расширенная';
UPDATE SEC_PRESENTATION SET NAME = 'Basic' WHERE NAME = 'Основная';

--sys_category
update SYS_CATEGORY set NAME = 'Contract' where ID = '9CD678E3-7978-4F53-A503-A36BCE3A76D6'; -- Договор
update SYS_CATEGORY set NAME = 'Letter' where ID = 'C40EA551-D399-4A11-B6BE-347CA5F27837'; -- Письмо
update SYS_CATEGORY set NAME = 'Supplementary agreement' where ID = '3C59F74C-FE98-11E2-9E49-A30CC182D375'; -- Дополнительное соглашение
update SYS_CATEGORY set NAME = 'Annex to a contract' where ID = '648A5B6C-FE98-11E2-89ED-635286AA63EB'; -- Приложение к договору
update SYS_CATEGORY set NAME = 'Order' where ID = '34370700-FE69-11E2-9D98-ABE6F3D1EEDC'; -- Приказ
update SYS_CATEGORY set NAME = 'Memorandum' where ID = '24E40C08-FE87-11E2-8C8A-3354B77DCB1F'; -- Служебная записка
update SYS_CATEGORY set NAME = 'Regulations' where ID = '44F912B6-FE8E-11E2-A6B7-5BB93C75E36B'; -- Регламент
update SYS_CATEGORY set NAME = 'Instruction' where ID = '7F1B0314-FE8E-11E2-85D5-F7A577D85B9F'; -- Инструкция
update SYS_CATEGORY set NAME = 'Meeting' where ID = '9415792F-C473-CBEB-D150-8AE687C4DCD2'; -- Совещание
update SYS_CATEGORY set NAME = 'Main' where ID = '836D02A0-68A9-4AA5-B11A-08E9B32C589B'; -- Основной
update SYS_CATEGORY set NAME = 'Inbound document (EDM)' where ID = 'e7b46d3e-ff89-4f64-8118-3cd057584b19'; -- Входящий документ (ЭДО)
update SYS_CATEGORY set NAME = 'Act' where ID = 'f147625a-4ea8-4507-956f-f07ed302a5f1'; -- Акт
update SYS_CATEGORY set NAME = 'Waybill' where ID = '512e83a3-d8c9-45f6-b0de-d1949a55bced'; -- Накладная
update SYS_CATEGORY set NAME = 'Bill' where ID = 'f808ab1c-e278-4034-b56b-30ac41cad9be'; -- Счет
update SYS_CATEGORY set NAME = 'Invoice' where ID = '0bfb4912-0207-49f9-83dd-3cd95f4be62a'; -- Счет-фактура
update SYS_CATEGORY set NAME = 'UTD' where ID = '99ab3f33-a7d7-48cf-bc5d-855f266b4270'; -- УПД

--df_category
update DF_CATEGORY set NAME = 'Human resources' where ID = '196FB6FC-EFAD-4143-808F-248D727D91F7'; -- 'По кадрам'
update DF_CATEGORY set NAME = 'Main' where ID = '56a88e8c-6ab2-427a-97fc-5897005fe8a1'; -- 'Основная'
update DF_CATEGORY set NAME = 'Administrative' where ID = 'fa88ac80-13ea-486b-b247-602818672fe5'; -- 'Административно-хозяйственная деятельность'
update DF_CATEGORY set NAME = 'Main activity' where ID = 'ce1e9051-ca5c-4341-a523-74c694a9635d'; -- 'Основной вид деятельности'

--tm_project_group
update TM_PROJECT_GROUP set NAME = 'Main project' where ID = 'b875aded-88e7-4090-9f81-a1a5fac75192'; -- Основной проект

--df_typical_resolution
update DF_TYPICAL_RESOLUTION set NAME = 'For review:', TEXT = 'For review:' where NAME = 'На рассмотрение:';
update DF_TYPICAL_RESOLUTION set NAME = 'To acquaint:', TEXT = 'To acquaint:' where NAME = 'Ознакомить:';

--df_organization
update DF_ORGANIZATION set NAME = 'Organization' where ID = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9'; -- Наша организация

-- df_doc_receiving_method
update DF_DOC_RECEIVING_METHOD set NAME = 'Via EDM operator' where ID = 'c566526e-674f-4dcb-871d-21a98f24d1d7'; -- Через оператора ЭДО