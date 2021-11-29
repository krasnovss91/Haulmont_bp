const meetingsReviewProtocolProcessActions = `<!DOCTYPE html>
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
<div class="tabs" id="MeetingsReviewProtocolProcessActionsTabs"><button class="tablinkMeetingsReviewProtocolProcessActions" onclick="openPage('MeetingsReviewProtocolProcessActionstab1', this)" id="defaultOpenMeetingsReviewProtocolProcessActions">
Инициатор</button><button class="tablinkMeetingsReviewProtocolProcessActions" onclick="openPage('MeetingsReviewProtocolProcessActionstab2', this)" >
Согласующий</button><button class="tablinkMeetingsReviewProtocolProcessActions" onclick="openPage('MeetingsReviewProtocolProcessActionstab3', this)" >
Утверждающий</button><button class="tablinkMeetingsReviewProtocolProcessActions" onclick="openPage('MeetingsReviewProtocolProcessActionstab4', this)" >
</button></div>
      <div class="tabsPages" id="MeetingsReviewProtocolProcessActionsPages">   <div id="MeetingsReviewProtocolProcessActionstab1" class="tabcontentMeetingsReviewProtocolProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Инициатора</span></p>
</div>
<div class="paragraph">
<p>Действия Инициатора можно разбить на несколько этапов:</p>
</div>
<div class="sect1">
<h2 id="_доработка_карточки_совещания">Доработка карточки совещания</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Для работы с совещанием в Системе необходимо создать карточку, заполнить
в ней нужные поля и запустить какой-либо процесс.</p>
</div>
<div class="paragraph">
<p>По умолчанию совещание создается в статусе «Повестка». В этом статусе
происходит планирование совещания: заполняется основная информация на
вкладке «Детали», проводится процесс согласования и/или утверждения
повестки. После проведения совещания для фиксации принятых решений
статус совещания следует изменить и добавить необходимую информацию в
карточку.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку совещания из меню «Документы» в списках совещаний.</p>
</li>
<li>
<p>Измените статус совещания с «Повестка» на «Протокол».<br>
В карточке совещания появится вкладка «Решения».</p>
</li>
<li>
<p>Откройте вкладку «Решения».</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCreate.svg" alt="ButtonCreate"></span></span> и
добавьте данные по итогам обсуждения вопросов повестки в открывшемся
окне решения.<br>
  В выпадающем списке поля «Вопрос» выбирается вопрос повестки, по
которому принято решение. Если требуется зафиксировать организационное
решение, которое относится к совещанию в целом, но не касается
какого-либо вопроса конкретно, то вопрос не выбирается.<br>
  В поле «Решение» вносится текстовая информация по содержанию.<br>
  В выпадающем списке полей «Исполнитель» и «Инициатор задачи» выбираются
соответствующие сотрудники компании.<br>
  При необходимости можно указать дату и время срока исполнения и добавить
комментарий.<br>
  При необходимости возможно сразу при создании решения по вопросу
заполнить дополнительные данные по задаче. Это доступно по кнопке
<span class="image"><img src="img/ButtonMinus.svg" alt="ButtonMinus"></span> раздела «Дополнительные сведения».<br>
  Обязательные для заполнения поля отмечены <strong class="red">*</strong>.<br>
  Необязательные поля заполняются при наличии данных.</p>
</li>
<li>
<p>Нажмите кнопку «Добавить» когда все данные по решению будут внесены.<br>
  Система проинформирует о внесении данных по решению, после чего можно
добавлять следующее решение.<br>
  Все созданные решения будут доступны на вкладке «Решения».</p>
</li>
<li>
<p>Сохраните все изменения, внесенные в карточку:</p>
<div class="ulist circle">
<ul class="circle">
<li>
<p>нажмите на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonSave.svg" alt="ButtonSave"></span></span> в правой части экрана просмотра
карточки, если планируете запускать процесс по совещанию (все изменения будут
  сохранены, на экране появится сообщение «Сохранено», карточка останется открытой);</p>
</li>
<li>
<p>нажмите на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonSaveAndClose.svg" alt="ButtonSaveAndClose"></span></span> в правой части экрана
просмотра карточки если дальнейшие действия по карточке совещания в данный
момент не планируются (все изменения, внесенные в карточку после ее открытия,
будут сохранены и карточка закроется).</p>
</li>
</ul>
</div>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_отправка_протокола_на_согласование">Отправка протокола на согласование</h2>
<div class="sectionbody">
<div class="paragraph">
<p>По совещанию может быть запущен процесс сразу после внесения изменений
в карточку, а также путем выбора из списка существующих карточек
совещаний в статусе «Протокол» в папке меню «Документы» – «Список
совещаний».</p>
</div>
<div class="paragraph">
<p>Процедура отправки протокола на согласование аналогична отправке
повестки на согласование.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку совещания.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/MeetingsApprovalProtocol.svg" alt="MeetingsApprovalProtocol"></span></span> в
правой части экрана просмотра карточки.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonYes.svg" alt="ButtonYes"></span></span>, подтвердив запуск процесса согласования.<br>
Откроется окно подтверждения списка пользователей.</p>
</li>
<li>
<p>Проверьте заполненные данные Согласующих и Утверждающего, и при
необходимости внесите изменения.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span> после того, как все данные введены.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_доработка_протокола">Доработка протокола</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Как только протокол отклонен Согласующим или Утверждающим, карточка
совещания возвращается Инициатору на доработку.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Открыть карточку совещания.</p>
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
согласовавших пользователей», то совещание отправиться на согласование
только не согласовавшим участникам процесса.<br>
  Если необходимо запустить новый цикл полного согласования – то следует
проверить чтобы галочка повторного согласования не была отмечена.<br>
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
<h2 id="_создание_задач_по_принятым_решениям">Создание задач по принятым решениям</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Для того чтобы участники совещания не забыли о предстоящем событии, ими
можно отправить приглашение. Совещание по приглашению вносится в
календарь почтовом клиенте. В Системе совещание отображается в
центральной части основного экрана.</p>
</div>
<div class="paragraph">
<p>Инициатор может отправить приглашение всем участникам совещания.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку совещания.</p>
</li>
<li>
<p>Нажать кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCreateTasks.svg" alt="ButtonCreateTasks"></span></span> в правой части экрана
просмотра карточки.</p>
</li>
<li>
<p>В карточке подтверждения создания задач выбрать <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.<br>
  Задачи по указанным в протоколе совещания решениям созданы.
Они также видны на вкладке «Иерархия».</p>
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
совещанию.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку совещания.</p>
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
                     </div>   <div id="MeetingsReviewProtocolProcessActionstab2" class="tabcontentMeetingsReviewProtocolProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Согласующего</span></p>
</div>
<div class="paragraph">
<p>Как только запущен процесс согласования протокола совещания, он
поступает к Согласующему.</p>
</div>
<div class="paragraph">
<p>Карточку данного совещания можно найти на основном экране системы
ТЕЗИС:</p>
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
<p>в меню «Документы» в списках совещаний.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/MeetingsReviewProtocolReviewerGeneralMainScreen.png" alt="MeetingsReviewProtocolReviewerGeneralMainScreen"></span></p>
</div>
<div class="sect2">
<h3 id="_действия">Действия:</h3>

</div>
<div class="sect1">
<h2 id="_согласование_протокола">Согласование протокола</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При отсутствии замечаний к содержанию и вложениям карточки, совещание
согласовывается.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку совещания и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonApprove.svg" alt="ButtonApprove"></span></span> в
правой части экрана просмотра карточки.</p>
</li>
<li>
<p>Добавьте при необходимости комментарий в открывшемся окне записи
журнала действий.<br>
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
<h2 id="_отклонение_протокола">Отклонение протокола</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При наличии замечаний к протоколу он отклоняется.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку совещания и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonReject.svg" alt="ButtonReject"></span></span> в
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
                     </div>   <div id="MeetingsReviewProtocolProcessActionstab3" class="tabcontentMeetingsReviewProtocolProcessActions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Действия Утверждающего</span></p>
</div>
<div class="paragraph">
<p>Как только протокол совещания согласован всеми указанными в карточке
пользователями, он поступает к Утверждающему.</p>
</div>
<div class="paragraph">
<p>Карточку данного документа можно найти на основном экране системы ТЕЗИС:</p>
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
<p>в меню «Документы» в списках совещаний.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/MeetingsReviewProtocolApprover.png" alt="MeetingsReviewProtocolApprover"></span></p>
</div>
<div class="sect2">
<h3 id="_действия">Действия:</h3>

</div>
<div class="sect1">
<h2 id="_утверждение_протокола">Утверждение протокола</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При отсутствии замечаний к содержанию и вложениям карточки, протокол
совещания утверждается.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку совещания и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonAffirm.svg" alt="ButtonAffirm"></span></span> в правой части экрана просмотра
карточки.</p>
</li>
<li>
<p>Добавьте при необходимости комментарий в открывшемся окне записи
журнала действий.<br>
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
<h2 id="_отправка_протокола_на_доработку_инициатору">Отправка протокола на доработку Инициатору</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При наличии замечаний к протоколу, он отправляется на доработку.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку совещания и ознакомьтесь с данными.</p>
</li>
<li>
<p>Нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonToSendBackForRevision.svg" alt="ButtonToSendBackForRevision"></span></span> в
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
<div class="sect1">
<h2 id="_отмена_согласования">Отмена согласования</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Утверждающий имеет возможность отменить согласование по протоколу.</p>
</div>
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Откройте карточку совещания и ознакомьтесь с данными.</p>
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
                     </div>   <div id="MeetingsReviewProtocolProcessActionstab4" class="tabcontentMeetingsReviewProtocolProcessActions" style="display: none;">
                    
                     </div></div>


`;