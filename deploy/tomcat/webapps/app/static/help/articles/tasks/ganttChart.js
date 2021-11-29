const ganttChart = `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Asciidoctor 1.5.2">
<title>Цветовое обозначение задач:</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,400italic,600,600italic%7CNoto+Serif:400,400italic,700,700italic%7CDroid+Sans+Mono:400">

</head>
<body class="article">
<div id="header">
</div>
<div id="content">
<div class="paragraph">
<p><span class="h1">Диаграмма Ганта</span></p>
</div>
<div class="paragraph">
<p>Диаграмма Ганта позволяет сформировать графическое представление списка
задач в определенный период в виде отрезков на шкале времени.</p>
</div>
<div class="paragraph">
<p>Для того чтобы сформировать диаграмму Ганта необходимо нажать на кнопку
<span class="noBorder"><span class="image"><img src="img/ButtonSettings.svg" alt="ButtonSettings"></span></span> в списке задач и выбрать вид <strong>«Диаграмма Ганта»</strong>.</p>
</div>
<div class="paragraph">
<p>При этом в системе ТЕЗИС при формировании диаграммы Ганта в левой части
экрана будет отображаться список задач с указанием их Инициатора и
Исполнителя. В правой части экрана находится столбчатая диаграмма в виде
полос, ориентированных вдоль оси времени.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TaskGanttChart.png" alt="TaskGanttChart"></span></p>
</div>
<div class="paragraph">
<p>Каждая полоса на диаграмме представляет отдельную задачу, её границы –
моменты начала и завершения работы, её протяженность – длительность
работы. Вертикальной осью диаграммы служит перечень задач в порядке их
нахождения в списке задач.</p>
</div>
<div class="paragraph">
<p>Диаграмма не отображает иерархию подчиненности и зависимости между
задачами. При наведении на задачу в диаграмме отображается краткое
описание задачи: название, состояние, срок исполнения, процент
выполнения.</p>
</div>
<div class="paragraph">
<p>Около отрезка задачи указывается её Исполнитель.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/TaskGanttChart2.png" alt="TaskGanttChart2"></span></p>
</div>
<div class="sect1">
<h2 id="_цветовое_обозначение_задач">Цветовое обозначение задач:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong class="bold blue">синий цвет</strong> – задачи, находящиеся в процессе выполнения;</p>
</li>
<li>
<p><strong class="bold gray">серый цвет</strong> – завершенные задачи;</p>
</li>
<li>
<p><strong class="bold red">красный цвет</strong> – просроченные задачи, которые еще не завершены.</p>
</li>
<li>
<p><strong>прозрачный прямоугольник с синим контуром</strong> – незапущенные задачи.<br>
Серой полоской посередине задачи отмечается процент выполнения.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_дата_старта_на_диаграмме">Дата старта на диаграмме:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>текущая дата</strong> – если задача не запущена;</p>
</li>
<li>
<p><strong>плановая дата старта</strong> – если задача отложена;</p>
</li>
<li>
<p><strong>фактическая дата запуска задачи</strong> – если задача запущена.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_дата_окончания_на_диаграмме">Дата окончания на диаграмме:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>выполнить до</strong> – если задача не завершена, не имеет входящих
зависимостей и дата «Выполнить до» проставлена в задаче;</p>
</li>
<li>
<p><strong>текущая дата</strong> – если задача не завершена, не имеет входящих
зависимостей и дата «Выполнить до» не проставлена в задаче;</p>
</li>
<li>
<p><strong>фактическая дата окончания задачи</strong> – если задача завершена;</p>
</li>
<li>
<p><strong>текущая дата + продолжительность зависимой задачи</strong> – если задача
не запущена и имеет входящую зависимость.<br>
   Если для задачи дата «Выполнить до» меньше текущей даты и задача не
запущена, то задача отображается в виде точки.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>Диаграмма Ганта позволяет пользователю формировать отчет по контролю
исполнения задач в зависимости от роли и прав в Системе.</p>
</div>
<div class="paragraph">
<p>Каждый пользователь при формировании диаграммы будет видеть данные по
назначенным ему задачам и задачам, которые назначил он.</p>
</div>
<div class="paragraph">
<p>Пользователи с ролями «Руководитель департамента» и «Руководитель подразделения» будут
видеть все свои задачи, а также все задачи своих подчиненных.</p>
</div>
</div>
</div>
</div>
<div id="footer">
<div id="footer-text">
Last updated 2020-12-18 08:30:43 └Ёрсёъюх тЁхь  (чшьр)
</div>
</div>
</body>
</html>`;