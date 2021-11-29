const taskGroup = `<!DOCTYPE html>
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
<div class="tabs" id="TaskGroupTabs"><button class="tablinkTaskGroup" onclick="openPage('TaskGrouptab1', this)" id="defaultOpenTaskGroup">
Новая группа задач</button><button class="tablinkTaskGroup" onclick="openPage('TaskGrouptab2', this)" >
На нескольких Исполнителей</button><button class="tablinkTaskGroup" onclick="openPage('TaskGrouptab3', this)" >
</button></div>
      <div class="tabsPages" id="TaskGroupPages">   <div id="TaskGrouptab1" class="tabcontentTaskGroup" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Новая группа задач</span></p>
</div>
<div class="paragraph">
<p>Группа задач позволяет объединить задачи, имеющие общие признаки (например, это
может быть одна задача, над которой работают несколько Исполнителей).</p>
</div>
<div class="paragraph">
<p>При необходимости назначения нескольких задач на разных Исполнителей по
одной теме, можно воспользоваться возможностью системы ТЕЗИС по созданию
группы задач.</p>
</div>
<div class="sect1">
<h2 id="_создание_новой_группы_задач">Создание новой группы задач</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Необходимые действия:</p>
</div>
<div class="ulist decimal">
<ul class="decimal">
<li>
<p>Выберите пункт меню «Задачи» – «Группы задач».<br>
Откроется список созданных групп задач.</p>
</li>
<li>
<p>Создайте новую группу задач путем нажатия на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCreateCombo.svg" alt="ButtonCreateCombo"></span></span>
– «Новую».<br>
<span class="image"><img src="img/CreatingATaskGroup.png" alt="CreatingATaskGroup"></span></p>
</li>
<li>
<p>В открывшемся окне введите наименование группы, выберите Инициатора и
карточку задачи или документа, которая является основанием для создания
новой группы задач.<br>
<span class="image"><img src="img/ActionButtons.png" alt="ActionButtons"></span></p>
</li>
<li>
<p>Для создания новой задачи, нажмите на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonAdd.svg" alt="ButtonAdd"></span></span>
в панели карточки или выберите «Добавить» из выпадающего меню при нажатии правой кнопки мышки.<br>
  После этого в таблице «Задачи» появится новая строка с пустыми полями.
Эти поля необходимо заполнить. Таким же образом можно создать любое
необходимое количество задач в группе.</p>
</li>
<li>
<p>После того как все необходимые поля в задачах заполнены, нажмите на
кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCopyLine.svg" alt="ButtonCopyLine"></span></span> в карточке редактирования группы задач.</p>
</li>
<li>
<p>В открывшемся окне подтвердите создание задач, нажав «ОК».<br>
  В Системе будут созданы и сразу же отправлены в работу задачи всем
Исполнителям. При этом в карточке группы задач названия задач станут не
редактируемыми, а в столбце «Состояние» появится указание, что задачи
назначены.</p>
</li>
<li>
<p>Нажмите на <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>.<br>
Группа задач создана и все задачи направлены Исполнителям.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_редактирование_списка_задач_возможно_с_помощью_следующих_кнопок">Редактирование списка задач возможно с помощью следующих кнопок:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><span class="noBorder"><span class="image"><img src="img/ButtonAddExisting.svg" alt="ButtonAddExisting"></span></span> – открывает список существующих задач,
из которых пользователь может выбрать те, что будут добавлены в группу;</p>
</li>
<li>
<p><span class="noBorder"><span class="image"><img src="img/ButtonRemove.svg" alt="ButtonRemove"></span></span> – удаляет выбранную задачу;</p>
</li>
<li>
<p><span class="noBorder"><span class="image"><img src="img/ButtonCopyLine.svg" alt="ButtonCopyLine"></span></span> – создает новую задачу на основе выбранной из
таблицы (поля задачи уже заполнены аналогично исходной задаче, но она еще не 
  создана в Системе).</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>Подробное описание вариантов добавления вложений содержится в разделе
«Добавление вложений».</p>
</div>
</div>
</div>
                     </div>   <div id="TaskGrouptab2" class="tabcontentTaskGroup" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Задача на нескольких Исполнителей</span></p>
</div>
<div class="paragraph">
<p>Группа задач позволяет объединить задачи, имеющие общие признаки (например, это
может быть одна задача, над которой работают несколько Исполнителей).</p>
</div>
<div class="paragraph">
<p>Группа задач так же может быть создана при постановке задачи нескольким
Исполнителям. Процесс постановки задачи в целом аналогичен созданию
новой группы задач, за исключением того, что на этапе подтверждения
списка пользователей в качестве Исполнителя нужно выбрать не одного, а
нескольких пользователей.</p>
</div>
<div class="paragraph">
<p>Для этого необходимо добавить еще одну или несколько ролей «Исполнитель»
либо нажать на кнопку «Группа» рядом с полем назначения Исполнителя.</p>
</div>
<div class="paragraph">
<p>После этого откроется окно выбора участников, в котором можно выбрать в
качестве Исполнителей сразу нескольких пользователей. В этом окне
отображаются все пользователи, которых можно выбрать в качестве
исполнителей.</p>
</div>
<div class="paragraph">
<p>При выборе нескольких исполнителей для задачи необходимо указать тип
запуска задачи: «Задача для всех исполнителей (группа задач)» или
«Задача для одного из исполнителей».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/UserListCofirmation.png" alt="UserListCofirmation"></span></p>
</div>
<div class="sect1">
<h2 id="_задача_может_быть_назначена">Задача может быть назначена:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>для всех Исполнителей</strong> – включает в себя несколько одинаковых задач,
назначенных на каждого из Исполнителей;</p>
</li>
<li>
<p><strong>для одного из Исполнителей</strong> – одна задача, назначенная всем Исполнителям, но 
после принятия в работу задачи одним из Исполнителей, задача становится
недоступной для других.</p>
</li>
</ul>
</div>
</div>
</div>
                     </div>   <div id="TaskGrouptab3" class="tabcontentTaskGroup" style="display: none;">
                    
                     </div></div>


`;