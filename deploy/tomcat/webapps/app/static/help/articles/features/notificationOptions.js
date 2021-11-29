const notificationOptions = `<!DOCTYPE html>
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
<div class="tabs" id="NotificationOptionsTabs"><button class="tablinkNotificationOptions" onclick="openPage('NotificationOptionstab1', this)" id="defaultOpenNotificationOptions">
В системе ТЕЗИС</button><button class="tablinkNotificationOptions" onclick="openPage('NotificationOptionstab2', this)" >
По e-mail</button><button class="tablinkNotificationOptions" onclick="openPage('NotificationOptionstab3', this)" >
В «ТЕЗИС:Помощник»</button><button class="tablinkNotificationOptions" onclick="openPage('NotificationOptionstab4', this)" >
По SMS</button><button class="tablinkNotificationOptions" onclick="openPage('NotificationOptionstab5', this)" >
</button></div>
      <div class="tabsPages" id="NotificationOptionsPages">   <div id="NotificationOptionstab1" class="tabcontentNotificationOptions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Уведомления в системе ТЕЗИС</span></p>
</div>
<div class="paragraph">
<p>Уведомления в системе ТЕЗИС отражаются в панели уведомлений на основном
экране Системы.</p>
</div>
<div class="paragraph">
<p>Если открыть карточку, по которой пришло уведомление, то пришедшее
уведомление в трее будет очищено.</p>
</div>
<div class="paragraph">
<p>Уведомления по процессам содержат краткую информацию по карточке
и требуемое действие.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralTHESISNotificationProcess.png" alt="GeneralTHESISNotificationProcess"></span></p>
</div>
<div class="paragraph">
<p>В системе ТЕЗИС существуют уведомления, не привязанные к карточке (например о 
замещении пользователя, об окончании действия договора или по делам, выданным
в пользование).</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralTHESISNotificationUserSubstitution.png" alt="GeneralTHESISNotificationUserSubstitution"></span></p>
</div>
<div class="paragraph">
<p>Пользователь может перейти в карточку, о которой поступило уведомление,
нажав на <span class="image"><img src="img/GeneralButtonWatch.svg" alt="GeneralButtonWatch"></span>.</p>
</div>
<div class="paragraph">
<p>При выборе в уведомлении варианта <span class="image"><img src="img/GeneralButtonDelete.svg" alt="GeneralButtonDelete"></span> – оповещение о
конкретной карточке будет удалено.</p>
</div>
                     </div>   <div id="NotificationOptionstab2" class="tabcontentNotificationOptions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Уведомления по e-mail</span></p>
</div>
<div class="paragraph">
<p>Если у пользователя указан e-mail, то ему приходят уведомления на почту
в папку «Входящие». После открытия письма с данными карточки, по которой
пришло уведомление, оно останется в данной папке.</p>
</div>
<div class="paragraph">
<p>Уведомления содержат ссылку на карточку задачи, документа, договора или
совещания, а также детали, участников процесса и сроки, когда требуется
выполнить действия.</p>
</div>
<div class="paragraph">
<p>Срок указывается в соответствии с датой, указанной в поле «Выполнить до»
карточки задачи и поле «Завершить к» в окне запуска процессов по
документам, договорам и совещаниям. Если задана длительность этапа
процесса, то срок рассчитывается от времени завершения предыдущего этапа
и заданной длительности.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralEmailNotificationTask.png" alt="GeneralEmailNotificationTask"></span></p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralEmailNotificationCardChange.png" alt="GeneralEmailNotificationCardChange"></span></p>
</div>
<div class="paragraph">
<p>Пользователь может перейти в карточку, о которой поступило уведомление
нажав на ссылку с названием и номером задачи, документа, договора или
совещания в верхней части письма-уведомления или на «Открыть…» в нижней
части письма-уведомления.</p>
</div>
<div class="sect1">
<h2 id="_единый_сводный_отчет">Единый сводный отчет</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Для сокращения количества приходящих пользователю уведомлений
используется единый сводный отчет. В таком отчете объединены уведомления
о задачах (просроченных и близких к просроченным) с уведомлениями о
документах. Отчет приходит пользователю ежедневно на e-mail в заданное
время (подробнее о настройках см. «Помощь» - «Настройки»).</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralConsolidatedReport.png" alt="GeneralConsolidatedReport"></span></p>
</div>
</div>
</div>
                     </div>   <div id="NotificationOptionstab3" class="tabcontentNotificationOptions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Уведомления в «ТЕЗИС:Помощник»</span></p>
</div>
<div class="paragraph">
<p>В Системе приходят уведомления пользователю в приложение
«ТЕЗИС: Помощник».</p>
</div>
<div class="paragraph">
<p>Данная программа предназначена для работы с оповещениями о назначенных на
пользователя документах и задачах, а также об изменениях, происходящих с ними.</p>
</div>
<div class="paragraph">
<p>Если открыть карточку, по которой пришло оповещение, то она исчезнет из
списка уведомлений в приложении.</p>
</div>
<div class="paragraph">
<p>Уведомления содержат ссылку на карточку задачи, документа, договора или
совещания, а также некоторые детали.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralTHESISAssistantNotification.png" alt="GeneralTHESISAssistantNotification"></span></p>
</div>
<div class="paragraph">
<p>Пользователь может перейти в карточку, о которой поступило уведомление,
нажав два раза на нужную карточку.</p>
</div>
<div class="paragraph">
<p>При нажатии на <span class="image"><img src="img/GeneralbTHESISAssistantButtonClose.svg" alt="GeneralbTHESISAssistantButtonClose"></span> в левой
части уведомления – оповещение о конкретной карточке будет удалено.</p>
</div>
                     </div>   <div id="NotificationOptionstab4" class="tabcontentNotificationOptions" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">SMS-уведомления</span></p>
</div>
<div class="paragraph">
<p>Пользователю доступны уведомления по процессным действиям с помощью SMS.</p>
</div>
<div class="paragraph">
<p>Настройка данной функции возможна только Администратором. По
умолчанию SMS-уведомления отключены.</p>
</div>
<div class="paragraph">
<p>После открытия SMS с данными карточки, по которой пришло уведомление,
оно останется в папке «Текстовые сообщения».</p>
</div>
<div class="paragraph">
<p>Уведомления содержат номер, состояние, данные автора последнего действия
и краткое наименование.</p>
</div>
<div class="paragraph">
<p>По умолчанию SMS-рассылка должна быть настроена для Исполнителя задачи
в состояниях «Назначена» и «Возвращена исполнителю», а также Согласующим
документа или договора на этапе «Согласование».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralSMSNotification.png" alt="GeneralSMSNotification"></span></p>
</div>
<div class="paragraph">
<p>При нажатии на ссылку в сообщении осуществляется переход на карточку в
браузере.</p>
</div>
                     </div>   <div id="NotificationOptionstab5" class="tabcontentNotificationOptions" style="display: none;">
                    
                     </div></div>


`;