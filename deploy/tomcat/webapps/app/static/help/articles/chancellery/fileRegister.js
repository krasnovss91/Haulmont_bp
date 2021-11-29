const fileRegister = `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Asciidoctor 1.5.2">
<title>Для работы Канцелярии существует три специальных справочника:</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,400italic,600,600italic%7CNoto+Serif:400,400italic,700,700italic%7CDroid+Sans+Mono:400">

</head>
<body class="article">
<div id="header">
</div>
<div id="content">
<div class="paragraph">
<p><span class="h1">Справочник «Номенклатура дел»</span></p>
</div>
<div class="paragraph">
<p>Для единообразного заполнения данных и сокращения времени на создание
карточек в системе ТЕЗИС созданы и действуют справочники.</p>
</div>
<div class="paragraph">
<p>В Системе функционируют справочники, общие для всех пользователей
и созданные для определенных ролей.</p>
</div>
<div class="sect1">
<h2 id="_для_работы_канцелярии_существует_три_специальных_справочника">Для работы Канцелярии существует три специальных справочника:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p>справочник «<strong>Номенклатура дел</strong>»;</p>
</li>
<li>
<p>справочник «<strong>Дела</strong>»;</p>
</li>
<li>
<p>справочник «<strong>Способы отправки</strong>».</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>Справочник «Номенклатура дел» содержит систематизированный перечень наименований
дел, заводимых в организации, с указанием сроков их хранения и
оформленный в установленном порядке.</p>
</div>
<div class="paragraph">
<p>Он отображает текущую номенклатуру дел в компании и доступен в меню
«Канцелярия» – «Номенклатура дел».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeReferenceFileRegister.png" alt="OfficeReferenceFileRegister"></span></p>
</div>
<div class="paragraph">
<p>Для просмотра номенклатуры дел выберите нужное значение в поле «Год»,
организацию в поле «Организация», если требуется «Подразделение» и
нажмите на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonApply.svg" alt="ButtonApply"></span></span>.</p>
</div>
<div class="paragraph">
<p>С помощью кнопки <span class="noBorder"><span class="image"><img src="img/ButtonViewFile.svg" alt="ButtonViewFile"></span></span> или
соответствующего пункта выпадающего меню можно просмотреть дела,
относящиеся к выбранному элементу номенклатуры.</p>
</div>
<div class="paragraph">
<p>При нажатии на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCreate.svg" alt="ButtonCreate"></span></span> и
при редактировании пункта номенклатуры открывается карточка
номенклатуры.</p>
</div>
<div class="paragraph">
<p>Обязательные для заполнения поля отмечены звездочкой (<strong class="red">*</strong>).</p>
</div>
<div class="paragraph">
<p>Кнопка <span class="noBorder"><span class="image"><img src="img/ButtonCreate.svg" alt="ButtonCreate"></span></span> становится доступна только при выборе года
и организации.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeReferenceEditFileRegister.png" alt="OfficeReferenceEditFileRegister"></span></p>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_поля_и_чек_боксы_карточки">Поля и чек-боксы карточки:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p>поля «<strong>Организация</strong>» и «<strong>Год</strong>» – автоматически заполняются Системой и не могут
быть изменены;</p>
</li>
<li>
<p>поле «<strong>Заголовок дела</strong>» – название, отражающее основное содержание и состав
документов дела;</p>
</li>
<li>
<p>поле «<strong>Индекс дела</strong>» – номер дела;</p>
</li>
<li>
<p>поля «<strong>Срок хранения (лет)</strong>» – срок хранения дел в годах;</p>
</li>
<li>
<p>поле «<strong>Номера статей по перечням</strong>» – содержит ссылку на нормативный документ;</p>
</li>
<li>
<p>чек-бокс «<strong>Отметка ЭК</strong>» – отметка экспертной комиссии (если проставлена у 
родительского элемента, то будет отмечена и в текущем);</p>
</li>
<li>
<p>поле «<strong>Подразделение</strong>» – в дальнейшем, при регистрации документов будут показаны
дела данной номенклатуры, принадлежащей подразделению, указанному в карточке
документа;</p>
</li>
<li>
<p>поле «<strong>Родительский элемент</strong>» – общий признак для группы номенклатур, который
можно выбрать в выпадающем списке или на экране, открывающемся при нажатии на
кнопку <span class="noBorder"><span class="image"><img src="img/ButtonEllipsis.svg" alt="ButtonEllipsis"></span></span>;</p>
</li>
<li>
<p>поле «<strong>Вид документа</strong>» – наименование вида документа, который ограничивает набор
дел при регистрации (если поле не будет заполнено, то вывод связанного с ним
  дела будет доступен для всех канцелярских видов);</p>
</li>
<li>
<p>поля «<strong>Категория</strong>» – категория хранения дел (по умолчанию указано «Временное
хранение (до 10 лет)», но может быть изменено);</p>
</li>
<li>
<p>поле «<strong>Комментарий</strong>» – текстовое поле, содержащее любую дополнительную
информацию о пункте номенклатуры.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>После создания элемента он отобразится в списке номенклатур.</p>
</div>
<div class="paragraph">
<p>Кнопка «<strong>Загрузить в CSV</strong>» – <span class="noBorder"><span class="image"><img src="img/ButtonUploadCSV.png" alt="ButtonUploadCSV"></span></span> доступна только
Администратору и позволяет заполнить справочник на основании файла,
содержащего сформированный перечень номенклатуры дел в формате *.csv.</p>
</div>
</div>
</div>
</div>
<div id="footer">
<div id="footer-text">
Last updated 2020-12-18 13:32:27 └Ёрсёъюх тЁхь  (чшьр)
</div>
</div>
</body>
</html>`;