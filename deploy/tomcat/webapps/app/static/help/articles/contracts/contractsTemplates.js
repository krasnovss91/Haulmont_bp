const contractsTemplates = `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Asciidoctor 1.5.2">
<title>Создание шаблона</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,400italic,600,600italic%7CNoto+Serif:400,400italic,700,700italic%7CDroid+Sans+Mono:400">

</head>
<body class="article">
<div id="header">
</div>
<div id="content">
<div class="paragraph">
<p><span class="h1">Шаблоны договоров</span></p>
</div>
<div class="paragraph">
<p>Шаблоны договоров позволяют оптимизировать процесс создания типовых
договоров и находятся в пункте меню «Документы» – «Шаблоны» – «Шаблоны
договоров».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/MainScreenContractsTemplates.png" alt="MainScreenContractsTemplates"></span></p>
</div>
<div class="paragraph">
<p>Создание шаблона договора аналогично созданию обычного договора, при этом
в карточке есть указание что он является шаблоном.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/ContractsTemplates.png" alt="ContractsTemplates"></span></p>
</div>
<div class="sect1">
<h2 id="_создание_шаблона">Создание шаблона</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>При создании шаблона укажите его наименование и заполните поля,
которые следует заполнять в договорах, создаваемых по шаблону.</p>
</li>
<li>
<p>Установите круг лиц, которые будут иметь доступ к шаблону.<br>
  Чтобы сделать шаблон договора доступным для всех, необходимо отметить
чек-бокс «Общий для всех пользователей».<br>
  Для того чтобы установить доступ к шаблону для отдельных пользователей
откройте вкладку «Доступ к шаблону» (находится в строке с вкладками и
доступна по знаку <span class="image"><img src="img/ButtonPlusAccessingTheTemplate.svg" alt="ButtonPlusAccessingTheTemplate"></span>) и
нажмите кнопку <span class="noBorder"><span class="image"><img src="img/ButtonAdd.svg" alt="ButtonAdd"></span></span>. При этом
откроется окно «Выбор участников». Чтобы добавить пользователей в
список, имеющих доступ, кликните два раза по имени участника либо
нажмите на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonTransfer.svg" alt="ButtonTransfer"></span></span>.
Чтобы сохранить список, нажмите <span class="noBorder"><span class="image"><img src="img/ButtonOK.svg" alt="ButtonOK"></span></span>.<br>
  <span class="image"><img src="img/ContractsTemplatesTheSelectionOfParticipants.png" alt="ContractsTemplatesTheSelectionOfParticipants"></span></p>
</li>
<li>
<p>Во вкладке «Вложения» прикрепите к шаблону документы в качестве
вложений.<br>
  Можно загрузить как один файл и его версии, так и сразу несколько
файлов, а также отсканировать документ непосредственно из Системы и
использовать его в качестве вложения к карточке. Тогда добавленное
вложение и все его версии будут автоматически копироваться в документ,
созданный по этому шаблону.</p>
</li>
<li>
<p>После того как все необходимые поля заполнены, нажмите на кнопку
<span class="noBorder"><span class="image"><img src="img/ButtonSaveAndClose.svg" alt="ButtonSaveAndClose"></span></span>.<br>
  Шаблон договора готов и его можно использовать при создании договоров.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_заполнение_полей_карточки_шаблона">Заполнение полей карточки шаблона</h2>
<div class="sectionbody">
<div class="paragraph">
<p>При заполнении полей карточки из шаблона с использованием
кнопки <span class="noBorder"><span class="image"><img src="img/ButtonFromTheTemplate.svg" alt="ButtonFromTheTemplate"></span></span> заполнение происходит следующим образом:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>если поле договора и соответствующее поле шаблона не заполнены – поле остается
пустым;</p>
</li>
<li>
<p>если поле договора не заполнено, а соответствующее поле шаблона содержит информацию –
поле договора заполняется информацией из шаблона;</p>
</li>
<li>
<p>если поле договора и соответствующее поле шаблона заполнены – информация,
введенная в поле договора, заменяется информацией из шаблона;</p>
</li>
<li>
<p>если поле договора заполнено, а соответствующее поле шаблона пусто – информация
в поле договора затрется;</p>
</li>
<li>
<p>если на момент заполнения карточки по шаблону в ней уже имеются вложения – они
сохраняются, а не перезаполняются (из шаблона добавляются только новые записи).</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>В системе ТЕЗИС возможно создание шаблонов с «жестким» назначением
ролей. Это означает что при создании договора на основании этого шаблона
нельзя будет удалить участников процесса, только добавить новых.</p>
</div>
<div class="paragraph">
<p>Для настройки данной возможности обратитесь к Администратору.</p>
</div>
</div>
</div>
</div>
<div id="footer">
<div id="footer-text">
Last updated 2020-12-18 10:53:20 └Ёрсёъюх тЁхь  (чшьр)
</div>
</div>
</body>
</html>`;