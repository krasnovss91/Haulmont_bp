const archivistAction = `<!DOCTYPE html>
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
<div class="tabs" id="ArchivistActionTabs"><button class="tablinkArchivistAction" onclick="openPage('ArchivistActiontab1', this)" id="defaultOpenArchivistAction">
Прием дел в архив</button><button class="tablinkArchivistAction" onclick="openPage('ArchivistActiontab2', this)" >
Выдача дел из архива</button><button class="tablinkArchivistAction" onclick="openPage('ArchivistActiontab3', this)" >
Уничтожение дела</button><button class="tablinkArchivistAction" onclick="openPage('ArchivistActiontab4', this)" >
Печать</button><button class="tablinkArchivistAction" onclick="openPage('ArchivistActiontab5', this)" >
</button></div>
      <div class="tabsPages" id="ArchivistActionPages">   <div id="ArchivistActiontab1" class="tabcontentArchivistAction" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Прием дела в архив</span></p>
</div>
<div class="paragraph">
<p>Пользователь с ролью «Архивариус» имеет доступ к переданным в архив
делам, может фиксировать передачу дел в организации и переводить их в
статус «Уничтожено».</p>
</div>
<div class="paragraph">
<p>Рабочее место Архивариуса представляет собой перечень дел, переданных
в архив, и доступные над ними действия.</p>
</div>
<div class="sect1">
<h2 id="_действия_архивариуса">Действия Архивариуса:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>Прием дела в архив</strong> – принятие или отклонение передачи в архив дела, отправленного
Делопроизводителем;</p>
</li>
<li>
<p><strong>Выдача дел из архива</strong> – предоставление оригиналов бумажных экземпляров дел,
находящихся в архиве сотрудникам и подразделениям организации, а также
контрагентам, с записью данного факта в Журнале передачи дела;</p>
</li>
<li>
<p><strong>Уничтожение дела</strong> – физическое уничтожение оригинала бумажного дела, но с 
полным сохранением документов, входящих в него, в электронном виде;</p>
</li>
<li>
<p><strong>Печать</strong> – позволяет распечатать отчеты о необходимых делах.</p>
</li>
</ul>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_дела_переданные_в_архив_отображаются_у_архивариуса_со_статусом_передано_в_архив">Дела, переданные в архив, отображаются у Архивариуса со статусом «Передано в архив».</h2>
<div class="sectionbody">
<div class="paragraph">
<p><span class="image"><img src="img/OfficeListFileSubmittedArchive.png" alt="OfficeListFileSubmittedArchive"></span></p>
</div>
<div class="paragraph">
<p>Архивариус может принять дело в архив или отклонить его с помощью
нажатия на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonReceivingIntoArchive.svg" alt="ButtonReceivingIntoArchive"></span></span> и
выбора соответствующего пункта в выпадающем меню.</p>
</div>
<div class="paragraph">
<p>При нажатии на кнопку «Принять» дело получит статус «В архиве».</p>
</div>
<div class="paragraph">
<p>При нажатии на кнопку «Отклонить», дело будет возвращено в состояние
«Закрыто» и будет доступно для редактирования Делопроизводителю.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeReceivingIntoArchive.png" alt="OfficeReceivingIntoArchive"></span></p>
</div>
<div class="paragraph">
<p>Если дело находится в архиве или переведено в статус «Уничтожено», то
все карточки и их вложения блокируются для изменения всеми пользователями, ранее
имевшими доступ к документам. Право редактирования данных дел имеет только Архивариус.</p>
</div>
<div class="paragraph">
<p>Документы из дел, переданных в архив и принятых Архивариусом, не отображаются в
списках документов, договоров и Канцелярии.</p>
</div>
</div>
</div>
                     </div>   <div id="ArchivistActiontab2" class="tabcontentArchivistAction" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Выдача дел из архива</span></p>
</div>
<div class="paragraph">
<p>Пользователь с ролью «Архивариус» имеет доступ к переданным в архив
делам, может фиксировать передачу дел в организации и переводить их в
статус «Уничтожено».</p>
</div>
<div class="paragraph">
<p>Рабочее место Архивариуса представляет собой перечень дел, переданных
в архив, и доступные над ними действия.</p>
</div>
<div class="sect1">
<h2 id="_действия_архивариуса">Действия Архивариуса:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>Прием дела в архив</strong> – принятие или отклонение передачи в архив дела, отправленного
Делопроизводителем;</p>
</li>
<li>
<p><strong>Выдача дел из архива</strong> – предоставление оригиналов бумажных экземпляров дел,
находящихся в архиве сотрудникам и подразделениям организации, а также
контрагентам, с записью данного факта в Журнале передачи дела;</p>
</li>
<li>
<p><strong>Уничтожение дела</strong> – физическое уничтожение оригинала бумажного дела, но с 
полным сохранением документов, входящих в него, в электронном виде;</p>
</li>
<li>
<p><strong>Печать</strong> – позволяет распечатать отчеты о необходимых делах.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>В Системе возможно фиксировать предоставление оригиналов бумажных
экземпляров дел, находящихся в архиве, сотрудникам и подразделениям
организации, а также контрагентам, с записью данного факта в журнале
передачи дела.</p>
</div>
<div class="paragraph">
<p>Переход в журнал возможен по кнопке <span class="noBorder"><span class="image"><img src="img/ButtonJournalsTransfer.svg" alt="ButtonJournalsTransfer"></span></span>
на рабочем месте Архивариуса.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeMenuArchivist.png" alt="OfficeMenuArchivist"></span></p>
</div>
<div class="paragraph">
<p>Также в карточке редактирования дела есть вкладка «Журнал передачи».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeArchivistEditFile.png" alt="OfficeArchivistEditFile"></span></p>
</div>
<div class="paragraph">
<p>На вкладке «Журнал передачи» представлен перечень записей о передаче
данного дела, с указанием того, кому и кем передан оригинал дела, когда
и на какой срок, а также когда дело было возвращено в архив.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeJournalsTransfer.png" alt="OfficeJournalsTransfer"></span></p>
</div>
<div class="paragraph">
<p>Для создания новой записи в журнале дела необходимо нажать на кнопку
«Создать» на вкладке журнала передачи, а затем указать необходимые
данные в окне журнала передачи.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeChangingTransferLogEntry.png" alt="OfficeChangingTransferLogEntry"></span></p>
</div>
<div class="paragraph">
<p>В данном окне можно выбрать сотрудника, подразделение или контрагента,
которому передается дело из выпадающего списка, указать дату передачи и
срок возврата дела. В случае, если дело было возвращено, необходимо
отметить соответствующий чек-бокс и указать актуальную дату возврата.
Записи журнала передачи можно также изменить или удалить путем нажатия
на соответствующие кнопки.</p>
</div>
<div class="paragraph">
<p>При истечении срока возврата дела Архивариусу и сотруднику, которому
он передал дело, придет соответствующее уведомление на электронный
адрес. По умолчанию уведомления приходят в 17 часов 30 минут текущего
рабочего дня.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeNotificationExpirationRefundPeriod.png" alt="OfficeNotificationExpirationRefundPeriod"></span></p>
</div>
</div>
</div>
                     </div>   <div id="ArchivistActiontab3" class="tabcontentArchivistAction" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Уничтожение дела</span></p>
</div>
<div class="paragraph">
<p>Пользователь с ролью «Архивариус» имеет доступ к переданным в архив
делам, может фиксировать передачу дел в организации и переводить их в
статус «Уничтожено».</p>
</div>
<div class="paragraph">
<p>Рабочее место Архивариуса представляет собой перечень дел, переданных
в архив, и доступные над ними действия.</p>
</div>
<div class="sect1">
<h2 id="_действия_архивариуса">Действия Архивариуса:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>Прием дела в архив</strong> – принятие или отклонение передачи в архив дела, отправленного
Делопроизводителем;</p>
</li>
<li>
<p><strong>Выдача дел из архива</strong> – предоставление оригиналов бумажных экземпляров дел,
находящихся в архиве сотрудникам и подразделениям организации, а также
контрагентам, с записью данного факта в Журнале передачи дела;</p>
</li>
<li>
<p><strong>Уничтожение дела</strong> – физическое уничтожение оригинала бумажного дела, но с 
полным сохранением документов, входящих в него, в электронном виде;</p>
</li>
<li>
<p><strong>Печать</strong> – позволяет распечатать отчеты о необходимых дела.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>На рабочем месте Архивариуса видно дела с разным статусом.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeWorkplaceArchivists.png" alt="OfficeWorkplaceArchivists"></span></p>
</div>
<div class="paragraph">
<p>При истечении установленного срока хранения дело может быть уничтожено.</p>
</div>
<div class="paragraph">
<p>Для этого необходимо выбрать дело со статусом «В архиве» и нажать на
кнопку <span class="noBorder"><span class="image"><img src="img/ButtonDestructionFile.svg" alt="ButtonDestructionFile"></span></span>.</p>
</div>
<div class="paragraph">
<p>Система выведет на экран предупреждение о том, что дело будет
уничтожено.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeDestructionFile.png" alt="OfficeDestructionFile"></span></p>
</div>
<div class="paragraph">
<p>При нажатии на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span> дело сменит статус и
будет считаться уничтоженным.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeWorkplaceArchivistsDestroyedStatusFile.png" alt="OfficeWorkplaceArchivistsDestroyedStatusFile"></span></p>
</div>
<div class="paragraph">
<p>Статус «<strong>Уничтожено</strong>» – это признак, который указывает на физическое
уничтожение дела. При этом документы, входящие в дело, сохраняются в
Системе в электронном виде. Изменить статус уничтоженного дела в Системе
и вернуть его в архив может только Администратор.</p>
</div>
</div>
</div>
                     </div>   <div id="ArchivistActiontab4" class="tabcontentArchivistAction" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Печать</span></p>
</div>
<div class="paragraph">
<p>Пользователь с ролью «Архивариус» имеет доступ к переданным в архив
делам, может фиксировать передачу дел в организации и переводить их в
статус «Уничтожено».</p>
</div>
<div class="paragraph">
<p>Рабочее место Архивариуса представляет собой перечень дел, переданных
в архив, и доступные над ними действия.</p>
</div>
<div class="sect1">
<h2 id="_действия_архивариуса">Действия Архивариуса:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p><strong>Прием дела в архив</strong> – принятие или отклонение передачи в архив дела, отправленного
Делопроизводителем;</p>
</li>
<li>
<p><strong>Выдача дел из архива</strong> – предоставление оригиналов бумажных экземпляров дел,
находящихся в архиве сотрудникам и подразделениям организации, а также
контрагентам, с записью данного факта в Журнале передачи дела;</p>
</li>
<li>
<p><strong>Уничтожение дела</strong> – физическое уничтожение оригинала бумажного дела, но с 
полным сохранением документов, входящих в него, в электронном виде;</p>
</li>
<li>
<p><strong>Печать</strong> – позволяет распечатать отчеты о необходимых дела</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>Архивариус может распечатать информацию о необходимых делах, находящихся
в архиве.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeArchivPrintForms.png" alt="OfficeArchivPrintForms"></span></p>
</div>
<div class="paragraph">
<p>По кнопке «Печать» на рабочем месте Архивариуса доступно четыре варианта
отчетов:</p>
</div>
<div class="ulist circle">
<ul class="circle">
<li>
<p>«<strong>Обложка</strong>» – обложка дела;</p>
</li>
<li>
<p>«<strong>Внутренняя опись</strong>» – документ с данными в табличном виде обо всех материалах,
входящих с состав дела с указанием номера, индекса, даты составления, наименования,
а также возможностью указания примечаний;</p>
</li>
<li>
<p>«<strong>Лист-заверитель</strong>» – это документ, в котором отражаются особенности
пронумерованного и сшитого дела, готового для сдачи в архив;</p>
</li>
<li>
<p>«<strong>Карта-заместитель</strong>» – документ, подтверждающий факт выдачи определенных дел,
находящихся в архиве предприятия в надлежащем состоянии на конкретный период
времени заинтересованному лицу.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p>Обложка дела, Лист-заверитель и Карта-заместитель открываются для предпросмотра
и могут быть только распечатаны.</p>
</div>
<div class="paragraph">
<p>Внутренняя опись документов отрывается в формате *.doc и может быть
дополнена информацией перед печатью.</p>
</div>
</div>
</div>
                     </div>   <div id="ArchivistActiontab5" class="tabcontentArchivistAction" style="display: none;">
                    
                     </div></div>


`;