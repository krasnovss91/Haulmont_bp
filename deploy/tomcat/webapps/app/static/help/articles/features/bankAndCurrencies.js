const bankAndCurrencies = `<!DOCTYPE html>
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
<div class="tabs" id="BankAndCurrenciesTabs"><button class="tablinkBankAndCurrencies" onclick="openPage('BankAndCurrenciestab1', this)" id="defaultOpenBankAndCurrencies">
Валюты</button><button class="tablinkBankAndCurrencies" onclick="openPage('BankAndCurrenciestab2', this)" >
Банки</button><button class="tablinkBankAndCurrencies" onclick="openPage('BankAndCurrenciestab3', this)" >
Регионы банков</button><button class="tablinkBankAndCurrencies" onclick="openPage('BankAndCurrenciestab4', this)" >
</button></div>
      <div class="tabsPages" id="BankAndCurrenciesPages">   <div id="BankAndCurrenciestab1" class="tabcontentBankAndCurrencies" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Справочник «Валюты»</span></p>
</div>
<div class="paragraph">
<p>Справочник содержит информацию о валютах, использующихся в Системе.</p>
</div>
<div class="paragraph">
<p>Открыть справочник можно через меню «<strong>Справочники</strong>» – «<strong>Банки и валюты</strong>» –
«<strong>Валюты</strong>».</p>
</div>
<div class="paragraph">
<p>Справочник позволяет осуществлять поиск по имеющемуся списку валют,
создавать, изменять и удалять валюты.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralCurrencies.png" alt="GeneralCurrencies"></span></p>
</div>
<div class="paragraph">
<p>Для перехода к редактированию валюты необходимо дважды нажать
на соответствующую строку таблицы или выделить нужную валюту и один раз
нажать на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonEdit.svg" alt="ButtonEdit"></span></span>.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralEditCurrencies.png" alt="GeneralEditCurrencies"></span></p>
</div>
<div class="paragraph">
<p>При создании и редактировании валюты необходимо указать код валюты по ОКВ и её 
наименование.</p>
</div>
                     </div>   <div id="BankAndCurrenciestab2" class="tabcontentBankAndCurrencies" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Справочник «Банки»</span></p>
</div>
<div class="paragraph">
<p>Справочник содержит информацию о банках, фигурирующих в Системе.</p>
</div>
<div class="paragraph">
<p>Открыть справочник можно через меню «<strong>Справочники</strong>» – «<strong>Банки и валюты</strong>» –
«<strong>Банки</strong>».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralBanks.png" alt="GeneralBanks"></span></p>
</div>
<div class="paragraph">
<p>Справочник позволяет осуществлять поиск по имеющемуся списку банков, а
также создавать, изменять и удалять карточки банков с помощью
соответствующих кнопок.</p>
</div>
<div class="paragraph">
<p>Для перехода к редактированию банков необходимо дважды нажать
на соответствующую строку таблицы или выделить нужный банк и один раз
нажать на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonEdit.svg" alt="ButtonEdit"></span></span>.</p>
</div>
<div class="paragraph">
<p>При создании и редактировании банка необходимо внести его реквизиты
в соответствующие поля.</p>
</div>
<div class="paragraph">
<p>В справочнике доступна загрузка банков из классификатора банков РФ. Для
этого необходимо воспользоваться кнопкой <span class="noBorder"><span class="image"><img src="img/GeneralButtonLoadingBanks.svg" alt="GeneralButtonLoadingBanks"></span></span>.</p>
</div>
<div class="paragraph">
<p>Для обновления информации из классификатора банков РФ нужно отметить
чек-бокс «Обновлять из классификатора банков РФ».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralEditBanks.png" alt="GeneralEditBanks"></span></p>
</div>
<div class="paragraph">
<p>В Системе доступно автоматическое обновление банков из классификатора
банков РФ по заданному расписанию. Для настройки этой возможности
следует обратиться к Администратору.</p>
</div>
                     </div>   <div id="BankAndCurrenciestab3" class="tabcontentBankAndCurrencies" style="display: none;">
                    <div class="paragraph">
<p><span class="h1">Справочник «Регионы банков»</span></p>
</div>
<div class="paragraph">
<p>Справочник позволяет определять регионы, в которых оперируют банки.</p>
</div>
<div class="paragraph">
<p>Открыть справочник можно через меню «<strong>Справочники</strong>» – «<strong>Банки и валюты</strong>» –
«<strong>Регионы банков</strong>».</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralBankRegions.png" alt="GeneralBankRegions"></span></p>
</div>
<div class="paragraph">
<p>Справочник позволяет осуществлять поиск по имеющемуся списку регионов,
создавать, изменять и удалять регионы с помощью соответствующих кнопок.</p>
</div>
<div class="paragraph">
<p>Для перехода к редактированию региона необходимо дважды нажать
на соответствующую строку таблицы или выделить нужный регион и один раз
нажать на кнопку <span class="noBorder"><span class="image"><img src="img/ButtonEdit.svg" alt="ButtonEdit"></span></span>.</p>
</div>
<div class="paragraph">
<p><span class="image"><img src="img/GeneralEditBankRegions.png" alt="GeneralEditBankRegions"></span></p>
</div>
<div class="paragraph">
<p>При создании и редактировании региона необходимо указать его код,
наименование и код ОКАТО.</p>
</div>
<div class="paragraph">
<p>Для обновления информации из классификаторов банков РФ нужно отметить
чек-бокс «Обновлять из классификатора банков РФ».</p>
</div>
                     </div>   <div id="BankAndCurrenciestab4" class="tabcontentBankAndCurrencies" style="display: none;">
                    
                     </div></div>


`;