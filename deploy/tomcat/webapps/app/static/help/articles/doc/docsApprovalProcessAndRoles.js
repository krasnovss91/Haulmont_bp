const docsApprovalProcessAndRoles = `<!DOCTYPE html>
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
<div class="tabs" id="DocsApprovalProcessAndRolesTabs"><button class="tablinkDocsApprovalProcessAndRoles" onclick="openPage('DocsApprovalProcessAndRolestab1', this)" id="defaultOpenDocsApprovalProcessAndRoles">
Схема процесса</button><button class="tablinkDocsApprovalProcessAndRoles" onclick="openPage('DocsApprovalProcessAndRolestab2', this)" >
Роли</button><button class="tablinkDocsApprovalProcessAndRoles" onclick="openPage('DocsApprovalProcessAndRolestab3', this)" >
</button></div>
      <div class="tabsPages" id="DocsApprovalProcessAndRolesPages">   <div id="DocsApprovalProcessAndRolestab1" class="tabcontentDocsApprovalProcessAndRoles" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Схема процесса согласования документа</span></p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/DocsApprovalProcessAndRoles.png" alt="DocsApprovalProcessAndRoles"></span></p>
</div>
<div class="paragraph">
<p>Процесс согласования документа может быть представлен следующим образом:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Инициатор создает карточку документа, назначает Согласующих,
Утверждающего, Секретаря и запускает процесс.</p>
</li>
<li>
<p>Документ переходит к Согласующему который:</p>
<div class="ulist circle">
<ul class="circle">
<li>
<p>если документ нуждается в доработке, то возвращает его Инициатору;</p>
</li>
<li>
<p>если документ не вызывает возражений, то согласовывает его и документ
переходит у следующему пользователю на согласование.<br>
  <br>
   <em>После того как документ согласован всеми Согласующими, он направляется
Утверждающему.</em></p>
</li>
</ul>
</div>
</li>
<li>
<p>Документ переходит к Утверждающему который:</p>
<div class="ulist circle">
<ul class="circle">
<li>
<p>если документ нуждается в доработке, то возвращает его Инициатору
и процесс согласования начинается заново;</p>
</li>
<li>
<p>если Утверждающий утверждает документ, он отправляется регистрацию.<br>
  <br>
   <em>Если при запуске процесса был назначен Секретарь, то после утверждения
документа он переходит к нему для регистрации. Если никто из
пользователей Системы не был назначен на данную роль, то процесс
согласования завершается.</em></p>
</li>
</ul>
</div>
</li>
<li>
<p>После утверждения документа Утверждающим он переходит к Секретарю,
который регистрирует документ.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>Процесс может включать в себя этапы параллельного или последовательного
согласования по отдельности, либо оба этапа в любой последовательности.</p>
</div>
<div class="paragraph">
<p>В процессе согласования документ также может быть отправлен либо только
на согласование, либо только на утверждение. Для этого необходимо
удалить лишние роли из списка при запуске процесса. Если документ не был
зарегистрирован, то при указании соответствующей роли карточка после
утверждения будет направлена делопроизводителю.</p>
</div>
<div class="paragraph">
<p>В процессе согласования также есть возможность менять участников
процесса: добавлять новых, удалять ненужных, выполнять переназначение.
Для настройки указанной возможности нужно обратиться к Администратору.</p>
</div>
<div class="paragraph">
<p>В процессе согласования есть возможность автоматического определения
руководителя автора карточки. В том случае, например, если процесс
согласования документа должен начаться с непосредственного руководителя
сотрудника, необходимо выполнить системную настройку процесса. Для
выполнения настройки следует обратиться к Администратору.</p>
</div>
                     </div>   <div id="DocsApprovalProcessAndRolestab2" class="tabcontentDocsApprovalProcessAndRoles" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Роли процесса согласования документа</span></p>
</div>
<div class="paragraph">
<p>В рамках процесса согласования документов определены следующие роли:</p>
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
<td class="tableblock halign-left valign-top"><p class="tableblock">Создание документа и направление его
на согласование и утверждение</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Согласующий</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Обязательная роль*</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Согласование документа</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Утверждающий</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Обязательная роль*</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Утверждение документа</p></td>
</tr>
<tr>
<td class="tableblock halign-left valign-top"><p class="tableblock"><strong>Секретарь</strong></p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Необязательная роль</p></td>
<td class="tableblock halign-left valign-top"><p class="tableblock">Регистрация документа</p></td>
</tr>
</tbody>
</table>
<div class="paragraph">
<p><em>* одна из указанных ролей обязательная для участия в процессе</em></p>
</div>
                     </div>   <div id="DocsApprovalProcessAndRolestab3" class="tabcontentDocsApprovalProcessAndRoles" style="display: none;">
                    
                     </div></div>


`;