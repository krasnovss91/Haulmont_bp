
update TM_PRIORITY set NAME = 'Нормальный' where ID = '2562cb310ebc477ba1241cc618108be3'^
update TM_PRIORITY set NAME = 'Высокий' where ID = '36518fcf6fe942a9ada2e45b7e545cfa'^
update TM_PRIORITY set NAME = 'Низкий' where ID = '6d40219cb25845f096ef2d3da048e76f'^
update TM_PRIORITY set NAME = 'Критический' where ID = '9567d315188046ac94ee65de44e7e3e4'^

update SEC_ROLE set LOC_NAME = 'Редактирование справочников', DESCRIPTION = 'Роль, предоставляющая доступ к редактированию справочников'
    where NAME = 'ReferenceEditor'^

update SEC_ROLE set LOC_NAME = 'Инициатор документов', DESCRIPTION = 'Роль, предоставляющая права создания документов/договоров и запуска процессов'
    where NAME = 'doc_initiator'^

update SEC_ROLE set LOC_NAME = 'Согласующий', DESCRIPTION = 'Роль дает возможность согласования документов/договоров'
    where NAME = 'doc_endorsement'^

update SEC_ROLE set LOC_NAME = 'Наблюдатель', DESCRIPTION = 'Роль дает возможность получать уведомления по текущему состоянию задачи'
    where NAME = 'task_observer'^

update SEC_ROLE set LOC_NAME = 'Делопроизводитель', DESCRIPTION = 'Роль дает возможность работы с канцелярией, позволяет регистрировать документы'
    where NAME = 'doc_secretary'^

update SEC_ROLE set LOC_NAME = 'Инициатор задач', DESCRIPTION = 'Выступает инициатором процесса выполнения задачи, а также осуществляет отправку ее на выполнение'
    where NAME = 'task_initiator'^

update SEC_ROLE set LOC_NAME = 'Запрещающая роль', DESCRIPTION = 'Эта роль должна быть назначена всем пользователям кроме администраторов'
    where NAME = 'SimpleUser'^

update SEC_ROLE set LOC_NAME = 'Контролёр', DESCRIPTION = 'Осуществляет контроль выполнения задачи и, при необходимости, отправку задачи на доработку'
    where NAME = 'task_controller'^

update SEC_ROLE set LOC_NAME = 'Утверждающий', DESCRIPTION = 'Роль дает возможность утверждения документов/договоров в завершении процесса согласования'
    where NAME = 'doc_approver'^

update SEC_ROLE set LOC_NAME = 'Исполнитель', DESCRIPTION = 'Осуществляет выполнение задачи'
    where NAME = 'task_executor'^

update SEC_ROLE set LOC_NAME = 'Создание задач', DESCRIPTION = 'Роль дает возможность создания задач'
    where NAME = 'task_creator'^

update SEC_ROLE set LOC_NAME = 'Ознакомление с документами', DESCRIPTION = 'Роль дает возможность ознакомления с документами/договорами'
    where NAME = 'doc_acquaintance'^

update SEC_ROLE set LOC_NAME = 'Создание периодических задач', DESCRIPTION = 'Роль, позволяющая создавать периодические задания'
    where NAME = 'schedule_task_creator'^

update SEC_ROLE set LOC_NAME = 'Руководитель департамента', DESCRIPTION = 'Эта роль выдается только совместно с группой доступа «Руководитель департамента». У пользователя с этой ролью в карточке сотрудника должно быть заполнено подразделение'
    where NAME = 'DepartmentChief'^

update SEC_ROLE set LOC_NAME = 'Руководитель подразделения', DESCRIPTION = 'Эта роль выдается только совместно с группой доступа «Руководитель подразделения». У пользователя с этой ролью в карточке сотрудника должно быть заполнено подразделение'
    where NAME = 'SubdivisionChief'^

update SEC_ROLE set LOC_NAME = 'Редактирование замещений пользователей', DESCRIPTION = 'Роль предоставляет возможность редактирования справочника «Замещение пользователей»'
    where NAME = 'UserSubstitutionEditor'^

update SEC_ROLE set LOC_NAME = 'Доступ к функциям модуля интеграции с учётными системами', DESCRIPTION = 'Позволяет отмечать справочники и данные к выгрузке в сторонние учётные системы'
    where NAME = 'AppIntegrationRole'^

update SEC_ROLE set LOC_NAME = 'Публикация документов на портале', DESCRIPTION = 'Роль, позволяющая публиковать документы на портале'
    where NAME = 'doc_publisher'^

update SEC_ROLE set LOC_NAME = 'Работа с совещаниями', DESCRIPTION = 'Роль, предоставляющая права для работы с совещаниями'
    where NAME = 'meetingdoc_creator'^

update SEC_ROLE set LOC_NAME = 'Интеграция с порталом', DESCRIPTION = 'Пользователь с данной ролью может быть авторизован в Тезис через веб-сервис интеграции с порталом'
    where NAME = 'PortalIntegrationRole'^

update SEC_ROLE set LOC_NAME = '', DESCRIPTION = 'Роль, предоставляющая права администрирования системы'
    where NAME = 'Administrators'^

update SEC_ROLE set LOC_NAME = 'Архивариус', DESCRIPTION = 'Архивация дел'
    where NAME = 'Archivist'^

update SEC_ROLE set LOC_NAME = 'Доступ к архиву', DESCRIPTION = 'Доступ к карточкам в делах архива'
    where NAME = 'Archive access'^

update SEC_ROLE set LOC_NAME = 'Куратор ЭДО', DESCRIPTION = 'Роль, предоставляющая права отправки и получения документов ЭДО'
    where NAME = 'EdmCuratorRole'^

update DF_CURRENCY set NAME = 'Рубль' where NAME = 'Rouble'^

update TM_SCHEDULE_ACTION_TYPE set NAME = 'Запуск задачи' where NAME = 'Task start'^

UPDATE SEC_PRESENTATION SET NAME = 'Расширенная' WHERE NAME = 'Extended'^
UPDATE SEC_PRESENTATION SET NAME = 'Основная' WHERE NAME = 'Basic'^

update SYS_CATEGORY set NAME = 'Договор' where ID = '9CD678E379784F53A503A36BCE3A76D6'^
update SYS_CATEGORY set NAME = 'Письмо' where ID = 'C40EA551D3994A11B6BE347CA5F27837'^
update SYS_CATEGORY set NAME = 'Дополнительное соглашение' where ID = '3C59F74CFE9811E29E49A30CC182D375'^
update SYS_CATEGORY set NAME = 'Приложение к договору' where ID = '648A5B6CFE9811E289ED635286AA63EB'^
update SYS_CATEGORY set NAME = 'Приказ' where ID = '34370700FE6911E29D98ABE6F3D1EEDC'^
update SYS_CATEGORY set NAME = 'Служебная записка' where ID = '24E40C08FE8711E28C8A3354B77DCB1F'^
update SYS_CATEGORY set NAME = 'Регламент' where ID = '44F912B6FE8E11E2A6B75BB93C75E36B'^
update SYS_CATEGORY set NAME = 'Инструкция' where ID = '7F1B0314FE8E11E285D5F7A577D85B9F'^
update SYS_CATEGORY set NAME = 'Совещание' where ID = '9415792FC473CBEBD1508AE687C4DCD2'^
update SYS_CATEGORY set NAME = 'Основной' where ID = '836D02A068A94AA5B11A08E9B32C589B'^
update SYS_CATEGORY set NAME = 'Входящий документ (ЭДО)' where ID = 'e7b46d3eff894f6481183cd057584b19'^ -- Входящий документ (ЭДО)
update SYS_CATEGORY set NAME = 'Акт' where ID = 'f147625a4ea84507956ff07ed302a5f1'^ -- Акт
update SYS_CATEGORY set NAME = 'Накладная' where ID = '512e83a3d8c945f6b0ded1949a55bced'^ -- Накладная
update SYS_CATEGORY set NAME = 'Счет' where ID = 'f808ab1ce2784034b56b30ac41cad9be'^ -- Счет
update SYS_CATEGORY set NAME = 'Счет-фактура' where ID = '0bfb4912020749f983dd3cd95f4be62a'^ -- Счет-фактура
update SYS_CATEGORY set NAME = 'УПД' where ID = '99ab3f33a7d748cfbc5d855f266b4270'^ -- УПД

update DF_CATEGORY set NAME = 'По кадрам' where ID = '196FB6FCEFAD4143808F248D727D91F7'^
update DF_CATEGORY set NAME = 'Основная' where ID = '56a88e8c6ab2427a97fc5897005fe8a1'^
update DF_CATEGORY set NAME = 'Административно-хозяйственная деятельность' where ID = 'fa88ac8013ea486bb247602818672fe5'^
update DF_CATEGORY set NAME = 'Основной вид деятельности' where ID = 'ce1e9051ca5c4341a52374c694a9635d'^

update DF_NUMERATOR set CODE = 'Совещания' where ID = '215C66B8EF2E6608BD5D59C3BAE94E5E'^
update DF_NUMERATOR set CODE = 'Вложения' where ID = '31DD46B22C0011E3BBE5EF5C4A9D25E0'^
update DF_NUMERATOR set CODE = 'Документы и договоры' where ID = 'B3997576456D49E8964A24A247D4753D'^
update DF_NUMERATOR set CODE = 'Приложение к договору' where ID = 'C91D9E66003411E38CA53F77160974FF'^
update DF_NUMERATOR set CODE = 'Дополнительное соглашение' where ID = 'F31DE086003411E3B761873AA0372209'^
update DF_NUMERATOR set CODE = 'Инструкция' where ID = 'C3B2F4A4FE9E11E2A39A83FE0D6B8DB7'^
update DF_NUMERATOR set CODE = 'Письмо' where ID = '70DFE954FE9D11E296E01F9C56FC4E22'^
update DF_NUMERATOR set CODE = 'Приказ' where ID = 'AB30B1B4FE9E11E29003C79B48B9667D'^
update DF_NUMERATOR set CODE = 'Регламент' where ID = 'B8EE4D84FE9E11E28A752FF0C334CF13'^
update DF_NUMERATOR set CODE = 'Служебная записка' where ID = 'D062C9F4FE9E11E2A3FCCF13C8FD96F7'^
update DF_NUMERATOR set CODE = 'Входящий' where ID = 'BEBC21E2FCE040C692027CFFFF7CF88E'^
update DF_NUMERATOR set CODE = 'Исходящий' where ID = '5618547CA4C94BFDA71ED884CF49DF57'^
update DF_NUMERATOR set CODE = 'Внутренний' where ID = '36708C7FE2324451A2393F5A8FA10726'^
update DF_NUMERATOR set CODE = 'Входящий документ (ЭДО)' where ID = '50055f2ae04a45f38773f9538a8d5200'^
update DF_NUMERATOR set CODE = 'Акт' where ID = '2405864c88754c598b35b7ceb5727b2a'^ -- Акт
update DF_NUMERATOR set CODE = 'Накладная' where ID = '42aa900571714815a426fe1d65cc809f'^ -- Накладная
update DF_NUMERATOR set CODE = 'Счет' where ID = '6c4f01a3f8a34104b5c3618cf8834c81'^ -- Счет
update DF_NUMERATOR set CODE = 'Счет-фактура' where ID = '8e3adb373f244076b39837fcd8c8e524'^ -- Счет-фактура
update DF_NUMERATOR set CODE = 'УПД' where ID = '531c2ce31eb4487290cc6ffcb962f4ed'^ -- УПД

update TM_PROJECT_GROUP set NAME = 'Основной проект' where ID = 'b875aded88e740909f81a1a5fac75192'^

update DF_TYPICAL_RESOLUTION set NAME = 'На рассмотрение:', TEXT = 'На рассмотрение:' where NAME = 'For review:'^
update DF_TYPICAL_RESOLUTION set NAME = 'Ознакомить:', TEXT = 'Ознакомить:' where NAME = 'To acquaint:'^

update DF_ORGANIZATION set NAME = 'Наша организация' where ID = 'a851beaf68904ab2b847b7a810c4c2b9'^

update DF_DOC_RECEIVING_METHOD set NAME = 'Через оператора ЭДО' where ID = 'c566526e674f4dcb871d21a98f24d1d7'^