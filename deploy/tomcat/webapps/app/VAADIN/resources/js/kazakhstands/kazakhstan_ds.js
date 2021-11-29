com_haulmont_thesis_cryptopro_web_kazakhstands_KazakhstanDSJavaScriptComponent = function() {
   var webSocket = new WebSocket('wss://127.0.0.1:13579/');

   var callback = null;
   var count = null;
   var dataToSignMap = {};

   var signedData = "";

    var connector = new Object();
    connector.connector = this;
    connector.dataSigned = function(signedData) {
        connector.connector.dataSigned(signedData);
    };

    this.init = function(inputData, signedProperties) {
        if (webSocket.readyState == webSocket.OPEN) {
            createCMSSignatureFromBase64Call(inputData, signedProperties);
        } else {
            webSocket.onopen = function (event) {
                createCMSSignatureFromBase64Call(inputData, signedProperties);
            };
        }
    }

    function createCMSSignatureFromBase64Call(inputData, signedProperties) {
        var dataToSignArray = inputData.split(",");
        if (signedProperties)
            signedData += "signedProperties:" + signedProperties + ",";

        for (var i = 0; i < dataToSignArray.length; i++) {
            var entry = dataToSignArray[i];
            var splittedEntry = entry.split(":");

            dataToSignMap[i + '.dataName'] = splittedEntry[0];
            dataToSignMap[i + '.dataToSign'] = splittedEntry[1];
        }

        count = 0;
        createCMSSignatureFromBase64(dataToSignMap['0.dataToSign']);
    }

    function createCMSSignatureFromBase64(dataToSign) {
        var createCMSSignatureFromBase64 = {
            "module": "kz.gov.pki.knca.commonUtils",
            "method": "createCMSSignatureFromBase64",
            "args": ["PKCS12", "SIGNATURE", dataToSign, false]
        };
        callback = "createCMSSignatureFromBase64Back";
        webSocket.send(JSON.stringify(createCMSSignatureFromBase64));
    }

    function createCMSSignatureFromBase64Back(result) {
        var Signature = result['responseObject'];

        if (Signature != undefined) {
            signedData += dataToSignMap[count + '.dataName'] + ":" + Signature + ",";

            count++;
            var nextDataToSign = dataToSignMap[count + '.dataToSign'];
            if (nextDataToSign != undefined) {
                createCMSSignatureFromBase64(nextDataToSign);

            } else {
                connector.dataSigned(signedData);
            }
        }
    }

    function openDialog() {
        if (confirm("Ошибка при подключении к NCALayer. Запустите NCALayer и нажмите ОК") === true) {
            location.reload();
        }
    }

    webSocket.onopen = function (event) {
        console.log("Connection opened");
    };
    
    webSocket.onclose = function (event) {
        if (event.wasClean) {
            console.log('connection has been closed');
        } else {
            console.log('Connection error');
            openDialog();
        }
        console.log('Code: ' + event.code + ' Reason: ' + event.reason);
    };
    
    webSocket.onmessage = function (event) {
        var result = JSON.parse(event.data);

    	if (result != null) {
    		var rw = {
    			code: result['code'],
    			message: result['message'],
    			responseObject: result['responseObject'],
    			getResult: function () {
    				return this.result;
    			},
    			getMessage: function () {
    				return this.message;
    			},
    			getResponseObject: function () {
    				return this.responseObject;
    			},
    			getCode: function () {
    				return this.code;
    			}
            };
            if (callback != null) {
                createCMSSignatureFromBase64Back(rw);
            }
    	}
    };
};