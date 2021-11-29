const fastRegistrationForm = `<!DOCTYPE html>
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
<div class="tabs" id="FastRegistrationFormTabs"><button class="tablinkFastRegistrationForm" onclick="openPage('FastRegistrationFormtab1', this)" id="defaultOpenFastRegistrationForm">
Поля формы</button><button class="tablinkFastRegistrationForm" onclick="openPage('FastRegistrationFormtab2', this)" >
Шаблоны</button><button class="tablinkFastRegistrationForm" onclick="openPage('FastRegistrationFormtab3', this)" >
Загрузка вложений</button><button class="tablinkFastRegistrationForm" onclick="openPage('FastRegistrationFormtab4', this)" >
Регистрация документа</button><button class="tablinkFastRegistrationForm" onclick="openPage('FastRegistrationFormtab5', this)" >
</button></div>
      <div class="tabsPages" id="FastRegistrationFormPages">   <div id="FastRegistrationFormtab1" class="tabcontentFastRegistrationForm" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Поля формы быстрой регистрации</span></p>
</div>
<div class="paragraph">
<p>Пользовательские поля, чек-боксы и кнопки формы быстрой регистрации
делятся на несколько логических блоков.</p>
</div>
<div class="sect1">
<h2 id="_общая_информация_для_всех_документов">Общая информация для всех документов:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p>поле «<strong>Вид документа</strong>» – указывается вид документа (письмо, приказ,
инструкция);</p>
</li>
<li>
<p>поле «<strong>Канцелярский вид</strong>» – входящий, исходящий или внутренний документ;</p>
</li>
<li>
<p>поле «<strong>Наша организация</strong>» – наименование организации, в которой
регистрируется документ;</p>
</li>
<li>
<p>поле «<strong>Тема</strong>» – текстовое поле, в котором указывается основная тема
документа в краткой произвольной форме (в дальнейшем может
использоваться для поиска документа);</p>
</li>
<li>
<p>поле «<strong>Содержание</strong>» – описание документа в произвольной форме.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_раздел_информация_отправителя_и_регистрационный_номер">Раздел «Информация отправителя» и «Регистрационный номер»:</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Отображаемые в форме поля зависят от вида документа.</p>
</div>
<div class="sect2">
<h3 id="_для_входящего_документа">Для входящего документа:</h3>
<div class="ulist circle">
<ul class="circle">
<li>
<p>поле «<strong>Исх. №</strong>» – номер исходящего документа контрагента;</p>
</li>
<li>
<p>поле «<strong>от</strong>» – дата исходящего документа контрагента (по умолчанию
проставляется текущая дата);</p>
</li>
<li>
<p>поле «<strong>Отправитель</strong>» – наименование организации-контрагента;</p>
</li>
<li>
<p>поле «<strong>Исполнитель</strong>» – ФИО сотрудника организации-контрагента,
выполнившего работу по документу (непосредственный автор данного
документа на стороне контрагента);</p>
</li>
<li>
<p>поле «<strong>Подписано кем</strong>» – ФИО сотрудника организации-контрагента,
утвердившего исходящий документ;</p>
</li>
<li>
<p>поле «<strong>Адресаты</strong>» – ФИО сотрудников организации, которым адресован
исходящий документ (дополнительные адресаты добавляются нажатием
на ссылку <span class="image"><img src="img/ButtonAddAddressee.svg" alt="ButtonAddAddressee"></span>);</p>
</li>
<li>
<p>поле «<strong>Направлено в дело</strong>» – наименование дела, в которое подшивается
документ;</p>
</li>
<li>
<p>поле «<strong>Вх. №</strong>» – регистрационный номер входящего документа, заполняется
нажатием на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonGetANumber.svg" alt="ButtonGetANumber"></span></span> или
вручную;</p>
</li>
<li>
<p>поле «<strong>от</strong>» – дата регистрации входящего документа (по умолчанию
проставляется текущая дата);</p>
</li>
<li>
<p>кнопка «<strong>Получить номер</strong>» – кнопка для формирования номера документа.</p>
</li>
</ul>
</div>
</div>
<div class="sect2">
<h3 id="_для_исходящего_документа">Для исходящего документа:</h3>
<div class="ulist circle">
<ul class="circle">
<li>
<p>поле «<strong>Отправитель</strong>» – ФИО сотрудника, от имени которого будет отправлен
документ;</p>
</li>
<li>
<p>поле «<strong>Исполнитель</strong>» – ФИО сотрудника, выполнившего работу по документу;</p>
</li>
<li>
<p>поле «<strong>Адресаты</strong>» – наименование организации-контрагента, которой
адресован исходящий документ (дополнительные адресаты добавляются
нажатием на ссылку <span class="image"><img src="img/ButtonAddAddressee.svg" alt="ButtonAddAddressee"></span>);</p>
</li>
<li>
<p>поле «<strong>Кому</strong>» – ФИО сотрудника организации-контрагента, которому
адресован документ;</p>
</li>
<li>
<p>поле «<strong>Направлено в дело</strong>» – наименование дела, в которое подшивается
документ;</p>
</li>
<li>
<p>поле «<strong>Исх. №</strong>» – регистрационный номер исходящего документа,
заполняется нажатием на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonGetANumber.svg" alt="ButtonGetANumber"></span></span> или вручную;</p>
</li>
<li>
<p>поле «<strong>от</strong>» – дата регистрации исходящего документа (по умолчанию
проставляется текущая дата);</p>
</li>
<li>
<p>кнопка «<strong>Получить номер</strong>» – кнопка для формирования номера документа.</p>
</li>
</ul>
</div>
</div>
<div class="sect2">
<h3 id="_для_внутреннего_документа">Для внутреннего документа:</h3>
<div class="ulist circle">
<ul class="circle">
<li>
<p>поле «<strong>Отправитель</strong>» – ФИО сотрудника, от имени которого будет отправлен
документ;</p>
</li>
<li>
<p>поле «<strong>Исполнитель</strong>» – ФИО сотрудника, выполняющего работу по документу;</p>
</li>
<li>
<p>поле «<strong>Адресаты</strong>» – ФИО сотрудника, которому адресован внутренний
документ (дополнительные адресаты добавляются нажатием на ссылку
<span class="image"><img src="img/ButtonAddAddressee.svg" alt="ButtonAddAddressee"></span>);</p>
</li>
<li>
<p>поле «<strong>Направлено в дело</strong>» – наименование дела, в которое подшивается
документ;</p>
</li>
<li>
<p>поле «<strong>Внутр. №</strong>» – регистрационный номер внутреннего документа,
заполняется нажатием на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonGetANumber.svg" alt="ButtonGetANumber"></span></span> или вручную;</p>
</li>
<li>
<p>поле «<strong>от</strong>» – дата регистрации внутреннего документа (по умолчанию
проставляется текущая дата);</p>
</li>
<li>
<p>кнопка «<strong>Получить номер</strong>» – кнопка для формирования номера документа.</p>
</li>
</ul>
</div>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_раздел_дополнительные_сведения">Раздел «Дополнительные сведения»</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Расположен в левой нижней части экрана и по умолчанию свернут (чтобы развернуть
нажмите на кнопку <span class="noBorder"><span class="image"><img src="img/GeneralButtonPlus.svg" alt="GeneralButtonPlus"></span></span>  и заполните поля).</p>
</div>
<div class="paragraph">
<p>Поля:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>поле «<strong>Куратор</strong>» – ФИО сотрудника, курирующего работу над документом;</p>
</li>
<li>
<p>поле «<strong>Подразделение</strong>» – наименование подразделения, в котором будет
вестись работа над документом;</p>
</li>
<li>
<p>поле «<strong>Категория</strong>» – поле, которое используется для дополнительной
категоризации документов и выбирается из справочника «Категории
документов» (в дальнейшем может быть использовано для поиска документов
и их группировки);</p>
</li>
<li>
<p>поле «<strong>Способ отправки</strong>» – указывается способ получения документа
в организацию;</p>
</li>
<li>
<p>поле «<strong>В ответ на</strong>» – ссылка на карточку документа организации, в ответ
на которую подготовлен данный документ (при регистрации входящего
документа будет открыт список исходящих документов, при регистрации
исходящих – список входящих, при регистрации внутренних будет открыт
весь список зарегистрированных документов);</p>
</li>
<li>
<p>поле «<strong>Ответить до</strong>» – поле, доступное только при регистрации входящих
документов (срок, до которого требуется подготовить ответ на документ);</p>
</li>
<li>
<p>поле «<strong>Почтовый идентификатор</strong>» – поле, доступное только при регистрации
исходящих документов (номер, по которому можно отслеживать
местонахождение письма);</p>
</li>
<li>
<p>чек-бокс «<strong>Отправить на резолюцию</strong>» – признак при установлении которого,
появится возможность отправки входящего или внутреннего документа
на резолюцию сразу после его регистрации.<br>
<span class="image"><img src="img/OfficeSendingToResolution.png" alt="OfficeSendingToResolution"></span><br>
  Необходимые для заполнения поля:<br></p>
<div class="ulist square">
<ul class="square">
<li>
<p>поле «<strong>Руководитель</strong>» – пользователь, которому направляется документ для
наложения резолюции;</p>
</li>
<li>
<p>поле «<strong>Комментарий</strong>» – текстовое поле, в котором указывается
произвольный комментарий Делопроизводителя.</p>
</li>
</ul>
</div>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="FastRegistrationFormtab2" class="tabcontentFastRegistrationForm" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Шаблоны</span></p>
</div>
<div class="paragraph">
<p>Если часто приходится заполнять поля одинаково, воспользуйтесь шаблонами
документов.</p>
</div>
<div class="paragraph">
<p>Меню кнопки формируется на основе списка «Документы» – «Шаблоны» –
«Шаблоны документов». Кнопка доступна только для тех видов, у которых
есть настроенные шаблоны.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeFastRegistrationFormTemplates.png" alt="OfficeFastRegistrationFormTemplates"></span></p>
</div>
<div class="paragraph">
<p>При обновлении экрана быстрой регистрации заполнение по шаблону
сохраняется.</p>
</div>
<div class="paragraph">
<p>При создании документов через форму быстрой регистрации Куратор,
подразделение и организация не заполняются данными Автора, как при создании
документов, например, с помощью кнопки на основном экране.</p>
</div>
                     </div>   <div id="FastRegistrationFormtab3" class="tabcontentFastRegistrationForm" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Загрузка вложений</span></p>
</div>
<div class="paragraph">
<p>Для загрузки вложения в правой части формы регистрации доступны следующие кнопки:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>кнопка <strong>Добавить</strong>» – позволяет загрузить файл, указав директорию;</p>
</li>
<li>
<p>кнопка «<strong>Со сканера</strong>» – дает возможность отсканировать документ и прикрепить к карточке;</p>
</li>
<li>
<p>кнопка «<strong>Удалить</strong>» – удаляет прикрепленное вложение.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeFastRegistrationFormFirstPart.png" alt="OfficeFastRegistrationFormFirstPart"></span></p>
</div>
<div class="paragraph">
<p>Список загруженных вложений отображается в виде гиперссылок. При нажатии
на гиперссылку Система открывает вложение.</p>
</div>
<div class="paragraph">
<p>Ниже расположен экран предварительного просмотра документа. Значок
со стрелкой позволяет перейти к просмотру следующего документа.</p>
</div>
<div class="paragraph">
<p>Предварительный просмотр доступен только для файлов в формате *.pdf,
*.doc, *.docx, *.odt, *.jpg, *.jpeg, *.png, *.bmp, *.tif и *.tiff.</p>
</div>
<div class="paragraph">
<p>Также есть возможность предпросмотра документов MS Excel. Для того чтобы
уточнить вопрос о возможности его настройки, обратитесь к
Администратору.</p>
</div>
                     </div>   <div id="FastRegistrationFormtab4" class="tabcontentFastRegistrationForm" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Регистрация документа</span></p>
</div>
<div class="paragraph">
<p>После того как вся необходимая информация по документу внесена,
произведите одно из доступных действий, нажав на соответствующую кнопку
в нижней левой части экрана.</p>
</div>
<div class="sect1">
<h2 id="_кнопка_зарегистрировать">Кнопка «Зарегистрировать»</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Дает возможность зарегистрировать документ в канцелярии.</p>
</div>
<div class="paragraph">
<p>При нажатии на кнопку документ создается и регистрируется в фоновом
режиме, а форма регистрации очищается.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeDocumentRegistrationButton.png" alt="OfficeDocumentRegistrationButton"></span></p>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_кнопка_зарегистрировать_и_отправить_на_резолюцию_документ">Кнопка «Зарегистрировать и отправить на резолюцию документ»</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Позволяет зарегистрировать документ средствами канцелярии и запустить процесс
«Резолюция».</p>
</div>
<div class="paragraph">
<p>Кнопа становится доступной, если отмечен чек-бокс «Отправить
на резолюцию».</p>
</div>
<div class="paragraph">
<p>При нажатии на кнопку документ создается, регистрируется и  отправляется на
резолюцию в фоновом режиме, а форма регистрации очищается.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeRegisteringAndSendingResolutionButton.png" alt="OfficeRegisteringAndSendingResolutionButton"></span></p>
</div>
</div>
</div>
                     </div>   <div id="FastRegistrationFormtab5" class="tabcontentFastRegistrationForm" style="display: none;">
                    
                     </div></div>


`;