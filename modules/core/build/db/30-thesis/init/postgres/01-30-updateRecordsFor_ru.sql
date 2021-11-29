-- $Id$
-- Description:

--tm_priority
update TM_PRIORITY set NAME = 'Нормальный' where ID = '2562cb31-0ebc-477b-a124-1cc618108be3'; -- Нормальный
update TM_PRIORITY set NAME = 'Высокий' where ID = '36518fcf-6fe9-42a9-ada2-e45b7e545cfa'; -- Высокий
update TM_PRIORITY set NAME = 'Низкий' where ID = '6d40219c-b258-45f0-96ef-2d3da048e76f'; -- Низкий
update TM_PRIORITY set NAME = 'Критический' where ID = '9567d315-1880-46ac-94ee-65de44e7e3e4'; -- Критический

--sec_role
update SEC_ROLE set LOC_NAME = 'Редактирование справочников', DESCRIPTION = 'Роль, предоставляющая доступ к редактированию справочников'
    where NAME = 'ReferenceEditor';

update SEC_ROLE set LOC_NAME = 'Инициатор документов', DESCRIPTION = 'Роль, предоставляющая права создания документов/договоров и запуска процессов'
    where NAME = 'doc_initiator';

update SEC_ROLE set LOC_NAME = 'Согласующий', DESCRIPTION = 'Роль дает возможность согласования документов/договоров'
    where NAME = 'doc_endorsement';

update SEC_ROLE set LOC_NAME = 'Наблюдатель', DESCRIPTION = 'Роль дает возможность получать уведомления по текущему состоянию задачи'
    where NAME = 'task_observer';

update SEC_ROLE set LOC_NAME = 'Делопроизводитель', DESCRIPTION = 'Роль дает возможность работы с канцелярией, позволяет регистрировать документы'
    where NAME = 'doc_secretary';

update SEC_ROLE set LOC_NAME = 'Инициатор задач', DESCRIPTION = 'Выступает инициатором процесса выполнения задачи, а также осуществляет отправку ее на выполнение'
    where NAME = 'task_initiator';

update SEC_ROLE set LOC_NAME = 'Запрещающая роль', DESCRIPTION = 'Эта роль должна быть назначена всем пользователям кроме администраторов'
    where NAME = 'SimpleUser';

update SEC_ROLE set LOC_NAME = 'Контролёр', DESCRIPTION = 'Осуществляет контроль выполнения задачи и, при необходимости, отправку задачи на доработку'
    where NAME = 'task_controller';

update SEC_ROLE set LOC_NAME = 'Утверждающий', DESCRIPTION = 'Роль дает возможность утверждения документов/договоров в завершении процесса согласования'
    where NAME = 'doc_approver';

update SEC_ROLE set LOC_NAME = 'Исполнитель', DESCRIPTION = 'Осуществляет выполнение задачи'
    where NAME = 'task_executor';

update SEC_ROLE set LOC_NAME = 'Создание задач', DESCRIPTION = 'Роль дает возможность создания задач'
    where NAME = 'task_creator';

update SEC_ROLE set LOC_NAME = 'Ознакомление с документами', DESCRIPTION = 'Роль дает возможность ознакомления с документами/договорами'
    where NAME = 'doc_acquaintance';

update SEC_ROLE set LOC_NAME = 'Создание периодических задач', DESCRIPTION = 'Роль, позволяющая создавать периодические задания'
    where NAME = 'schedule_task_creator';

update SEC_ROLE set LOC_NAME = 'Руководитель департамента', DESCRIPTION = 'Эта роль выдается только совместно с группой доступа «Руководитель департамента». У пользователя с этой ролью в карточке сотрудника должно быть заполнено подразделение'
    where NAME = 'DepartmentChief';

update SEC_ROLE set LOC_NAME = 'Руководитель подразделения', DESCRIPTION = 'Эта роль выдается только совместно с группой доступа «Руководитель подразделения». У пользователя с этой ролью в карточке сотрудника должно быть заполнено подразделение'
    where NAME = 'SubdivisionChief';

update SEC_ROLE set LOC_NAME = 'Редактирование замещений пользователей', DESCRIPTION = 'Роль предоставляет возможность редактирования справочника «Замещение пользователей»'
    where NAME = 'UserSubstitutionEditor';

update SEC_ROLE set LOC_NAME = 'Доступ к функциям модуля интеграции с учётными системами', DESCRIPTION = 'Позволяет отмечать справочники и данные к выгрузке в сторонние учётные системы'
    where NAME = 'AppIntegrationRole';

update SEC_ROLE set LOC_NAME = 'Публикация документов на портале', DESCRIPTION = 'Роль, позволяющая публиковать документы на портале'
    where NAME = 'doc_publisher';

update SEC_ROLE set LOC_NAME = 'Работа с совещаниями', DESCRIPTION = 'Роль, предоставляющая права для работы с совещаниями'
    where NAME = 'meetingdoc_creator';

update SEC_ROLE set LOC_NAME = 'Интеграция с порталом', DESCRIPTION = 'Пользователь с данной ролью может быть авторизован в Тезис через веб-сервис интеграции с порталом'
    where NAME = 'PortalIntegrationRole';

update SEC_ROLE set LOC_NAME = '', DESCRIPTION = 'Роль, предоставляющая права администрирования системы'
    where NAME = 'Administrators';

update SEC_ROLE set LOC_NAME = 'Архивариус', DESCRIPTION = 'Архивация дел'
    where NAME = 'Archivist';

update SEC_ROLE set LOC_NAME = 'Доступ к архиву', DESCRIPTION = 'Доступ к карточкам в делах архива'
    where NAME = 'Archive access';

update SEC_ROLE set LOC_NAME = 'Куратор ЭДО', DESCRIPTION = 'Роль, предоставляющая права отправки и получения документов ЭДО'
    where NAME = 'EdmCuratorRole';

--df_currency
update DF_CURRENCY set NAME = 'Рубль' where NAME = 'Rouble';


--tm_schedule_action_type
update TM_SCHEDULE_ACTION_TYPE set NAME = 'Запуск задачи' where NAME = 'Task start';

UPDATE SEC_PRESENTATION SET NAME = 'Расширенная' WHERE NAME = 'Extended';
UPDATE SEC_PRESENTATION SET NAME = 'Основная' WHERE NAME = 'Basic';

--sys_category
update SYS_CATEGORY set NAME = 'Договор' where ID = '9CD678E3-7978-4F53-A503-A36BCE3A76D6'; -- Договор
update SYS_CATEGORY set NAME = 'Письмо' where ID = 'C40EA551-D399-4A11-B6BE-347CA5F27837'; -- Письмо
update SYS_CATEGORY set NAME = 'Дополнительное соглашение' where ID = '3C59F74C-FE98-11E2-9E49-A30CC182D375'; -- Дополнительное соглашение
update SYS_CATEGORY set NAME = 'Приложение к договору' where ID = '648A5B6C-FE98-11E2-89ED-635286AA63EB'; -- Приложение к договору
update SYS_CATEGORY set NAME = 'Приказ' where ID = '34370700-FE69-11E2-9D98-ABE6F3D1EEDC'; -- Приказ
update SYS_CATEGORY set NAME = 'Служебная записка' where ID = '24E40C08-FE87-11E2-8C8A-3354B77DCB1F'; -- Служебная записка
update SYS_CATEGORY set NAME = 'Регламент' where ID = '44F912B6-FE8E-11E2-A6B7-5BB93C75E36B'; -- Регламент
update SYS_CATEGORY set NAME = 'Инструкция' where ID = '7F1B0314-FE8E-11E2-85D5-F7A577D85B9F'; -- Инструкция
update SYS_CATEGORY set NAME = 'Совещание' where ID = '9415792F-C473-CBEB-D150-8AE687C4DCD2'; -- Совещание
update SYS_CATEGORY set NAME = 'Основной' where ID = '836D02A0-68A9-4AA5-B11A-08E9B32C589B'; -- Основной
update SYS_CATEGORY set NAME = 'Входящий документ (ЭДО)' where ID = 'e7b46d3e-ff89-4f64-8118-3cd057584b19'; -- Входящий документ (ЭДО)
update SYS_CATEGORY set NAME = 'Акт' where ID = 'f147625a-4ea8-4507-956f-f07ed302a5f1'; -- Акт
update SYS_CATEGORY set NAME = 'Накладная' where ID = '512e83a3-d8c9-45f6-b0de-d1949a55bced'; -- Накладная
update SYS_CATEGORY set NAME = 'Счет' where ID = 'f808ab1c-e278-4034-b56b-30ac41cad9be'; -- Счет
update SYS_CATEGORY set NAME = 'Счет-фактура' where ID = '0bfb4912-0207-49f9-83dd-3cd95f4be62a'; -- Счет-фактура
update SYS_CATEGORY set NAME = 'УПД' where ID = '99ab3f33-a7d7-48cf-bc5d-855f266b4270'; -- УПД

--df_category
update DF_CATEGORY set NAME = 'По кадрам' where ID = '196FB6FC-EFAD-4143-808F-248D727D91F7'; -- 'По кадрам'
update DF_CATEGORY set NAME = 'Основная' where ID = '56a88e8c-6ab2-427a-97fc-5897005fe8a1'; -- 'Основная'
update DF_CATEGORY set NAME = 'Административно-хозяйственная деятельность' where ID = 'fa88ac80-13ea-486b-b247-602818672fe5'; -- 'Административно-хозяйственная деятельность'
update DF_CATEGORY set NAME = 'Основной вид деятельности' where ID = 'ce1e9051-ca5c-4341-a523-74c694a9635d'; -- 'Основной вид деятельности'

--df_numerator
update DF_NUMERATOR set CODE = 'Совещания' where ID = '215C66B8-EF2E-6608-BD5D-59C3BAE94E5E'; -- Совещания
update DF_NUMERATOR set CODE = 'Вложения' where ID = '31DD46B2-2C00-11E3-BBE5-EF5C4A9D25E0'; -- Вложения
update DF_NUMERATOR set CODE = 'Документы и договоры' where ID = 'B3997576-456D-49E8-964A-24A247D4753D'; -- Документы и договоры
update DF_NUMERATOR set CODE = 'Приложение к договору' where ID = 'C91D9E66-0034-11E3-8CA5-3F77160974FF'; -- Приложение к договору
update DF_NUMERATOR set CODE = 'Дополнительное соглашение' where ID = 'F31DE086-0034-11E3-B761-873AA0372209'; -- Дополнительное соглашение
update DF_NUMERATOR set CODE = 'Инструкция' where ID = 'C3B2F4A4-FE9E-11E2-A39A-83FE0D6B8DB7'; -- Инструкция
update DF_NUMERATOR set CODE = 'Письмо' where ID = '70DFE954-FE9D-11E2-96E0-1F9C56FC4E22'; -- Письмо
update DF_NUMERATOR set CODE = 'Приказ' where ID = 'AB30B1B4-FE9E-11E2-9003-C79B48B9667D'; -- Приказ
update DF_NUMERATOR set CODE = 'Регламент' where ID = 'B8EE4D84-FE9E-11E2-8A75-2FF0C334CF13'; -- Регламент
update DF_NUMERATOR set CODE = 'Служебная записка' where ID = 'D062C9F4-FE9E-11E2-A3FC-CF13C8FD96F7'; -- Служебная записка
update DF_NUMERATOR set CODE = 'Входящий' where ID = 'BEBC21E2-FCE0-40C6-9202-7CFFFF7CF88E'; -- Входящий
update DF_NUMERATOR set CODE = 'Исходящий' where ID = '5618547C-A4C9-4BFD-A71E-D884CF49DF57'; -- Исходящий
update DF_NUMERATOR set CODE = 'Внутренний' where ID = '36708C7F-E232-4451-A239-3F5A8FA10726'; -- Внутренний
update DF_NUMERATOR set CODE = 'Входящий документ (ЭДО)' where ID = '50055f2a-e04a-45f3-8773-f9538a8d5200'; -- Входящий документ (ЭДО)
update DF_NUMERATOR set CODE = 'Акт' where ID = '2405864c-8875-4c59-8b35-b7ceb5727b2a'; -- Акт
update DF_NUMERATOR set CODE = 'Накладная' where ID = '42aa9005-7171-4815-a426-fe1d65cc809f'; -- Накладная
update DF_NUMERATOR set CODE = 'Счет' where ID = '6c4f01a3-f8a3-4104-b5c3-618cf8834c81'; -- Счет
update DF_NUMERATOR set CODE = 'Счет-фактура' where ID = '8e3adb37-3f24-4076-b398-37fcd8c8e524'; -- Счет-фактура
update DF_NUMERATOR set CODE = 'УПД' where ID = '531c2ce3-1eb4-4872-90cc-6ffcb962f4ed'; -- УПД

--tm_project_group
update TM_PROJECT_GROUP set NAME = 'Основной проект' where ID = 'b875aded-88e7-4090-9f81-a1a5fac75192'; -- Основной проект

--df_typical_resolution
update DF_TYPICAL_RESOLUTION set NAME = 'На рассмотрение:', TEXT = 'На рассмотрение:' where NAME = 'For review:';
update DF_TYPICAL_RESOLUTION set NAME = 'Ознакомить:', TEXT = 'Ознакомить:' where NAME = 'To acquaint:';

--df_organization
update DF_ORGANIZATION set NAME = 'Наша организация' where ID = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9'; -- Наша организация

-- df_doc_receiving_method
update DF_DOC_RECEIVING_METHOD set NAME = 'Через оператора ЭДО' where ID = 'c566526e-674f-4dcb-871d-21a98f24d1d7'; -- Через оператора ЭДО