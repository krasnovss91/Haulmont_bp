const processActions = `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Asciidoctor 1.5.2">
<title>Untitled</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,400italic,600,600italic%7CNoto+Serif:400,400italic,700,700italic%7CDroid+Sans+Mono:400">

</head>
<body class="article">
<div id="header">
</div>
<div id="content">
<div class="paragraph">
<p><div class="blockTabs">
<div class="tabs" id="ProcessActionsTabs"><button class="tablinkProcessActions" onclick="openPage('ProcessActionstab1', this)" id="defaultOpenProcessActions">
Инициатор</button><button class="tablinkProcessActions" onclick="openPage('ProcessActionstab2', this)" >
Исполнитель</button><button class="tablinkProcessActions" onclick="openPage('ProcessActionstab3', this)" >
Контролер</button><button class="tablinkProcessActions" onclick="openPage('ProcessActionstab4', this)" >
Наблюдатель</button><button class="tablinkProcessActions" onclick="openPage('ProcessActionstab5', this)" >
</button></div>
      <div class="tabsPages" id="ProcessActionsPages">   <div id="ProcessActionstab1" class="tabcontentProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Инициатора</span></p>
</div>
<div class="paragraph">
<p>Действия Инициатора можно разбить на несколько этапов:</p>
</div>
<div class="sect1">
<h2 id="_создание_карточки_задачи">Создание карточки задачи</h2>
<div class="sectionbody">
<div class="paragraph">
<p>В системе ТЕЗИС возможно создание карточки задачи несколькими способами.
Подробно варианты различных действий рассмотрены в разделе «Способы создания».</p>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_отправка_задачи_на_исполнение">Отправка задачи на исполнение</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Задача может быть отправлена на исполнение сразу после создания новой карточки
задачи, а также путем выбора из списка существующих карточек в папке меню «Задачи» –
«Список задач» или из папки действий по задачам «Черновики».</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи.<br>
  Если задача была создана ранее, то ее можно найти в меню «Задачи» – «Список задач»
или в папке действий «Черновики».</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/Assign.svg" alt="Assign"></span></span> в правой части экрана просмотра
карточки.<br>
  Откроется окно подтверждения списка пользователей.</p>
</li>
<li>
<p>Назначьте сотрудников и определите вариант их уведомления в окне подтверждения
списка пользователей.<br>
  Добавление необходимых ролей возможно из выпадающего списка «Добавить участников».<br>
  Чек-боксы «E-mail» и «Трей» отмечены по умолчанию для того, чтобы пользователь,
назначенный на роль, мог получать уведомления по электронной почте и на панели
уведомлений соответственно. Если уведомления должны быть отправлены, оставьте
поля без изменений.</p>
</li>
<li>
<p>Отметьте чек-бокс «Отложить запуск задачи» если требуется, чтобы задача была
автоматически отправлена исполнителю позже (например, в то время, когда Инициатор
будет находиться в отпуске).<br>
  При этом можно выбрать дату и время отложенного запуска и оставить комментарий.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span> после того, как все данные введены.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_возврат_задачи_от_исполнителя">Возврат задачи от Исполнителя</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При необходимости получения дополнительной информации или продления срока задачи
Исполнитель возвращает задачу Инициатору.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи.</p>
</li>
<li>
<p>Ознакомьтесь с обоснованием возврата от Исполнителя на вкладке «Обсуждения».</p>
</li>
<li>
<p>В зависимости от характера возврата, измените срок выполнения задачи, либо
дополните описание задачи и перечень вложений необходимой информацией.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/Assign.svg" alt="Assign"></span></span> в правой части экрана
просмотра карточки.</p>
</li>
<li>
<p>Внесите при необходимости изменения в назначенные роли в окне подтверждения
списка пользователей.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_принятие_задачи_у_исполнителя">Принятие задачи у Исполнителя</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Как только задача выполнена Исполнителем, она поступает к Инициатору.
При отсутствии замечаний к результату исполнения задачи Инициатор принимает задачу.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/Completed.svg" alt="Completed"></span></span>  в правой части экрана
просмотра карточки.</p>
</li>
<li>
<p>Добавьте при необходимости комментарий в открывшемся окне записи журнала действий.
Заполнение поля «Комментарий» необязательно.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_возврат_задачи_на_доработку_исполнителю">Возврат задачи на доработку Исполнителю</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Как только задача выполнена Исполнителем она поступает к Инициатору.
При наличии замечаний к результату исполнения задачи Инициатор возвращает задачу Исполнителю.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ImprovementRequired.svg" alt="ImprovementRequired"></span></span> в правой части экрана просмотра карточки.</p>
</li>
<li>
<p>Добавьте при необходимости комментарий в открывшемся окне записи журнала действий.<br>
Заполнение поля «Комментарий» обязательно.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_переназначение_исполнителя">Переназначение Исполнителя</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Если при создании карточки задачи Инициатор отметил чек-бокс «Переназначение
возможно», то Исполнитель может переназначить выполнение данной задачи другому
пользователю. В большинстве случаев основанием для таких действий является
делегирование полномочий другому сотруднику.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/Reassign.svg" alt="Reassign"></span></span> в правой части экрана
просмотра карточки.</p>
</li>
<li>
<p>Добавьте комментарий и выберите нового исполнителя в открывшемся окне
переназначения исполнителя.<br>
  Заполнение полей данного окна обязательно.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.<br>
  Задача отзывается у текущего пользователя и переходит новому в папку «Назначенные».<br>
  Новый Исполнитель получит уведомление о назначенной задаче и может осуществлять
все те же действия, что и Исполнитель.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_отмена_процесса">Отмена процесса</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Отменить неактуальную задачу возможно в любое время до исполнения задачи.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/CancelProcess.svg" alt="CancelProcess"></span></span> в правой части экрана просмотра
карточки.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonYes.svg" alt="ButtonYes"></span></span> в открывшемся окне отмены процесса.</p>
</li>
<li>
<p>Добавьте комментарий в окне записи журнала действий.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span> после того, как все данные введены.</p>
</li>
</ul>
</div>
<div class="sect2">
<h3 id="_создать_задачу_может_не_только_инициатор">Создать задачу может не только Инициатор.</h3>
<div class="paragraph">
<p>Например, руководитель может дать поручение Секретарю создать задачу. В таком
случае секретарь будет являться Автором задачи в Системе и укажет своего
руководителя как Инициатора, чтобы он принимал результаты выполнения поручения
и завершал задачу. В этом случае создание карточки задачи и отправка ее на
исполнение будет осуществлена Автором, однако все последующие действия выполняются
Инициатором.</p>
</div>
</div>
</div>
</div>
                     </div>   <div id="ProcessActionstab2" class="tabcontentProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Исполнителя</span></p>
</div>
<div class="paragraph">
<p>Как только задача назначена, она поступает к Исполнителю.</p>
</div>
<div class="paragraph">
<p>Карточку назначенной задачи можно найти на основном экране системы ТЕЗИС:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>в центральной части в разделе текущих назначений;</p>
</li>
<li>
<p>в левой части в папке действий по задачам «Назначенные»;</p>
</li>
<li>
<p>в правой части в области уведомлений;</p>
</li>
<li>
<p>в меню «Задачи» в списках задач.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ExecuterMainScreen.png" alt="ExecuterMainScreen"></span></p>
</div>
<div class="sect2">
<h3 id="_действия">Действия:</h3>

</div>
<div class="sect1">
<h2 id="_принятие_задачи_в_работу">Принятие задачи в работу</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Исполнитель, увидев новую задачу может принять ее.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/Accept.svg" alt="Accept"></span></span> в правой части экрана просмотра
карточки.</p>
</li>
<li>
<p>Добавьте при необходимости комментарий в открывшемся окне записи журнала действий.<br>
Заполнение поля «Комментарий» необязательно.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.<br>
  После принятия задачи она переместилась из папки действий задач «Назначенные»
  в папку «В работе».<br>
  При принятии задачи в работу важно обратить внимание на срок исполнения. Если
задача не будет исполнена в указанные сроки, то она станет красной в списке задач
и по ней будут приходить сообщения о нарушении сроков исполнения.<br>
  Принятие задачи в работу не является обязательным этапом действий Исполнителя.
Возможно не принимать задачу в работу в системе ТЕЗИС, а вести работу по ней или
при наличии необходимых данных и совершении нужных действий сразу отметить ее
выполнение.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_выполнение_задачи">Выполнение задачи</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Как только по задаче будет проведена необходимая работа, то можно отмечать ее
выполнение.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи и ознакомьтесь с данными.</p>
</li>
<li>
<p>Добавьте при необходимости в карточку файлы на вкладке «Вложения».</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/Completed.svg" alt="Completed"></span></span> в правой части экрана просмотра карточки.</p>
</li>
<li>
<p>Добавьте необходимые данные в открывшемся окне записи журнала действий.<br>
Доступные к заполнению поля и разделы:</p>
<div class="ulist circle">
<ul class="circle">
<li>
<p>поле «<strong>Решение</strong>» – автоматически заполняется Системой, не может быть изменено
и указывает на статус задачи;</p>
</li>
<li>
<p>поле «<strong>Комментарий</strong>» – текстовое поле, наполняемое любой необходимой
информацией о задаче;</p>
</li>
<li>
<p>поле «<strong>Трудоемкость</strong>» – цифровое указание на количество затраченного времени
на выполнение задачи минутах, часах или днях;</p>
</li>
<li>
<p>раздел «<strong>Вложения</strong>» – содержит файлы, которые необходимо приложить Исполнителю
как результат работы по задаче (добавление файла осуществляется по кнопке <span class="noBorder"><span class="image"><img src="img/ButtonAddCombo.svg" alt="ButtonAddCombo"></span></span>
и аналогично добавлению вложений на вкладке «Вложения»).<br>
    Заполнение полей не обязательно.</p>
</li>
</ul>
</div>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.<br>
Если в процессе работы по задаче назначен Контролер, то задача отправлена на контроль.<br>
Если в процессе нет назначенного Контролера, то задача отправлена  для принятия Инициатору.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_доработка_задачи">Доработка задачи</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При наличии замечаний к результату исполнения задачи Инициатор возвращает задачу
Исполнителю на доработку.<br>
Действия с задачей, вернувшейся на доработку, аналогичны действиям «Принятие
задачи в работу» и «Выполнение задачи».</p>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_возврат_задачи_инициатору">Возврат задачи Инициатору</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При необходимости получения дополнительной информации или продления срока задачи
Исполнитель возвращает задачу Инициатору.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonToReturnToTheInitiator.svg" alt="ButtonToReturnToTheInitiator"></span></span> в
правой части экрана просмотра карточки.</p>
</li>
<li>
<p>Выберите нужный вариант причины возврата задачи в выпадающем списке.</p>
</li>
<li>
<p>Добавьте при необходимости комментарий в открывшемся окне записи журнала действий.<br>
  Окна записи журнала действий аналогичны в случае запроса изменения сроков и
уточнения деталей и отличаются только автоматическим заполнением поля комментарий,
в который необходимо добавить уточнения.<br>
  Заполнение поля «Комментарий» обязательно.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_переназначение_исполнителя">Переназначение Исполнителя</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Если при создании карточки задачи Инициатор отметил чек-бокс «Переназначение
возможно», то Исполнитель может переназначить выполнение
данной задачи другому пользователю. В большинстве случаев основанием для таких
действий является делегирование полномочий другому сотруднику.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/Reassign.svg" alt="Reassign"></span></span> в правой части экрана
просмотра карточки.</p>
</li>
<li>
<p>Добавьте комментарий и выберите нового исполнителя в открывшемся окне
переназначения Исполнителя.
Заполнение полей данного окна обязательно.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.<br>
  Новый Исполнитель получит уведомление о назначенной задаче и может осуществлять
все те же действия, что и Исполнитель.</p>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="ProcessActionstab3" class="tabcontentProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Контролера</span></p>
</div>
<div class="paragraph">
<p>Как только задача закрыта Исполнителем, она поступает к Контролеру.</p>
</div>
<div class="paragraph">
<p>Карточку поступившей для проверки исполнения задачи можно найти на
основном экране системы ТЕЗИС:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>в центральной части в разделе текущих назначений;</p>
</li>
<li>
<p>в левой части в папке действий по задачам «Для контроля»;</p>
</li>
<li>
<p>в правой части в области уведомлений;</p>
</li>
<li>
<p>в меню «Задачи» в списках задач.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ControlerMainScreen.png" alt="ControlerMainScreen"></span></p>
</div>
<div class="sect2">
<h3 id="_действия">Действия:</h3>

</div>
<div class="sect1">
<h2 id="_принятие_задачи">Принятие задачи</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При отсутствии замечаний к результату исполнения задачи Контролер принимает задачу.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/Accept.svg" alt="Accept"></span></span> в правой части экрана просмотра карточки.</p>
</li>
<li>
<p>Добавьте при необходимости комментарий в открывшемся окне записи журнала действий.
Заполнение поля «Комментарий» необязательно.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_возврат_задачи_на_доработку_исполнителю">Возврат задачи на доработку Исполнителю</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При наличии замечаний к результату исполнения задачи Контролер возвращает задачу
Исполнителю на доработку.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ImprovementRequired.svg" alt="ImprovementRequired"></span></span> в правой части
экрана просмотра карточки.</p>
</li>
<li>
<p>Добавьте при необходимости комментарий в открывшемся окне записи журнала действий.<br>
Заполнение поля «Комментарий» обязательно.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="ProcessActionstab4" class="tabcontentProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Наблюдателя</span></p>
</div>
<div class="paragraph">
<p>Карточку задачи, в которой пользователь назначен Наблюдателем, можно
найти на основном экране системы ТЕЗИС:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>в левой части в папке действий по задачам «Наблюдаемые»;</p>
</li>
<li>
<p>в правой части в области уведомлений;</p>
</li>
<li>
<p>в меню «Задачи» в списках задач.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ObserverMainScreen.png" alt="ObserverMainScreen"></span></p>
</div>
<div class="sect2">
<h3 id="_действия">Действия:</h3>

</div>
<div class="sect1">
<h2 id="_наблюдение_за_задачей">Наблюдение за задачей</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Пользователь, назначенный на роль Наблюдателя, имеет доступ к карточке задачи.</p>
</div>
<div class="paragraph">
<p>Он может открывать карточку задачи, изучать информацию на вкладках и во вложении,
добавлять файлы и участвовать в обсуждении. Кнопки действий в карточке задачи у
Наблюдателя неактивные.</p>
</div>
<div class="paragraph">
<p>При необходимости Наблюдатель может вести наблюдение за задачей отключив
оповещения.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи и ознакомьтесь с данными или добавьте комментарий на
вкладке «Обсуждение».</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/StopWatchingCombo.svg" alt="StopWatchingCombo"></span></span> в правой части
экрана просмотра карточки.</p>
</li>
<li>
<p>Выберите вариант «Отключить оповещения».</p>
</li>
<li>
<p>Нажмите <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span> в окне предупреждения о прекращении
наблюдения.<br>
  Дальнейшее наблюдение за задачей будет происходить без получения уведомлений
об изменениях состояния задачи.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_прекращение_наблюдения_за_задачей">Прекращение наблюдения за задачей</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Наблюдатель может в любой момент прекратить наблюдения за задачей, если
посчитает это целесообразным.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку задачи.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/StopWatchingCombo.svg" alt="StopWatchingCombo"></span></span> в правой части
экрана просмотра карточки.</p>
</li>
<li>
<p>Выберите вариант «Удалить из наблюдателей».</p>
</li>
<li>
<p>Нажмите <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span> в окне предупреждения об исключении
себя из списка наблюдателей.</p>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="ProcessActionstab5" class="tabcontentProcessActions" style="display: none;">
                    
                     </div></div>


`;