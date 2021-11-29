const scheduledTask = `<!DOCTYPE html>
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
<div class="tabs" id="ScheduledTaskTabs"><button class="tablinkScheduledTask" onclick="openPage('ScheduledTasktab1', this)" id="defaultOpenScheduledTask">
Общее</button><button class="tablinkScheduledTask" onclick="openPage('ScheduledTasktab2', this)" >
Создать новую</button><button class="tablinkScheduledTask" onclick="openPage('ScheduledTasktab3', this)" >
Копировать существующую</button><button class="tablinkScheduledTask" onclick="openPage('ScheduledTasktab4', this)" >
</button></div>
      <div class="tabsPages" id="ScheduledTaskPages">   <div id="ScheduledTasktab1" class="tabcontentScheduledTask" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Периодические задачи</span></p>
</div>
<div class="paragraph">
<p>Периодические задачи представляют собой задачи, выполнение которых
происходит по заданному расписанию с определенной периодичностью.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ScheduledTask.png" alt="ScheduledTask"></span></p>
</div>
<div class="paragraph">
<p>Периодические задачи создаются на основе шаблонов задач.</p>
</div>
<div class="paragraph">
<p>Перед созданием периодической задачи следует убедиться в наличии нужного
шаблона или создать новый.</p>
</div>
<div class="paragraph">
<p>Варианты создания периодических задач:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>создать новую</strong>;</p>
</li>
<li>
<p><strong>копировать существующую</strong>.</p>
</li>
</ul>
</div>
                     </div>   <div id="ScheduledTasktab2" class="tabcontentScheduledTask" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Создание новой периодической задачи</span></p>
</div>
<div class="paragraph">
<p>При создании новой периодической задачи создается новая задача, все поля
которой не заполнены.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Нажмите на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCreateCombo.svg" alt="ButtonCreateCombo"></span></span> – «Новую».</p>
</li>
<li>
<p>В открывшемся окне на вкладке «Главная» укажите название задачи и
краткое описание.<br>
<span class="image"><img src="img/EditingScheduledTask.png" alt="EditingScheduledTask"></span><br>
  Нижняя часть окна разделена на две колонки – «Действия» и «Расписания».<br>
  В левой части окна задаются необходимые действия.<br>
  Нажатие на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonEdit.svg" alt="ButtonEdit"></span></span> открывает выбранное действие для
  редактирования.<br>
  В правой части экрана в поле «Расписания» устанавливается периодичность запуска задачи.</p>
</li>
<li>
<p>Добавьте необходимые действия по запуску задачи, нажав на кнопку
<span class="noBorder"><span class="image"><img src="img/ButtonCreate.svg" alt="ButtonCreate"></span></span>.</p>
</li>
<li>
<p>В появившемся окне заполните необходимые поля и нажмите <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.<br>
Добавить действия по запуску задачи можно путем выбора соответствующего шаблона.<br>
Чек-бокс «Уведомлять инициатора о запуске» устанавливает отправку Инициатору
уведомления о ее старте.</p>
</li>
<li>
<p>Нажмите на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCreate.svg" alt="ButtonCreate"></span></span> и установите периодичность
запуска задачи в правой части карточки редактирования периодической задачи в
поле «Расписания».</p>
</li>
<li>
<p>Затем нажмите <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.<br>
  В появившемся окне пользователь может задать периодичность выполнения и точное
  время запуска задачи.<br>
  Если запуск периодической задачи приходится на нерабочий день, то ее старт будет
  выполнен на следующий за ним рабочий день в соответствии с
рабочим календарем.</p>
</li>
<li>
<p>После внесения всей необходимой информации в карточку редактирования
периодической задачи нажмите <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.<br>
  Новая периодическая задача будет сохранена и появится в списке периодических
  задач.<br>
<span class="image"><img src="img/ScheduledTaskList.png" alt="ScheduledTaskList"></span></p>
</li>
</ul>
</div>
                     </div>   <div id="ScheduledTasktab3" class="tabcontentScheduledTask" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Копирование существующей периодической задачи</span></p>
</div>
<div class="paragraph">
<p>При копировании существующей периодической задачи создается новая
задача, которая будет содержать действия и расписания выбранной задачи.</p>
</div>
<div class="paragraph">
<p>Для копирования периодической задачи выделите нужную задачу в списке
периодических задач и нажмите на кнопку
<span class="noBorder"><span class="image"><img src="img/ButtonCreateCombo.svg" alt="ButtonCreateCombo"></span></span> – «Копировать».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/CopyScheduledTask.png" alt="CopyScheduledTask"></span></p>
</div>
<div class="paragraph">
<p>В создаваемую периодическую задачу перенесутся все заполненные данные
из указанной для копирования задачи.</p>
</div>
<div class="paragraph">
<p>Далее пользователь может изменять и добавлять необходимую информацию по 
аналогии с созданием новой периодической задачи.</p>
</div>
<div class="sect1">
<h2 id="_описание_вкладок">Описание вкладок:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>«Журнал»</strong> – отражается выполнение действий в соответствии с расписанием
периодической задачи;</p>
</li>
<li>
<p><strong>«История изменений»</strong> – содержит информацию об изменениях, произведенных в
карточке задачи;</p>
</li>
<li>
<p><strong>«Созданные задачи»</strong> – содержит список всех задач, созданных в результате
наступления времени запуска периодической задачи.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/CreatedTasksScheduledTask.png" alt="CreatedTasksScheduledTask"></span></p>
</div>
</div>
</div>
                     </div>   <div id="ScheduledTasktab4" class="tabcontentScheduledTask" style="display: none;">
                    
                     </div></div>


`;