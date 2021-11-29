const tasksAdditionally = `<!DOCTYPE html>
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
<div class="tabs" id="AdditionallyTabs"><button class="tablinkAdditionally" onclick="openPage('Additionallytab1', this)" id="defaultOpenAdditionally">
Общее</button><button class="tablinkAdditionally" onclick="openPage('Additionallytab2', this)" >
Безопасность</button><button class="tablinkAdditionally" onclick="openPage('Additionallytab3', this)" >
История изменений</button><button class="tablinkAdditionally" onclick="openPage('Additionallytab4', this)" >
История открытий</button><button class="tablinkAdditionally" onclick="openPage('Additionallytab5', this)" >
Проекты</button><button class="tablinkAdditionally" onclick="openPage('Additionallytab6', this)" >
Роли</button><button class="tablinkAdditionally" onclick="openPage('Additionallytab7', this)" >
Связанные карточки</button><button class="tablinkAdditionally" onclick="openPage('Additionallytab8', this)" >
</button></div>
      <div class="tabsPages" id="AdditionallyPages">   <div id="Additionallytab1" class="tabcontentAdditionally" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Общее</span></p>
</div>
<div class="paragraph">
<p>Наименее используемые вкладки карточки вынесены в отдельную дополнительную
вкладку <span class="image"><img src="img/Additional.svg" alt="Additional"></span>, при нажатии на которую откроется перечень с
возможностью выбора.</p>
</div>
<div class="paragraph">
<p>Если необходимо, чтобы какая-нибудь из дополнительных вкладок присутствовала в
карточке постоянно - обратитесь к Администратору для настройки этой функции.</p>
</div>
                     </div>   <div id="Additionallytab2" class="tabcontentAdditionally" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Вкладка «Безопасность»</span></p>
</div>
<div class="paragraph">
<p>Вкладка содержит список пользователей по текущей
задаче, документу, договору или совещанию, которым данная карточка
доступна для просмотра в соответствии с системными настройками.</p>
</div>
<div class="paragraph">
<p>В карточках задач, документов, договоров и совещаний существует
возможность добавлять пользователей, которые будут иметь доступ к
карточке.</p>
</div>
<div class="paragraph">
<p>Данную операцию могут производить Администратор, Автор или Инициатор.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TabSecurity.png" alt="TabSecurity"></span></p>
</div>
<div class="paragraph">
<p>На вкладку «Безопасность» автоматически добавляются пользователи,
указанные в полях «От», «Кому», «Копия» вкладки «Детали» с ролями
«Отправитель», «Получатель» и «Получатель копии» соответственно.</p>
</div>
                     </div>   <div id="Additionallytab3" class="tabcontentAdditionally" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Вкладка «История изменений»</span></p>
</div>
<div class="paragraph">
<p>Вкладка содержит информацию об изменениях,
произведенных в карточке задачи, документа, договора или совещания.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TabChangeHistory.png" alt="TabChangeHistory"></span></p>
</div>
<div class="paragraph">
<p>В процессе создания карточки эта вкладка пустая.</p>
</div>
<div class="paragraph">
<p>Первые записи появятся после сохранения карточки.</p>
</div>
<div class="paragraph">
<p>На вкладке в хронологическом порядке отображаются все изменения.</p>
</div>
<div class="paragraph">
<p>При выделении строк, в таблице снизу будут показаны атрибуты, которые
были изменены и их новое значение.</p>
</div>
                     </div>   <div id="Additionallytab4" class="tabcontentAdditionally" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Вкладка «История открытий»</span></p>
</div>
<div class="paragraph">
<p>На вкладке «История открытий» фиксируется факт открытия карточки задачи,
документа, договора или совещания пользователями Системы.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TabOpenHistory.png" alt="TabOpenHistory"></span></p>
</div>
                     </div>   <div id="Additionallytab5" class="tabcontentAdditionally" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Вкладка «Проекты»</span></p>
</div>
<div class="paragraph">
<p>Зачастую выполнение задач и работа с документами проходят в рамках
конкретных проектов компании. Для их отображения можно создать проекты,
которые будут объединять нужные карточки (подробнее о создании проектов
см. справочник «Проекты»).</p>
</div>
<div class="paragraph">
<p>На вкладке «Проекты» отображаются проекты компании, в рамках которых
ведется работа над задачей или документом.</p>
</div>
<div class="paragraph">
<p>Рядом с названием вкладки отображается число проектов, в которые входит
задача или документ. Карточки могут относиться к нескольким проектам
одновременно.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TabProjects.png" alt="TabProjects"></span></p>
</div>
<div class="paragraph">
<p>С помощью нажатия на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonSetMainProject.svg" alt="ButtonSetMainProject"></span></span> можно отметить, какой
проект является основным (в соответствующем столбце будет отмечен
чек-бокс, а название проекта будет отображаться в списке карточек).</p>
</div>
<div class="paragraph">
<p>Для того чтобы добавить документ или задачу в проект, на вкладке
необходимо нажать на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonAdd.svg" alt="ButtonAdd"></span></span>, в открывшемся
окне выбрать группу проектов и сам проект, а затем нажать на кнопку
<span class="noBorder"><span class="image"><img src="img/ButtonSelect.svg" alt="ButtonSelect"></span></span>.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/AddingProject.png" alt="AddingProject"></span></p>
</div>
<div class="paragraph">
<p>Выбранный проект отобразится во вкладке «Проекты», которая будет
постоянно присутствовать в карточке данной задачи или документа. Одну
задачу или документ можно добавить к разным проектам. Можно указать
основной проект.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/MainProject.png" alt="MainProject"></span></p>
</div>
<div class="paragraph">
<p>После того как проект был добавлен, необходимо нажать на кнопку
<span class="noBorder"><span class="image"><img src="img/ButtonSaveAndClose.svg" alt="ButtonSaveAndClose"></span></span> или <span class="noBorder"><span class="image"><img src="img/ButtonSave.svg" alt="ButtonSave"></span></span>.</p>
</div>
<div class="paragraph">
<p>Просмотреть список всех существующих проектов можно в меню «Справочники»
– «Проекты».</p>
</div>
<div class="paragraph">
<p>В открывшемся окне требуется выбрать группу проектов и сам проект.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ListOfAllProjects.png" alt="ListOfAllProjects"></span></p>
</div>
<div class="paragraph">
<p>Для просмотра списка задач, документов и договоров, относящихся к
проекту, нужно отметить чек-бокс «Показать карточки».</p>
</div>
<div class="paragraph">
<p>Для того чтобы открыть документ или задачу, необходимо дважды нажать
на соответствующую строку таблицы.</p>
</div>
                     </div>   <div id="Additionallytab6" class="tabcontentAdditionally" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Вкладка «Роли»</span></p>
</div>
<div class="paragraph">
<p>Вкладка содержит отображение ролей участников процесса работы над
задачей.</p>
</div>
<div class="paragraph">
<p>Изменять роли во время работы процесса запрещено.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TabRoles.png" alt="TabRoles"></span></p>
</div>
                     </div>   <div id="Additionallytab7" class="tabcontentAdditionally" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Вкладка «Связанные карточки»</span></p>
</div>
<div class="paragraph">
<p>На вкладке отображаются следующие карточки:</p>
</div>
<table class="tableblock frame-all grid-all spread">
<colgroup>
<col style="width: %;">
<col style="width: %;">
</colgroup>
<thead>
<tr>
<th class="tableblock halign-left valign-top"><strong>Вид карточки</strong></th>
<th class="tableblock halign-left valign-top"><strong>Отображаемые карточки</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock">Задача</p></td>
<td class="tableblock halign-left valign-top"><div><div class="ulist circle">
<ul class="circle">
<li>
<p>добавленные пользователем</p>
</li>
</ul>
</div></div></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock">Документ</p></td>
<td class="tableblock halign-left valign-top"><div><div class="ulist circle">
<ul class="circle">
<li>
<p>добавленные пользователем;</p>
</li>
<li>
<p>являющиеся основанием;</p>
</li>
<li>
<p>участвующие в иерархии;</p>
</li>
<li>
<p>из истории переписки</p>
</li>
</ul>
</div></div></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock">Договор</p></td>
<td class="tableblock halign-left valign-top"><div><div class="ulist circle">
<ul class="circle">
<li>
<p>добавленные пользователем;</p>
</li>
<li>
<p>являющиеся основанием;</p>
</li>
<li>
<p>участвующие в иерархии</p>
</li>
</ul>
</div></div></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock">Совещание</p></td>
<td class="tableblock halign-left valign-top"><div><div class="ulist circle">
<ul class="circle">
<li>
<p>добавленные пользователем;</p>
</li>
<li>
<p>являющиеся основанием;</p>
</li>
<li>
<p>участвующие в иерархии</p>
</li>
</ul>
</div></div></td>
</tr>
</tbody>
</table>
<div class="sect1">
<h2 id="_добавление_одной_или_нескольких_карточек">Добавление одной или нескольких карточек</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Открыть в нужной карточке вкладку «Связанные карточки» и нажать на
кнопку <span class="noBorder"><span class="image"><img src="img/ButtonAdd.svg" alt="ButtonAdd"></span></span>.</p>
</li>
<li>
<p>Выбрать тип карточки.<br>
<span class="image"><img src="img/ChoosingCardType.png" alt="ChoosingCardType"></span></p>
</li>
<li>
<p>Выбрать в открывшемся списке нужные карточки и нажать на кнопку
«Выбрать».<br>
<span class="image"><img src="img/SelectingTheRequiredDocument.png" alt="SelectingTheRequiredDocument"></span></p>
</li>
</ul>
</div>
<div class="paragraph">
<p>Карточка выбранной задачи, документа, договора или совещания добавится
на вкладку.</p>
</div>
<div class="paragraph">
<p>Для того чтобы удалить карточку из данной вкладки, необходимо выделить
нужную строку таблицы и нажать на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonRemove.svg" alt="ButtonRemove"></span></span>.</p>
</div>
</div>
</div>
                     </div>   <div id="Additionallytab8" class="tabcontentAdditionally" style="display: none;">
                    
                     </div></div>


`;