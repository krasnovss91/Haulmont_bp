const templates = `<!DOCTYPE html>
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
<div class="tabs" id="TemplatesTabs"><button class="tablinkTemplates" onclick="openPage('Templatestab1', this)" id="defaultOpenTemplates">
Для задачи</button><button class="tablinkTemplates" onclick="openPage('Templatestab2', this)" >
Для группы задач</button><button class="tablinkTemplates" onclick="openPage('Templatestab3', this)" >
</button></div>
      <div class="tabsPages" id="TemplatesPages">   <div id="Templatestab1" class="tabcontentTemplates" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Шаблоны задач</span></p>
</div>
<div class="paragraph">
<p>Шаблоны задач позволяют оптимизировать процесс создания типовых задач
и находятся в пункте меню «Задачи» – «Шаблоны задач».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TaskTemplates.png" alt="TaskTemplates"></span></p>
</div>
<div class="paragraph">
<p>Шаблон можно создать, изменить или удалить с помощью соответствующих
кнопок или пунктов контекстного меню.</p>
</div>
<div class="sect1">
<h2 id="_способы">Способы:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>создание нового шаблона задач</strong> – в этом случае откроется окно редактирования
шаблона задач, в котором нужно заполнить необходимые поля (для создания нажмите
на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCreateCombo.svg" alt="ButtonCreateCombo"></span></span> – «Новый»);</p>
</li>
<li>
<p><strong>копирование существующего шаблона</strong> – в этом случае создается копия выбранного
из списка шаблона (для того, чтобы скопировать выбранный шаблон, нажмите
кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCreateCombo.svg" alt="ButtonCreateCombo"></span></span> – «Копировать»).</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>Кнопка <span class="noBorder"><span class="image"><img src="img/ButtonCreateTheTask.svg" alt="ButtonCreateTheTask"></span></span> создает задачу на основе выбранного шаблона.</p>
</div>
<div class="paragraph">
<p>Также задачи по шаблону можно создавать из списка задач или с помощью кнопки
<span class="noBorder"><span class="image"><img src="img/ButtonFillFromTheTemplate.svg" alt="ButtonFillFromTheTemplate"></span></span> в карточке новой задачи.</p>
</div>
<div class="paragraph">
<p>Заполнение вкладки «Детали шаблона» нового шаблона задач в целом
аналогично заполнению вкладки «Детали задачи» при создании новой задачи.</p>
</div>
<div class="paragraph">
<p>Кроме того, в шаблоне можно назначить пользователей на роли участников
процесса выполнения задачи. Этот процесс аналогичен процессу назначения
ролей для новой задачи.</p>
</div>
<div class="paragraph">
<p>Шаблоны задач доступны для редактирования по умолчанию только Автору
и Администратору.</p>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_описание_вкладок_карточки">Описание вкладок карточки:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>«Вложения»</strong> – можно прикрепить к шаблону документы в качестве вложений.<br>
   Можно загрузить как один файл и его версии, так и сразу несколько файлов, а 
   также отсканировать документ непосредственно из Системы, и
использовать отсканированный документ в качестве вложения к карточке задачи. В
таком случае добавленное вложение и все его версии будут
автоматически копироваться в карточку, созданную по этому шаблону.</p>
</li>
<li>
<p><strong>«Проекты»</strong> – позволяет указать проекты, к которым будет относиться созданная
по данному шаблону задача.</p>
</li>
<li>
<p><strong>«Доп.поля»</strong> – содержит дополнительные поля для соответствующего типа задач.
Настройка дополнительных полей осуществляется Администратором.</p>
</li>
<li>
<p><strong>«Безопасность»</strong> – работает по аналогии с шаблонами документов, договоров и
совещаний. На ней можно указать тех пользователей, которые должны получить доступ
к карточке, созданной на основании данного шаблона. Выбор участников осуществляется
так же как и для вкладки «Доступ к шаблону».</p>
</li>
<li>
<p><strong>«Доступ к шаблону»</strong> – дает возможность определять круг пользователей, имеющих
доступ к шаблону.<br>
   В системе ТЕЗИС можно создавать шаблоны, общие для всех пользователей. Для
этого при создании шаблона необходимо отметить чек-бокс «Общий для
всех пользователей». Если требуется сделать общим уже созданный шаблон, то
необходимо обратиться к его Автору или Администратору.<br>
   Для того чтобы установить доступ к шаблону для отдельных пользователей
откройте вкладку «Доступ к шаблону» и нажмите кнопу <span class="noBorder"><span class="image"><img src="img/ButtonAdd.svg" alt="ButtonAdd"></span></span>
(при этом откроется окно выбора участников). Чтобы добавить пользователей в список,
имеющих доступ, нужно кликнуть два раза по имени участника. Также можно выделить
нужного пользователя в списке левого окна и нажав на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonTransfer.svg" alt="ButtonTransfer"></span></span>
перенести в правое окно.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ParticipantsSelection.png" alt="ParticipantsSelection"></span></p>
</div>
<div class="paragraph">
<p>Заполненный и сохраненный шаблон можно использовать при создании задач.</p>
</div>
</div>
</div>
                     </div>   <div id="Templatestab2" class="tabcontentTemplates" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Шаблоны группы задач</span></p>
</div>
<div class="paragraph">
<p>Шаблоны групп задач позволяют упростить создание часто используемых
групп задач и находятся в пункте меню «Задачи» – «Шаблоны групп задач».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TaskGroupTemplates.png" alt="TaskGroupTemplates"></span></p>
</div>
<div class="paragraph">
<p>Для создания шаблона группы задач выберите пункт меню «Задачи» –
«Шаблоны группы задач» и нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCreate.svg" alt="ButtonCreate"></span></span>.</p>
</div>
<div class="paragraph">
<p>В открывшемся окне заполните поля и добавьте необходимые задачи.</p>
</div>
<div class="paragraph">
<p>Длительность в шаблоне групп задач указывается в днях, часах или
минутах, а не в виде конкретной даты.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TaskGroupTemplateEditing.png" alt="TaskGroupTemplateEditing"></span></p>
</div>
<div class="paragraph">
<p>Шаблоны групп задач доступны для редактирования по умолчанию только
Автору и Администратору.</p>
</div>
<div class="paragraph">
<p>Использовать в работе можно не только свои шаблоны. Для того чтобы
шаблон групп задач сделать доступным для всех пользователей, необходимо
отметить чек-бокс «Общий для всех пользователей».</p>
</div>
<div class="paragraph">
<p>Во вкладке «Вложения» можно прикрепить к шаблону документы в качестве
вложений. Можно загрузить как один файл и его версии, так и сразу
несколько файлов, а также отсканировать документ непосредственно из
Системы и использовать его в качестве вложения к карточке задачи. В
таком случае добавленное вложение и все его версии будут автоматически
копироваться в карточку, созданную по этому шаблону.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/AddingAttachments.png" alt="AddingAttachments"></span></p>
</div>
                     </div>   <div id="Templatestab3" class="tabcontentTemplates" style="display: none;">
                    
                     </div></div>


`;