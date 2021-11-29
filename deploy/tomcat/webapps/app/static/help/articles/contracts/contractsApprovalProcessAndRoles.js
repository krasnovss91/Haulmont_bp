const contractsApprovalProcessAndRoles = `<!DOCTYPE html>
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
<div class="tabs" id="ContractsApprovalProcessAndRolesTabs"><button class="tablinkContractsApprovalProcessAndRoles" onclick="openPage('ContractsApprovalProcessAndRolestab1', this)" id="defaultOpenContractsApprovalProcessAndRoles">
Схема процесса</button><button class="tablinkContractsApprovalProcessAndRoles" onclick="openPage('ContractsApprovalProcessAndRolestab2', this)" >
Роли</button><button class="tablinkContractsApprovalProcessAndRoles" onclick="openPage('ContractsApprovalProcessAndRolestab3', this)" >
</button></div>
      <div class="tabsPages" id="ContractsApprovalProcessAndRolesPages">   <div id="ContractsApprovalProcessAndRolestab1" class="tabcontentContractsApprovalProcessAndRoles" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Схема процесса согласования договора</span></p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ContractsApprovalProcessAndRoles.png" alt="ContractsApprovalProcessAndRoles"></span></p>
</div>
<div class="paragraph">
<p>Процесс согласования договора может быть представлен следующим образом:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Инициатор создает карточку договора, назначает Согласующих, Утверждающего,
Секретаря и запускает процесс.</p>
</li>
<li>
<p>Договор переходит к Согласующему который:</p>
<div class="ulist circle">
<ul class="circle">
<li>
<p>если договор нуждается в доработке, то возвращает его Инициатору;</p>
</li>
<li>
<p>если договор не вызывает возражений, то согласовывает его и договор
переходит у следующему пользователю на согласование.<br>
<br>
 <em>После того как договор согласован всеми Согласующими, он направляется
Утверждающему.</em></p>
</li>
</ul>
</div>
</li>
<li>
<p>Договор переходит к Утверждающему который:</p>
<div class="ulist circle">
<ul class="circle">
<li>
<p>если договор нуждается в доработке, то возвращает его Инициатору и
процесс согласования начинается заново;</p>
</li>
<li>
<p>если Утверждающий утверждает договор, он отправляется регистрацию.<br>
<br>
 <em>Если при запуске процесса был назначен Секретарь, то после утверждения
договора он переходит к нему для регистрации. Если никто из
пользователей Системы не был назначен на данную роль, то процесс
согласования завершается.</em></p>
</li>
</ul>
</div>
</li>
<li>
<p>После утверждения договора Утверждающим он переходит к Секретарю,
который регистрирует его.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>Как правило договоры не проходят процесс регистрации, а номер
присваивается при сохранении или при создании карточки договора. Если
регистрация не требуется, то роль Секретаря не добавляется в список
ролей (по умолчанию эта роль скрыта).</p>
</div>
<div class="paragraph">
<p>Процесс может включать в себя этапы параллельного или последовательного
согласования по отдельности, либо оба этапа в любой последовательности.</p>
</div>
<div class="paragraph">
<p>В процессе согласования договоров также может быть отправлен либо только
на согласование, либо только на утверждение. Для этого необходимо
удалить лишние роли из списка при запуске процесса.</p>
</div>
<div class="paragraph">
<p>В процессе согласования также есть возможность менять участников
процесса: добавлять новых, удалять ненужных, выполнять переназначение.
Для настройки указанной возможности нужно обратиться к Администратору.</p>
</div>
<div class="paragraph">
<p>Кроме того, в процессе согласования есть возможность автоматического
определения руководителя автора карточки. В том случае, например, если
процесс согласования договора должен начаться с непосредственного
руководителя сотрудника, необходимо выполнить системную настройку
процесса. Для выполнения настройки нужно обратиться к Администратору.</p>
</div>
<div class="paragraph">
<p>Если согласованный договор получил замечания контрагента и вернулся
с протоколом замечаний, в Системе есть возможность повторного запуска
процесса согласования. В этом случае к карточке договора прикладывается
протокол в качестве вложения и повторно запускается процесс.</p>
</div>
                     </div>   <div id="ContractsApprovalProcessAndRolestab2" class="tabcontentContractsApprovalProcessAndRoles" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Роли процесса согласования договора</span></p>
</div>
<div class="paragraph">
<p>В рамках процесса согласования договоров определены следующие роли:</p>
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
<td class="tableblock halign-left valign-top"><p class="tableblock">Создание договора и направление его на
согласование и утверждение</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Согласующий</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Обязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Согласование договора</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Утверждающий</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Обязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Утверждение договора</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Секретарь</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Необязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Регистрация договора</p></td>
</tr>
</tbody>
</table>
                     </div>   <div id="ContractsApprovalProcessAndRolestab3" class="tabcontentContractsApprovalProcessAndRoles" style="display: none;">
                    
                     </div></div>


`;