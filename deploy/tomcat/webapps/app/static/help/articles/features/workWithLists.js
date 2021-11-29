const workWithLists = `<!DOCTYPE html>
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
<div class="tabs" id="WorkWithListTabs"><button class="tablinkWorkWithList" onclick="openPage('WorkWithListtab1', this)" id="defaultOpenWorkWithList">
Сортировка</button><button class="tablinkWorkWithList" onclick="openPage('WorkWithListtab2', this)" >
Группировка</button><button class="tablinkWorkWithList" onclick="openPage('WorkWithListtab3', this)" >
Выгрузка в Excel</button><button class="tablinkWorkWithList" onclick="openPage('WorkWithListtab4', this)" >
Настройки колонок</button><button class="tablinkWorkWithList" onclick="openPage('WorkWithListtab5', this)" >
</button></div>
      <div class="tabsPages" id="WorkWithListPages">   <div id="WorkWithListtab1" class="tabcontentWorkWithList" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Сортировка данных</span></p>
</div>
<div class="paragraph">
<p>Данные в таблице могут быть отсортированы по любому из столбцов в
порядке возрастания или убывания.</p>
</div>
<div class="paragraph">
<p>По умолчанию сортировка отключена.</p>
</div>
<div class="paragraph">
<p>Если при отключенной сортировке кликнуть по столбцу один раз, то
появится стрелка вверх – <span class="image"><img src="img/GeneralUpArrow.svg" alt="GeneralUpArrow"></span> (сортировка
по возрастанию), если кликнуть на столбце без сортировки два раза,
то появится стрелка, направленная вниз –
<span class="image"><img src="img/GeneralDownArrow.svg" alt="GeneralDownArrow"></span> (сортировка по
убыванию).</p>
</div>
<div class="paragraph">
<p>Тип сортировки показан направлением стрелки.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralSortingData.png" alt="GeneralSortingData"></span></p>
</div>
                     </div>   <div id="WorkWithListtab2" class="tabcontentWorkWithList" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Группировка данных</span></p>
</div>
<div class="paragraph">
<p>Для удобства просмотра записи в таблице можно сгруппировать по одному
или нескольким параметрам.</p>
</div>
<div class="paragraph">
<p>Группировка данных происходит в таблице по первому столбцу слева.</p>
</div>
<div class="paragraph">
<p>Для того чтобы сгруппировать записи, необходимо переместить столбец,
содержащий параметр группировки, в пустой столбец в самом начале
страницы.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralGroupingByNumber.png" alt="GeneralGroupingByNumber"></span></p>
</div>
<div class="paragraph">
<p>Как только столбец перенесен, отображаемые записи группируются в
соответствии со значениями выбранного параметра.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralGroupingBySelectedParameter.png" alt="GeneralGroupingBySelectedParameter"></span></p>
</div>
<div class="paragraph">
<p>Столбец группировки выглядит как столбец без названия. Для того, чтобы
сработала группировка, нужно переместить столбец, по которому необходимо
сгруппировать данные таким образом, чтобы он оказался перед столбцом
группировки.</p>
</div>
<div class="paragraph">
<p>По умолчанию все группы свернуты.</p>
</div>
<div class="paragraph">
<p>Развернуть/свернуть группу можно следующими способами:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>нажать на знаки <span class="noBorder"><span class="image"><img src="img/GeneralButtonPlus.svg" alt="GeneralButtonPlus"></span></span> / <span class="image"><img src="img/GeneralButtonMinus.svg" alt="GeneralButtonMinus"></span>
рядом с названием группы;</p>
</li>
<li>
<p>нажать на значок дерева <span class="noBorder"><span class="image"><img src="img/GeneralButtonTree.svg" alt="GeneralButtonTree"></span></span> над списком.</p>
</li>
</ul>
</div>
                     </div>   <div id="WorkWithListtab3" class="tabcontentWorkWithList" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Выгрузка данных в Excel</span></p>
</div>
<div class="paragraph">
<p>В системе ТЕЗИС возможно сформировать электронную таблицу Excel с
текущим списком задач, документов, договоров или совещаний.</p>
</div>
<div class="paragraph">
<p>Для этого необходимо воспользоваться кнопкой <span class="noBorder"><span class="image"><img src="img/GeneralButtonTaskList.svg" alt="GeneralButtonTaskList"></span></span>.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralTaskList.png" alt="GeneralTaskList"></span></p>
</div>
<div class="paragraph">
<p>Списки выгружаются в Excel с сохранением настроенного способа
группировки и сортировки. Таким образом Система позволяет пользователям
создавать простые отчеты непосредственно в списках.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralExcelUploadingTaskList.png" alt="GeneralExcelUploadingTaskList"></span></p>
</div>
                     </div>   <div id="WorkWithListtab4" class="tabcontentWorkWithList" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Настройка колонок</span></p>
</div>
<div class="paragraph">
<p>Все настройки запоминаются индивидуально для каждого пользователя и
используются при последующих открытиях списка.</p>
</div>
<div class="paragraph">
<p>При закрытии списка с помощью кнопки
<span class="image"><img src="img/ButtonClose.svg" alt="ButtonClose"></span>, расположенной справа
от наименования списка, все настройки запоминаются и в дальнейшем
используются при открытии списка. Исключение составляют только те
списки, в которых задана настройка по умолчанию.</p>
</div>
<div class="paragraph">
<p>Кроме того, настройки могут быть сохранены с помощью кнопки настроек
отображения <span class="image"><img src="img/GeneralButtonSaveSettings.svg" alt="GeneralButtonSaveSettings"></span> в правом
верхнем углу таблицы.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralSaveSettings.png" alt="GeneralSaveSettings"></span></p>
</div>
<div class="paragraph">
<p>Кнопка <span class="image"><img src="img/GeneralButtonSaveSettings.svg" alt="GeneralButtonSaveSettings"></span> позволяет
выбрать сохранённые настройки из числа доступных данному пользователю.</p>
</div>
<div class="paragraph">
<p>Для выбора настроек отображения необходимо выбрать название нужного
набора настроек в списке. Текущий набор настроек отображается <strong>жирным
шрифтом</strong>.</p>
</div>
<div class="paragraph">
<p>При нажатии на кнопку <span class="noBorder"><span class="image"><img src="img/GeneralButtonSettingsCombo.svg" alt="GeneralButtonSettingsCombo"></span></span>
открывается список возможных действий:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>«<strong>Сохранить как</strong>» – сохраняет текущие установки отображения как новый набор
настроек (при выборе этого пункта меню открывается экран редактирования настроек).<br>
<span class="image"><img src="img/GeneralSaveAsSettings.png" alt="GeneralSaveAsSettings"></span><br>
   При сохранении настроек необходимо указать название набора, а затем
задать его свойства:</p>
<div class="ulist square">
<ul class="square">
<li>
<p>«<strong>Автоматически сохранять изменения</strong>» – все изменения отображения, сделанные
пользователем в текущем наборе настроек, будут автоматически сохранены;</p>
</li>
<li>
<p>«<strong>Использовать по умолчанию</strong>» – если отметить данный чек-бокс, этот набор
настроек будет применяться по умолчанию;</p>
</li>
<li>
<p>«<strong>Доступно всем пользователям</strong>» – если отметить этот чек-бокс, использование
данного набора настроек станет доступно всем пользователям.<br>
   После выбора свойств набора настроек необходимо нажать на кнопку
<span class="noBorder"><span class="image"><img src="img/ButtonSave.svg" alt="ButtonSave"></span></span>.</p>
</li>
</ul>
</div>
</li>
<li>
<p>«<strong>Сбросить</strong>» – сбрасывает выбранный набор настроек.</p>
</li>
</ul>
</div>
                     </div>   <div id="WorkWithListtab5" class="tabcontentWorkWithList" style="display: none;">
                    
                     </div></div>


`;