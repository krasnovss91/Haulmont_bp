const meetingsReviewAgendaProcessAndRoles = `<!DOCTYPE html>
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
<div class="tabs" id="MeetingsReviewAgendaProcessAndRolesTabs"><button class="tablinkMeetingsReviewAgendaProcessAndRoles" onclick="openPage('MeetingsReviewAgendaProcessAndRolestab1', this)" id="defaultOpenMeetingsReviewAgendaProcessAndRoles">
Схема процесса</button><button class="tablinkMeetingsReviewAgendaProcessAndRoles" onclick="openPage('MeetingsReviewAgendaProcessAndRolestab2', this)" >
Роли</button><button class="tablinkMeetingsReviewAgendaProcessAndRoles" onclick="openPage('MeetingsReviewAgendaProcessAndRolestab3', this)" >
</button></div>
      <div class="tabsPages" id="MeetingsReviewAgendaProcessAndRolesPages">   <div id="MeetingsReviewAgendaProcessAndRolestab1" class="tabcontentMeetingsReviewAgendaProcessAndRoles" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Схема процесса работы с повесткой</span></p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/MeetingsReviewAgendaProcess.png" alt="MeetingsReviewAgendaProcess"></span></p>
</div>
<div class="paragraph">
<p>Процесс работы с повесткой совещания может быть представлен следующим
образом:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Инициатор создает карточку совещания со статусом повестка, назначает
Согласующих, Утверждающего, Секретаря, участников и запускает процесс.</p>
</li>
<li>
<p>Совещание переходит к Согласующему который:</p>
<div class="ulist circle">
<ul class="circle">
<li>
<p>если повестка нуждается в доработке, то возвращает его Инициатору;</p>
</li>
<li>
<p>если повестка не вызывает возражений, то согласовывает его и совещание
переходит к следующему пользователю на согласование.<br>
 <br>
  <em>После того как совещание согласовано всеми Согласующими, оно
направляется Утверждающему</em>.</p>
</li>
</ul>
</div>
</li>
<li>
<p>Совещание переходит к Утверждающему который:</p>
<div class="ulist circle">
<ul class="circle">
<li>
<p>если повестка нуждается в доработке, то возвращает его Инициатору
и процесс согласования начинается заново;</p>
</li>
<li>
<p>если Утверждающий не имеет возражение, то совещание утверждается.</p>
</li>
</ul>
</div>
</li>
<li>
<p>Секретарь и участники информируются о предстоящем событии.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>По поручению Инициатора все действия с карточкой может также
осуществлять Секретарь. В этом случае Инициатор будет только
инициировать мероприятие, а создание и наполнение карточки, запуск
процессов и т.д. будет осуществлять Секретарь.</p>
</div>
<div class="paragraph">
<p>В процессе согласования совещание также может быть отправлено либо
только на согласование, либо только на утверждение. Для этого необходимо
удалить лишние роли из списка при запуске процесса.</p>
</div>
<div class="paragraph">
<p>В процессе согласования также есть возможность менять участников
процесса: добавлять новых, удалять ненужных, выполнять переназначение.
Для настройки указанной возможности нужно обратиться к Администратору.</p>
</div>
<div class="paragraph">
<p>В процессе согласования есть возможность автоматического определения
руководителя автора карточки. В том случае, например, если процесс
согласования совещания должен начаться с непосредственного руководителя
сотрудника, необходимо выполнить системную настройку процесса. Для
выполнения настройки следует обратиться к Администратору.</p>
</div>
                     </div>   <div id="MeetingsReviewAgendaProcessAndRolestab2" class="tabcontentMeetingsReviewAgendaProcessAndRoles" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Роли процесса работы с повесткой</span></p>
</div>
<div class="paragraph">
<p>В рамках процесса работы над повесткой определены следующие роли:</p>
</div>
<table class="tableblock frame-all grid-all spread">
<colgroup>
<col style="width: 25%;">
<col style="width: 31%;">
<col style="width: 43%;">
</colgroup>
<thead>
<tr>
<th class="tableblock halign-left valign-top"><strong>Роль</strong></th>
<th class="tableblock halign-left valign-top"><strong>Статус</strong></th>
<th class="tableblock halign-left valign-top"><strong>Полномочия</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Инициатор</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Обязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Создание совещания и направление его
на согласование и утверждение</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Согласующий</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Обязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Согласование совещания</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Утверждающий</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Обязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Утверждение совещания</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Секретарь</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Необязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Ведение протокола совещания</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Участник</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Необязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Участие в совещании</p></td>
</tr>
</tbody>
</table>
                     </div>   <div id="MeetingsReviewAgendaProcessAndRolestab3" class="tabcontentMeetingsReviewAgendaProcessAndRoles" style="display: none;">
                    
                     </div></div>


`;