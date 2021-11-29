const reRegistration = `<!DOCTYPE html>
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
<div class="tabs" id="ReRegistrationTabs"><button class="tablinkReRegistration" onclick="openPage('ReRegistrationtab1', this)" id="defaultOpenReRegistration">
Входящий документ</button><button class="tablinkReRegistration" onclick="openPage('ReRegistrationtab2', this)" >
Исходящий и внутренний документы</button><button class="tablinkReRegistration" onclick="openPage('ReRegistrationtab3', this)" >
</button></div>
      <div class="tabsPages" id="ReRegistrationPages">   <div id="ReRegistrationtab1" class="tabcontentReRegistration" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Предупреждение о повторной регистрации входящего документа</span></p>
</div>
<div class="paragraph">
<p>Для того чтобы предотвратить повторную регистрацию одного физического
документа несколькими электронными, в Системе предусмотрен специальный
механизм проверки.</p>
</div>
<div class="paragraph">
<p>Во время регистрации документа система ТЕЗИС проверяет совпадение
определенных данных, и, если такой документ уже есть, выводит
соответствующее предупреждение.</p>
</div>
<div class="paragraph">
<p>При этом у входящих, исходящих и внутренних документов проверяются
разные поля.</p>
</div>
<div class="sect1">
<h2 id="_при_регистрации_входящего_документа_проверяются_поля">При регистрации входящего документа проверяются поля:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p>поле «<strong>Исх. №</strong>» – номер исходящего документа контрагента;</p>
</li>
<li>
<p>поле «<strong>от</strong>» – дата исходящего документа контрагента (по умолчанию проставляется
текущая дата);</p>
</li>
<li>
<p>поле «<strong>Отправитель</strong>» – наименование организации-контрагента.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeCheckedFieldsRegisteringIncoming.png" alt="OfficeCheckedFieldsRegisteringIncoming"></span></p>
</div>
<div class="paragraph">
<p>При нажатии на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonGetANumber.svg" alt="ButtonGetANumber"></span></span>
система ТЕЗИС проверяет, заполнены ли данные поля. Если они не
заполнены, то Система выдает сообщение с указанием заполнить их.</p>
</div>
<div class="paragraph">
<p>Далее система ТЕЗИС проверяет, не совпадают ли значения всех трёх полей
со значениями соответствующих полей уже зарегистрированных документов
в пределах текущего года.</p>
</div>
<div class="paragraph">
<p>В случае совпадения содержимого всех трех полей появляется
предупреждение о наличии документов с такими же данными. В открывшейся
окне будет отображаться список документов с такими же данными, каждый из
которых можно просмотреть.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeRegistrationWarningWindow.png" alt="OfficeRegistrationWarningWindow"></span></p>
</div>
<div class="paragraph">
<p>Пользователь может нажать на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonProceed.svg" alt="ButtonProceed"></span></span> в окне
предупреждения, а затем в окне регистрации нажать кнопку
<span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span> – тогда документ будет зарегистрирован.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeReRegistration.png" alt="OfficeReRegistration"></span></p>
</div>
<div class="paragraph">
<p>В этом случае регистрационный номер будет изъят из последовательности
номеров, а в документе появится отметка «Повторно».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeReRegistrationGuideMark.png" alt="OfficeReRegistrationGuideMark"></span></p>
</div>
<div class="paragraph">
<p>Если нажать на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonCancel.svg" alt="ButtonCancel"></span></span> –
то можно вернуться к редактированию регистрационных данных.</p>
</div>
</div>
</div>
                     </div>   <div id="ReRegistrationtab2" class="tabcontentReRegistration" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Предупреждение о повторной регистрации исходящего или внутреннего
документа</span></p>
</div>
<div class="paragraph">
<p>Для того чтобы предотвратить повторную регистрацию одного физического
документа несколькими электронными, в Системе предусмотрен специальный
механизм проверки.</p>
</div>
<div class="paragraph">
<p>Во время регистрации документа система ТЕЗИС проверяет совпадение
определенных данных, и, если такой документ уже есть, выводит
соответствующее предупреждение.</p>
</div>
<div class="paragraph">
<p>При этом у входящих, исходящих и внутренних документов проверяются
разные поля.</p>
</div>
<div class="sect1">
<h2 id="_при_регистрации_исходящего_или_внутреннего_документа_проверяются_поля">При регистрации исходящего или внутреннего документа проверяются поля:</h2>
<div class="sectionbody">
<div class="ulist circle">
<ul class="circle">
<li>
<p>поле «<strong>Исх. №</strong>» – номер исходящего документа контрагента;</p>
</li>
<li>
<p>поле «<strong>от</strong>» – дата исходящего документа контрагента (по умолчанию проставляется
текущая дата);</p>
</li>
<li>
<p>поле «<strong>Дело</strong>» – наименование дела, в которое подшивается документ.</p>
</li>
</ul>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeRegistrationCheckedFieldsOutgoingInternal.png" alt="OfficeRegistrationCheckedFieldsOutgoingInternal"></span></p>
</div>
<div class="paragraph">
<p>В случае если исходящий или внутренний документ с таким номером и датой
регистрации уже зарегистрирован в выбранное дело, Система выводит
предупреждение непосредственно в окне регистрации.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeRegistrationWindow.png" alt="OfficeRegistrationWindow"></span></p>
</div>
<div class="paragraph">
<p>Если пользователь желает продолжить регистрацию, несмотря
на предупреждение, при нажатии на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonOk.svg" alt="ButtonOk"></span></span>
будет выведено окно подтверждения повторной регистрации, где следует нажать на кнопку
<span class="noBorder"><span class="image"><img src="img/ButtonYes.svg" alt="ButtonYes"></span></span>.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/OfficeReRegistrationConfirmationWindow.png" alt="OfficeReRegistrationConfirmationWindow"></span></p>
</div>
<div class="paragraph">
<p>Документ будет зарегистрирован в журнале документов под указанным
номером, однако при этом получит отдельный системный номер.</p>
</div>
<div class="paragraph">
<p>Таким образом, в Системе появятся два исходящих или внутренних документа
с одинаковым регистрационным номером, но с разными системными номерами.</p>
</div>
</div>
</div>
                     </div>   <div id="ReRegistrationtab3" class="tabcontentReRegistration" style="display: none;">
                    
                     </div></div>


`;