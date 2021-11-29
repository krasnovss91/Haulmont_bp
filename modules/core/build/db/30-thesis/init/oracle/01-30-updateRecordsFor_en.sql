
update TM_PRIORITY set NAME = 'Normal' where ID = '2562cb310ebc477ba1241cc618108be3'^
update TM_PRIORITY set NAME = 'High' where ID = '36518fcf6fe942a9ada2e45b7e545cfa'^
update TM_PRIORITY set NAME = 'Low' where ID = '6d40219cb25845f096ef2d3da048e76f'^
update TM_PRIORITY set NAME = 'Critical' where ID = '9567d315188046ac94ee65de44e7e3e4'^

update SEC_ROLE set LOC_NAME = 'Reference editor', DESCRIPTION = 'The role lets users edit references data'
    where NAME = 'ReferenceEditor'^

update SEC_ROLE set LOC_NAME = 'Documents initiator', DESCRIPTION = 'The role lets users create documents/contracts and start processes'
    where NAME = 'doc_initiator'^

update SEC_ROLE set LOC_NAME = 'Endorsement', DESCRIPTION = 'The role lets users endorse documents/contracts'
    where NAME = 'doc_endorsement'^

update SEC_ROLE set LOC_NAME = 'Observer', DESCRIPTION = 'The role lets users receive notifications on the current state of the task'
    where NAME = 'task_observer'^

update SEC_ROLE set LOC_NAME = 'Secretary', DESCRIPTION = 'The role lets users work with the office fnd register documents'
    where NAME = 'doc_secretary'^

update SEC_ROLE set LOC_NAME = 'Task initiator', DESCRIPTION = 'The role lets users initiate the process "Task Management"'
    where NAME = 'task_initiator'^

update SEC_ROLE set LOC_NAME = 'Simple user', DESCRIPTION = 'This role must be assigned to all users besides administrators'
    where NAME = 'SimpleUser'^

update SEC_ROLE set LOC_NAME = 'Controller', DESCRIPTION = 'The role lets users check tasks and, if necessary, send them back for revision'
    where NAME = 'task_controller'^

update SEC_ROLE set LOC_NAME = 'Approver', DESCRIPTION = 'The role lets users approve documents/contracts'
    where NAME = 'doc_approver'^

update SEC_ROLE set LOC_NAME = 'Executor', DESCRIPTION = 'The role lets users execute tasks'
    where NAME = 'task_executor'^

update SEC_ROLE set LOC_NAME = 'Task creator', DESCRIPTION = 'The role lets users create tasks'
    where NAME = 'task_creator'^

update SEC_ROLE set LOC_NAME = 'Acquaintance', DESCRIPTION = 'The role lets users acquainted with the documents/contracts'
    where NAME = 'doc_acquaintance'^

update SEC_ROLE set LOC_NAME = 'Schedule task creator', DESCRIPTION = 'The role lets users create scheduled tasks'
    where NAME = 'schedule_task_creator'^

update SEC_ROLE set LOC_NAME = 'Department chief', DESCRIPTION = 'This role is assigned with the access group "Department Chief". The department must be write in at the appropriate employee card.'
    where NAME = 'DepartmentChief'^

update SEC_ROLE set LOC_NAME = 'Subdivision chief', DESCRIPTION = 'This role is assigned with the access group "Subdivision Chief". The department must be write in at the appropriate employee card.'
    where NAME = 'SubdivisionChief'^

update SEC_ROLE set LOC_NAME = 'User substitution editor', DESCRIPTION = 'The role lets users edit the directory "User substitution"'
    where NAME = 'UserSubstitutionEditor'^

update SEC_ROLE set LOC_NAME = 'Access to the functions of the integration module with accounting systems', DESCRIPTION = 'Role lets users mark reference books and data to be unloaded in a third-party accounting systems'
    where NAME = 'AppIntegrationRole'^

update SEC_ROLE set LOC_NAME = 'Documents publisher', DESCRIPTION = 'Documents publication on the portal'
    where NAME = 'doc_publisher'^

update SEC_ROLE set LOC_NAME = 'Meeting creator', DESCRIPTION = 'The role lets users work with meetings'
    where NAME = 'meetingdoc_creator'^

update SEC_ROLE set LOC_NAME = 'Portal integration', DESCRIPTION = 'The role lets users log in to the THESIS through a portal integration web service'
    where NAME = 'PortalIntegrationRole'^

update SEC_ROLE set LOC_NAME = '', DESCRIPTION = 'The role provides system administration rights'
    where NAME = 'Administrators'^

update SEC_ROLE set LOC_NAME = 'Archivist', DESCRIPTION = 'Archiving of office files'
    where NAME = 'Archivist'^

update SEC_ROLE set LOC_NAME = 'Archive access', DESCRIPTION = 'Access to the cards in archive'
    where NAME = 'Archive access'^

update SEC_ROLE set LOC_NAME = 'EDM curator', DESCRIPTION = 'The role lets user to send and receive EDM documents'
    where NAME = 'EdmCuratorRole'^

update DF_NUMERATOR set CODE = 'Meetings' where ID = '215C66B8EF2E6608BD5D59C3BAE94E5E'^
update DF_NUMERATOR set CODE = 'Attachments' where ID = '31DD46B22C0011E3BBE5EF5C4A9D25E0'^
update DF_NUMERATOR set CODE = 'Documents and contracts' where ID = 'B3997576456D49E8964A24A247D4753D'^
update DF_NUMERATOR set CODE = 'Annex to a contract' where ID = 'C91D9E66003411E38CA53F77160974FF'^
update DF_NUMERATOR set CODE = 'Supplementary agreement' where ID = 'F31DE086003411E3B761873AA0372209'^
update DF_NUMERATOR set CODE = 'Instruction' where ID = 'C3B2F4A4FE9E11E2A39A83FE0D6B8DB7'^
update DF_NUMERATOR set CODE = 'Letter' where ID = '70DFE954FE9D11E296E01F9C56FC4E22'^
update DF_NUMERATOR set CODE = 'Order' where ID = 'AB30B1B4FE9E11E29003C79B48B9667D'^
update DF_NUMERATOR set CODE = 'Regulations' where ID = 'B8EE4D84FE9E11E28A752FF0C334CF13'^
update DF_NUMERATOR set CODE = 'Memorandum' where ID = 'D062C9F4FE9E11E2A3FCCF13C8FD96F7'^
update DF_NUMERATOR set CODE = 'Income' where ID = 'BEBC21E2FCE040C692027CFFFF7CF88E'^
update DF_NUMERATOR set CODE = 'Outcome' where ID = '5618547CA4C94BFDA71ED884CF49DF57'^
update DF_NUMERATOR set CODE = 'Internal' where ID = '36708C7FE2324451A2393F5A8FA10726'^
update DF_NUMERATOR set CODE = 'Inbound document (EDM)' where ID = '50055f2ae04a45f38773f9538a8d5200'^
update DF_NUMERATOR set CODE = 'Act' where ID = '2405864c88754c598b35b7ceb5727b2a'^ -- Акт
update DF_NUMERATOR set CODE = 'Waybill' where ID = '42aa900571714815a426fe1d65cc809f'^ -- Накладная
update DF_NUMERATOR set CODE = 'Bill' where ID = '6c4f01a3f8a34104b5c3618cf8834c81'^ -- Счет
update DF_NUMERATOR set CODE = 'Invoice' where ID = '8e3adb373f244076b39837fcd8c8e524'^ -- Счет-фактура
update DF_NUMERATOR set CODE = 'UTD' where ID = '531c2ce31eb4487290cc6ffcb962f4ed'^ -- УПД

update DF_CURRENCY set NAME = 'Rouble' where NAME = 'Рубль'^

update TM_SCHEDULE_ACTION_TYPE set NAME = 'Task start' where NAME = 'Запуск задачи'^

UPDATE SEC_PRESENTATION SET NAME = 'Extended' WHERE NAME = 'Расширенная'^
UPDATE SEC_PRESENTATION SET NAME = 'Basic' WHERE NAME = 'Основная'^

update SYS_CATEGORY set NAME = 'Contract' where ID = '9CD678E379784F53A503A36BCE3A76D6'^
update SYS_CATEGORY set NAME = 'Letter' where ID = 'C40EA551D3994A11B6BE347CA5F27837'^
update SYS_CATEGORY set NAME = 'Supplementary agreement' where ID = '3C59F74CFE9811E29E49A30CC182D375'^
update SYS_CATEGORY set NAME = 'Annex to a contract' where ID = '648A5B6CFE9811E289ED635286AA63EB'^
update SYS_CATEGORY set NAME = 'Order' where ID = '34370700FE6911E29D98ABE6F3D1EEDC'^
update SYS_CATEGORY set NAME = 'Memorandum' where ID = '24E40C08FE8711E28C8A3354B77DCB1F'^
update SYS_CATEGORY set NAME = 'Regulations' where ID = '44F912B6FE8E11E2A6B75BB93C75E36B'^
update SYS_CATEGORY set NAME = 'Instruction' where ID = '7F1B0314FE8E11E285D5F7A577D85B9F'^
update SYS_CATEGORY set NAME = 'Meeting' where ID = '9415792FC473CBEBD1508AE687C4DCD2'^
update SYS_CATEGORY set NAME = 'Main' where ID = '836D02A068A94AA5B11A08E9B32C589B'^
update SYS_CATEGORY set NAME = 'Inbound document (EDM)' where ID = 'e7b46d3eff894f6481183cd057584b19'^
update SYS_CATEGORY set NAME = 'Act' where ID = 'f147625a4ea84507956ff07ed302a5f1'^ -- Акт
update SYS_CATEGORY set NAME = 'Waybill' where ID = '512e83a3d8c945f6b0ded1949a55bced'^ -- Накладная
update SYS_CATEGORY set NAME = 'Bill' where ID = 'f808ab1ce2784034b56b30ac41cad9be'^ -- Счет
update SYS_CATEGORY set NAME = 'Invoice' where ID = '0bfb4912020749f983dd3cd95f4be62a'^ -- Счет-фактура
update SYS_CATEGORY set NAME = 'UTD' where ID = '99ab3f33a7d748cfbc5d855f266b4270'^ -- УПД

update DF_CATEGORY set NAME = 'Human resources' where ID = '196FB6FCEFAD4143808F248D727D91F7'^
update DF_CATEGORY set NAME = 'Main' where ID = '56a88e8c6ab2427a97fc5897005fe8a1'^
update DF_CATEGORY set NAME = 'Administrative' where ID = 'fa88ac8013ea486bb247602818672fe5'^
update DF_CATEGORY set NAME = 'Main activity' where ID = 'ce1e9051ca5c4341a52374c694a9635d'^


update TM_PROJECT_GROUP set NAME = 'Main project' where ID = 'b875aded88e740909f81a1a5fac75192'^

update DF_TYPICAL_RESOLUTION set NAME = 'For review:', TEXT = 'For review:' where NAME = 'На рассмотрение:'^
update DF_TYPICAL_RESOLUTION set NAME = 'To acquaint:', TEXT = 'To acquaint:' where NAME = 'Ознакомить:'^

update DF_ORGANIZATION set NAME = 'Organization' where ID = 'a851beaf68904ab2b847b7a810c4c2b9'^

update DF_DOC_RECEIVING_METHOD set NAME = 'Via EDM operator' where ID = 'c566526e674f4dcb871d21a98f24d1d7'^