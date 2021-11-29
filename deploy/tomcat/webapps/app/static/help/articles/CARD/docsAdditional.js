const docsAdditional = `<!DOCTYPE html>
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
<div class="tabs" id="DocsAdditionalTabs"><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab1', this)" id="defaultOpenDocsAdditional">
Общее</button><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab2', this)" >
Безопасность</button><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab3', this)" >
Версии</button><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab4', this)" >
Журнал передачи</button><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab5', this)" >
История изменений</button><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab6', this)" >
История открытий</button><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab7', this)" >
История переписки</button><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab8', this)" >
Проекты</button><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab9', this)" >
Процессы</button><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab10', this)" >
Связанные карточки</button><button class="tablinkDocsAdditional" onclick="openPage('DocsAdditionaltab11', this)" >
</button></div>
      <div class="tabsPages" id="DocsAdditionalPages">   <div id="DocsAdditionaltab1" class="tabcontentDocsAdditional" style="display: none;">
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
                     </div>   <div id="DocsAdditionaltab2" class="tabcontentDocsAdditional" style="display: none;">
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
                     </div>   <div id="DocsAdditionaltab3" class="tabcontentDocsAdditional" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Вкладка «Версии»</span></p>
</div>
<div class="paragraph">
<p>Вкладка содержит информацию о версиях документа, договора или
совещания созданных в процессе его согласования.</p>
</div>
<div class="paragraph">
<p>Новые записи во вкладке появляются при возврате документа на доработку.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/Versions.png" alt="Versions"></span></p>
</div>
                     </div>   <div id="DocsAdditionaltab4" class="tabcontentDocsAdditional" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Вкладка «Журнал передачи»</span></p>
</div>
<div class="paragraph">
<p>Вкладка отображает информацию о том, у кого
из сотрудников находились или находятся сейчас оригинал или копия
документа или договора.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TransferLog.png" alt="TransferLog"></span></p>
</div>
<div class="paragraph">
<p>При создании новой записи в журнале передачи следует нажать на кнопку
«Создать», заполнить все необходимые поля. Поля обязательные для
заполнения отмечены звездочкой <span class="red">*</span>.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TransferLogRecord.png" alt="TransferLogRecord"></span></p>
</div>
<div class="sect1">
<h2 id="_пользовательские_поля_и_чек_боксы">Пользовательские поля и чек-боксы:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p>поле «<strong>Документ</strong>» – заполняется автоматически, информация в поле не может быть изменена;</p>
</li>
<li>
<p>поле «<strong>Тип экземпляра</strong>» – в зависимости от того, оригинал или копия были переданы
сотруднику, необходимо выбрать соответствующее значение в списке;</p>
</li>
<li>
<p>поле «<strong>Кому передан</strong>» – имя сотрудника, которому был передан документ выбирается
из выпадающего списка или в открывающемся окне по кнопке <span class="noBorder"><span class="image"><img src="img/ButtonEllipsis.svg" alt="ButtonEllipsis"></span></span>;</p>
</li>
<li>
<p>поле «<strong>Дата передачи</strong>» – по умолчанию устанавливается дата создания записи,
но может быть изменена вручную;</p>
</li>
<li>
<p>поле «<strong>Комментарий</strong>» – текстовое поле, содержащее любую необходимую информацию;</p>
</li>
<li>
<p>чек-бокс «<strong>Возвращен</strong>» – отметка, которая должна быть проставлена если документ возвращен;</p>
</li>
<li>
<p>поле «<strong>Дата возврата</strong>» – доступна для заполнения только в случае, если отмечен
чек-бокс «Возвращен» (по умолчанию выставляется дата, когда был отмечен чек-бокс,
но она может быть изменена).</p>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="DocsAdditionaltab5" class="tabcontentDocsAdditional" style="display: none;">
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
                     </div>   <div id="DocsAdditionaltab6" class="tabcontentDocsAdditional" style="display: none;">
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
                     </div>   <div id="DocsAdditionaltab7" class="tabcontentDocsAdditional" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Вкладка «История переписки»</span></p>
</div>
<div class="paragraph">
<p>Вкладка содержит информацию о переписке, частью
которой является текущий документ или договор.</p>
</div>
<div class="paragraph">
<p>История формируется исходя из информации, указанной в поле «В ответ на».</p>
</div>
<div class="paragraph">
<p>Информация представлена в виде иерархического списка, исходящие письма
обозначены синими стрелками <span class="image"><img src="img/ButtonRightArrow.svg" alt="ButtonRightArrow"></span>, входящие – оранжевыми
<span class="image"><img src="img/ButtonLeftArrow.svg" alt="ButtonLeftArrow"></span>.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/CorrespondenceHistory.png" alt="CorrespondenceHistory"></span></p>
</div>
<div class="paragraph">
<p>Текущий документ выделен <span class="blue">синим цветом</span>.</p>
</div>
<div class="paragraph">
<p>Любой документ в списке может быть открыт для просмотра двойным нажатием
на соответствующую строку таблицы.</p>
</div>
                     </div>   <div id="DocsAdditionaltab8" class="tabcontentDocsAdditional" style="display: none;">
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
                     </div>   <div id="DocsAdditionaltab9" class="tabcontentDocsAdditional" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Вкладка «Процессы»</span></p>
</div>
<div class="paragraph">
<p>Данная вкладка содержит информацию о процессах, в которых участвует
текущий документ, договор или совещание.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/Process.png" alt="Process"></span></p>
</div>
<div class="paragraph">
<p>В первой таблице отображается информация о процессах: название, отметка
о том, запущен ли процесс, количество запусков и текущее состояние. При
выборе процесса в первой таблице, во второй таблице отображается список
ролей и пользователей, участвующих в данном процессе.</p>
</div>
<div class="paragraph">
<p>С помощью кнопки «Диаграмма» можно перейти к наглядной диаграмме
процессов, отображающей маршрут всех завершенных и текущих процессов
по документу. Кнопка доступна только для процессов, которые уже были
запущены.</p>
</div>
<div class="paragraph">
<p>Также можно получить общее представление о текущем процессе и посмотреть
визуальное отображение маршрута, нажав на ссылку с названием состояния
во вкладке «Детали».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ProcessChart.png" alt="ProcessChart"></span></p>
</div>
                     </div>   <div id="DocsAdditionaltab10" class="tabcontentDocsAdditional" style="display: none;">
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
                     </div>   <div id="DocsAdditionaltab11" class="tabcontentDocsAdditional" style="display: none;">
                    
                     </div></div>


`;