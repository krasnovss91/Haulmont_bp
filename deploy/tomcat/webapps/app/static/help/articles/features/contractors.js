const contractors = `<!DOCTYPE html>
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
<div class="tabs" id="ContractorsTabs"><button class="tablinkContractors" onclick="openPage('Contractorstab1', this)" id="defaultOpenContractors">
Юридические лица</button><button class="tablinkContractors" onclick="openPage('Contractorstab2', this)" >
Физические лица</button><button class="tablinkContractors" onclick="openPage('Contractorstab3', this)" >
</button></div>
      <div class="tabsPages" id="ContractorsPages">   <div id="Contractorstab1" class="tabcontentContractors" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Справочник «Юридические лица»</span></p>
</div>
<div class="paragraph">
<p>Справочник содержит информацию о контрагентах, являющихся юридическими
лицами.</p>
</div>
<div class="paragraph">
<p>Открыть справочник можно через меню «<strong>Справочники</strong>» – «<strong>Контрагенты</strong>» –
«<strong>Юридические лица</strong>» либо с помощью сочетания клавиш «<strong>Alt+M</strong>».</p>
</div>
<div class="paragraph">
<p>Справочник позволяет создавать, изменять и удалять карточки юридических
лиц с помощью соответствующих кнопок.</p>
</div>
<div class="paragraph">
<p>Чтобы обновить экран нужно нажать на кнопку <span class="noBorder"><span class="image"><img src="img/GeneralButtonUpdate.svg" alt="GeneralButtonUpdate"></span></span>.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralCorporations.png" alt="GeneralCorporations"></span></p>
</div>
<div class="paragraph">
<p>Кнопка «Загрузить из CSV» позволяет заполнить справочник на основании
файла со списком контрагентов в формате *.csv. Кнопка доступна только
пользователю с ролью «Администратор».</p>
</div>
<div class="paragraph">
<p>Для просмотра и редактирования информации о контрагенте необходимо
дважды нажать на соответствующую строку таблицы или выделить нужного
контрагента и один раз нажать на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonEdit.svg" alt="ButtonEdit"></span></span>.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralCorporationsTabMain.png" alt="GeneralCorporationsTabMain"></span></p>
</div>
<div class="paragraph">
<p>Если в Системе включена соответствующая функция, то при сохранении
нового контрагента будет произведена проверка на уникальность записи в
справочнике по сочетанию полей «ИНН» и «КПП». В случае обнаружения
дубликата Система предложит выбрать дальнейшее действие: обновить
информацию по существующему контрагенту или не сохранять новую запись.
Для включения данной функции следует обратиться к Администратору.</p>
</div>
<div class="sect1">
<h2 id="_описание_вкладок_карточки">Описание вкладок карточки:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p>«<strong>Главная</strong>» – задается основная информация о контрагенте: наименование, адреса,
телефон, факс и т.д.<br>
   Здесь же можно указать действующую ссылку на сайт контрагента и его статус
(нерезидент, поставщик и/или покупатель).<br>
    Если в Системе настроена интеграция с внешней учётной системой
(например, 1С), то данные о контрагенте (физическом или юридическом
лице) можно выгрузить в нее. Для этого необходимо нажать на кнопку
«Пометить к выгрузке в УС». При этом выставляется состояние «Помечен к
выгрузке в УС» и при любых изменениях информация о контрагенте будет
выгружаться повторно. Если для договора, выгружаемого в УС, был создан
новый контрагент, который не был помечен к выгрузке, то контрагент
выгружается вместе с договором.</p>
</li>
<li>
<p>«<strong>Контактные лица</strong>» – можно создавать, изменять и удалять контактные лица
организации-контрагента.<br>
    Для редактирования контактного лица необходимо дважды нажать на
соответствующую строку или выделить нужного контрагента и один раз
нажать на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonEdit.svg" alt="ButtonEdit"></span></span>.<br>
    <span class="image"><img src="img/GeneralEditingContactDetails.png" alt="GeneralEditingContactDetails"></span><br>
    Для корректной печати ФИО и должности контактного лица в письмах (отчет
«Печать письма») требуется заполнить данную информацию в дательном
падеже в соответствующих полях формы.<br>
    Для корректного обращения в e-mail уведомлениях («Уважаемый» или
«Уважаемая») требуется указать пол контактного лица.</p>
</li>
<li>
<p>«<strong>Счета</strong>» – вносится информация о существующих счетах контрагента.<br>
    Счета могут быть созданы, изменены и удалены.<br>
    <span class="image"><img src="img/GeneralEditingAccountCorporations.png" alt="GeneralEditingAccountCorporations"></span><br>
    В карточке счёта контрагента поле «Корреспондентский счет» заполняется
автоматически при выборе банка по данным из карточки банка.<br>
    Счета выгружаются вместе с контрагентом во внешнюю учетную систему
(например, 1С). На карточке счёта отображается только информация о
статусе счёта. Счёт автоматически помечается на выгрузку в УС при любом
его изменении, но при условии, что контрагент для данного счёта уже был
выгружен в УС.</p>
</li>
<li>
<p>«<strong>Вложения</strong>» – аналогична соответствующей вкладке карточек документа или договора.</p>
</li>
<li>
<p>«<strong>История переписки</strong>» – указаны документы, при регистрации которых соответствующее
юридическое лицо было указано в качестве адресата или отправителя.<br>
    Также в истории переписки будут показаны письма, в которых при
регистрации документа было заполнено поле «В ответ на».<br>
    Для того чтобы открыть документ из истории переписки необходимо выбрать
нужный документ и дважды нажать на его название.<br>
    <span class="image"><img src="img/GeneralCorporationsTabChatingHistory.png" alt="GeneralCorporationsTabChatingHistory"></span></p>
</li>
<li>
<p>«<strong>История изменений</strong>» – отображена информация обо всех изменениях, совершенных
пользователями.</p>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="Contractorstab2" class="tabcontentContractors" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Справочник «Физические лица»</span></p>
</div>
<div class="paragraph">
<p>Справочник содержит информацию о контрагентах, являющихся физическими
лицами.</p>
</div>
<div class="paragraph">
<p>Открыть справочник можно через меню «<strong>Справочники</strong>» – «<strong>Контрагенты</strong>» –
«<strong>Физические лица</strong>».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralIndividuals.png" alt="GeneralIndividuals"></span></p>
</div>
<div class="paragraph">
<p>Справочник позволяет создавать, изменять и удалять карточки физических
лиц с помощью соответствующих кнопок.</p>
</div>
<div class="paragraph">
<p>Чтобы обновить экран нужно нажать на кнопку <span class="noBorder"><span class="image"><img src="img/GeneralButtonUpdate.svg" alt="GeneralButtonUpdate"></span></span>.</p>
</div>
<div class="paragraph">
<p>Для просмотра и редактирования информации о контрагенте необходимо
дважды нажать на соответствующую строку таблицы или выделить нужного
контрагента и один раз нажать на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonEdit.svg" alt="ButtonEdit"></span></span>.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralIndividualsTabMain.png" alt="GeneralIndividualsTabMain"></span></p>
</div>
<div class="sect1">
<h2 id="_описание_вкладок">Описание вкладок:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p>«<strong>Главная</strong>» – задается основная информация о контрагенте: имя, адреса, телефон,
факс и т.д.<br>
  Здесь же можно указать действующую ссылку на сайт контрагента и его
статус (нерезидент, поставщик и/или покупатель).</p>
</li>
<li>
<p>«<strong>Счета</strong>» – задается информация о существующих счетах контрагента.<br>
    <span class="image"><img src="img/GeneralIndividualsEditingAccountData.png" alt="GeneralIndividualsEditingAccountData"></span><br>
    Счета могут быть созданы, изменены и удалены.<br>
    При создании и редактировании счета необходимо указать номер счета,
выбрать банк и валюту из списков, заданных в Системе, а также при
необходимости добавить комментарий.
    <span class="image"><img src="img/GeneralIndividualsEditingAccount.png" alt="GeneralIndividualsEditingAccount"></span></p>
</li>
<li>
<p>«<strong>Вложения</strong>» – аналогична соответствующей вкладке карточек документа или договора.</p>
</li>
<li>
<p>«<strong>История переписки</strong>» – указаны документы, при регистрации которых соответствующее
физическое лицо было указано в качестве адресата или отправителя.<br>
    Также в истории переписки будут показаны письма, в которых при
регистрации документа было заполнено поле «В ответ на».<br>
    Для того чтобы открыть документ из истории переписки необходимо выбрать
нужный документ и дважды нажать на его название.</p>
</li>
<li>
<p>«<strong>История изменений</strong>» – отображается информация обо всех изменениях, совершенных
пользователями.</p>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="Contractorstab3" class="tabcontentContractors" style="display: none;">
                    
                     </div></div>


`;