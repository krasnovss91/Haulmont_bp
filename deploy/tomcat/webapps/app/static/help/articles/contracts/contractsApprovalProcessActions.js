const contractsApprovalProcessActions = `<!DOCTYPE html>
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
<div class="tabs" id="ContractsApprovalProcessActionsTabs"><button class="tablinkContractsApprovalProcessActions" onclick="openPage('ContractsApprovalProcessActionstab1', this)" id="defaultOpenContractsApprovalProcessActions">
Инициатор</button><button class="tablinkContractsApprovalProcessActions" onclick="openPage('ContractsApprovalProcessActionstab2', this)" >
Согласующий</button><button class="tablinkContractsApprovalProcessActions" onclick="openPage('ContractsApprovalProcessActionstab3', this)" >
Утверждающий</button><button class="tablinkContractsApprovalProcessActions" onclick="openPage('ContractsApprovalProcessActionstab4', this)" >
Секретарь</button><button class="tablinkContractsApprovalProcessActions" onclick="openPage('ContractsApprovalProcessActionstab5', this)" >
</button></div>
      <div class="tabsPages" id="ContractsApprovalProcessActionsPages">   <div id="ContractsApprovalProcessActionstab1" class="tabcontentContractsApprovalProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Инициатора</span></p>
</div>
<div class="paragraph">
<p>Действия Инициатора можно разбить на несколько этапов:</p>
</div>
<div class="sect1">
<h2 id="_создание_карточки_договора">Создание карточки договора</h2>
<div class="sectionbody">
<div class="paragraph">
<p>В системе ТЕЗИС возможно создание карточки договора несколькими
способами.</p>
</div>
<div class="paragraph">
<p>Подробно варианты различных действий рассмотрены в разделе «Способы
создания».</p>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_отправка_договора_на_согласование">Отправка договора на согласование</h2>
<div class="sectionbody">
<div class="paragraph">
<p>По договору может быть запущен один из процессов сразу после создания
новой карточки, а также путем выбора из списка существующих карточек.</p>
</div>
<div class="paragraph">
<p>Карточки договоров можно найти:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>в папке меню «<strong>Документы</strong>» – «<strong>Список договоров</strong>»;</p>
</li>
<li>
<p>в папке действий по документам «<strong>Черновики</strong>» (в случае если ни один из процессов
по карточке еще не запускался).</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку договора.<br>
  Если договор был создан ранее, то его можно найти в меню «Документы» –
«Список договоров» или в папке действий «Документы».</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonAgreement.svg" alt="ButtonAgreement"></span></span> в правой части экрана просмотра
карточки.</p>
</li>
<li>
<p>Нажмите <span class="noBorder"><span class="image"><img src="img/ButtonYes.svg" alt="ButtonYes"></span></span>, подтвердив запуск процесса согласования.<br>
Откроется окно подтверждения списка пользователей.</p>
</li>
<li>
<p>Назначьте сотрудников и определите вариант их уведомления в окне
подтверждения списка пользователей.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span> после того, как все данные введены.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_доработка_договора">Доработка договора</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Как только договор отклонен Согласующим или Утверждающим, он
возвращается Инициатору на доработку.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Открыть карточку договора.</p>
</li>
<li>
<p>Просмотреть данные карточки и ознакомиться с обоснованием возврата
от Согласующего или Утверждающего на вкладке «Обсуждения».</p>
</li>
<li>
<p>Внести необходимые изменения в поля карточки или добавить необходимые
вложения в карточку.</p>
</li>
<li>
<p>Нажать кнопку <span class="noBorder"><span class="image"><img src="img/ButtonSubmitForApproval.svg" alt="ButtonSubmitForApproval"></span></span> в
правой части экрана просмотра карточки.</p>
</li>
<li>
<p>В карточке подтверждения выбрать вариант дальнейшего процесса согласования.<br>
  Если отметить галочку «Повторное согласование только для не
согласовавших пользователей», то договор отправится на согласование
только не согласовавшим участникам процесса.<br>
  Если необходимо запустить новый цикл полного согласования – то следует
проверить чтобы галочка повторного согласования не была отмечена.<br>
  Заполнение поля «Комментарий» необязательно.</p>
</li>
<li>
<p>Нажать кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_отмена_процесса">Отмена процесса</h2>
<div class="sectionbody">
<div class="paragraph">
<p>В любое время до завершения процесса возможно отменить процесс по
договору.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку договора.</p>
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
</div>
</div>
                     </div>   <div id="ContractsApprovalProcessActionstab2" class="tabcontentContractsApprovalProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Согласующего</span></p>
</div>
<div class="paragraph">
<p>Как только договор направлен на согласование, он поступает к
Согласующему.</p>
</div>
<div class="paragraph">
<p>Карточку данного договора можно найти на основном экране системы ТЕЗИС:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>в центральной части в разделе текущих назначений;</p>
</li>
<li>
<p>в левой части в папке действий по документам «Согласование»;</p>
</li>
<li>
<p>в правой части в области уведомлений;</p>
</li>
<li>
<p>в меню «Документы» в списках договоров.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ContractsApprovalReviewerGeneralMainScreen.png" alt="ContractsApprovalReviewerGeneralMainScreen"></span></p>
</div>
<div class="sect2">
<h3 id="_действия">Действия:</h3>

</div>
<div class="sect1">
<h2 id="_согласование_договора">Согласование договора</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При отсутствии замечаний к содержанию и вложениям договор
согласовывается.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку договора и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonApprove.svg" alt="ButtonApprove"></span></span> в правой части экрана просмотра
карточки.</p>
</li>
<li>
<p>Добавьте при необходимости комментарий в открывшемся окне записи
журнала действий.<br>
  Заполнение поля «Комментарий» необязательно.<br>
  Пользователь может согласовать договор, подписав не только вложения договора,
но и поля карточки с помощью электронной цифровой подписи.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_отклонение_договора">Отклонение договора</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При наличии замечаний к договору он отклоняется.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку договора и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonReject.svg" alt="ButtonReject"></span></span> в правой части экрана просмотра
карточки.</p>
</li>
<li>
<p>Добавьте комментарий в открывшемся окне записи журнала действий.<br>
Заполнение поля «Комментарий» обязательно.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="ContractsApprovalProcessActionstab3" class="tabcontentContractsApprovalProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Утверждающего</span></p>
</div>
<div class="paragraph">
<p>Как только договор согласован всеми указанными в карточке
пользователями, он поступает к Утверждающему.</p>
</div>
<div class="paragraph">
<p>Карточку данного договора можно найти на основном экране системы ТЕЗИС:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>в центральной части в разделе текущих назначений;</p>
</li>
<li>
<p>в левой части в папке действий по документам «Утверждение»;</p>
</li>
<li>
<p>в правой части в области уведомлений;</p>
</li>
<li>
<p>в меню «Документы» в списках договоров.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ContractsApprovalApproverGeneralMainScreen.png" alt="ContractsApprovalApproverGeneralMainScreen"></span></p>
</div>
<div class="sect2">
<h3 id="_действия">Действия:</h3>

</div>
<div class="sect1">
<h2 id="_утверждение_договора">Утверждение договора</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При отсутствии замечаний к содержанию и вложениям договор утверждается.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку договора и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonAffirm.svg" alt="ButtonAffirm"></span></span> в
правой части экрана просмотра карточки.</p>
</li>
<li>
<p>Добавьте при необходимости комментарий в открывшемся окне записи
журнала действий.<br>
  Заполнение поля «Комментарий» необязательно.<br>
  Пользователь может утвердить договор, подписав не вложения документа, но
и поля карточки с помощью электронной цифровой подписи.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_отправка_договора_на_доработку_инициатору">Отправка договора на доработку Инициатору</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При наличии замечаний к договору он отправляется на доработку.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку договора и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonToSendBackForRevision.svg" alt="ButtonToSendBackForRevision"></span></span> в правой части
экрана просмотра карточки.</p>
</li>
<li>
<p>Добавьте комментарий в открывшемся окне записи журнала действий.<br>
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
<h2 id="_отмена_согласования">Отмена согласования</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Утверждающий имеет возможность отменить согласование по договору.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку документа и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonToCancelTheAgreement.svg" alt="ButtonToCancelTheAgreement"></span></span> в
правой части экрана просмотра карточки.</p>
</li>
<li>
<p>Добавьте комментарий в открывшемся окне записи журнала действий.<br>
Заполнение поля «Комментарий» обязательно.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.</p>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="ContractsApprovalProcessActionstab4" class="tabcontentContractsApprovalProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Секретаря</span></p>
</div>
<div class="paragraph">
<p>Как правило договоры не проходят процесс регистрации, а номер
присваивается при сохранении или при создании карточки договора. Однако
если при запуске процесса согласования была назначена роль Секретаря, то
после утверждения договор поступает на регистрацию.</p>
</div>
<div class="paragraph">
<p>Карточку данного договора можно найти на основном экране системы ТЕЗИС:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>в центральной части в разделе текущих назначений;</p>
</li>
<li>
<p>в левой части в папке действий канцелярии «Регистрация»;</p>
</li>
<li>
<p>в правой части в области уведомлений;</p>
</li>
<li>
<p>в меню «Документы» в списках договоров.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ContractsApprovalSecretaryGeneralMainScreen.png" alt="ContractsApprovalSecretaryGeneralMainScreen"></span></p>
</div>
<div class="sect2">
<h3 id="_действия">Действия:</h3>

</div>
<div class="sect1">
<h2 id="_регистрация_договора">Регистрация договора</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку договора и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonRegister.svg" alt="ButtonRegister"></span></span> в правой части экрана
просмотра карточки.</p>
</li>
<li>
<p>Заполните все необходимые поля.<br>
Обязательные для заполнения поля отмечены <strong class="red">*</strong>.</p>
</li>
<li>
<p>Получите регистрационный номер для договора с помощью кнопки
<span class="noBorder"><span class="image"><img src="img/ButtonGetANumber.svg" alt="ButtonGetANumber"></span></span> в окне регистрации.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span> для завершения процесса
регистрации документа.</p>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="ContractsApprovalProcessActionstab5" class="tabcontentContractsApprovalProcessActions" style="display: none;">
                    
                     </div></div>


`;