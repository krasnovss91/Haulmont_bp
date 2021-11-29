const meetingsReviewProtocolProcessAndRoles = `<!DOCTYPE html>
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
<div class="tabs" id="MeetingsReviewProtocolProcessAndRolesTabs"><button class="tablinkMeetingsReviewProtocolProcessAndRoles" onclick="openPage('MeetingsReviewProtocolProcessAndRolestab1', this)" id="defaultOpenMeetingsReviewProtocolProcessAndRoles">
Схема процесса</button><button class="tablinkMeetingsReviewProtocolProcessAndRoles" onclick="openPage('MeetingsReviewProtocolProcessAndRolestab2', this)" >
Роли</button><button class="tablinkMeetingsReviewProtocolProcessAndRoles" onclick="openPage('MeetingsReviewProtocolProcessAndRolestab3', this)" >
</button></div>
      <div class="tabsPages" id="MeetingsReviewProtocolProcessAndRolesPages">   <div id="MeetingsReviewProtocolProcessAndRolestab1" class="tabcontentMeetingsReviewProtocolProcessAndRoles" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Схема процесса работы с протоколом</span></p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/MeetingsReviewProtocolProcess.png" alt="MeetingsReviewProtocolProcess"></span></p>
</div>
<div class="paragraph">
<p>Процесс работы с протоколом совещания может быть представлен следующим
образом:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Инициатор вносит информацию по проведенному совещанию, назначает
Согласующих, Утверждающего и запускает процесс.</p>
</li>
<li>
<p>Совещание переходит к Согласующему который:</p>
<div class="ulist circle">
<ul class="circle">
<li>
<p>если протокол нуждается в доработке, то возвращает его Инициатору;</p>
</li>
<li>
<p>если протокол не вызывает возражений, то согласовывает его и совещание
переходит у следующему пользователю на согласование.<br>
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
<p>если протокол нуждается в доработке, то возвращает его Инициатору
и процесс согласования начинается заново;</p>
</li>
<li>
<p>если Утверждающий не имеет возражение, то протокол совещания
утверждается.</p>
</li>
</ul>
</div>
</li>
<li>
<p>Совещание переходит к Инициатору, который по итогам принятых решений
создает задачи и на этом процесс завершается.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>По поручению Инициатора все действия с карточкой может также
осуществлять Секретарь. В этом случае Инициатор будет только
инициировать мероприятие, а изменение карточки, запуск процессов и т.д.
будет осуществлять Секретарь.</p>
</div>
<div class="paragraph">
<p>Процесс может включать в себя этапы параллельного или последовательного
согласования по отдельности, либо оба этапа в любой последовательности.</p>
</div>
<div class="paragraph">
<p>В процессе согласования протокол совещания также может быть отправлен
либо только на согласование, либо только на утверждение. Для этого
необходимо удалить лишние роли из списка при запуске процесса.</p>
</div>
<div class="paragraph">
<p>В процессе согласования также есть возможность менять участников
процесса: добавлять новых, удалять ненужных, выполнять переназначение.
Для настройки указанной возможности нужно обратиться к Администратору.</p>
</div>
<div class="paragraph">
<p>В процессе согласования есть возможность автоматического определения
руководителя Автора карточки. В том случае, например, если процесс
согласования совещания должен начаться с непосредственного руководителя
сотрудника, необходимо выполнить системную настройку процесса. Для
выполнения настройки следует обратиться к Администратору.</p>
</div>
                     </div>   <div id="MeetingsReviewProtocolProcessAndRolestab2" class="tabcontentMeetingsReviewProtocolProcessAndRoles" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Роли процесса работы с протоколом</span></p>
</div>
<div class="paragraph">
<p>В рамках процесса работы над протоколом определены следующие роли:</p>
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
<td class="tableblock halign-left valign-top"><p class="tableblock">Внесение изменений в карточку
совещания и направление протокола на согласование и утверждение</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Согласующий</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Обязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Согласование протокола</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Утверждающий</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Обязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Утверждение протокола</p></td>
</tr>
</tbody>
</table>
                     </div>   <div id="MeetingsReviewProtocolProcessAndRolestab3" class="tabcontentMeetingsReviewProtocolProcessAndRoles" style="display: none;">
                    
                     </div></div>


`;