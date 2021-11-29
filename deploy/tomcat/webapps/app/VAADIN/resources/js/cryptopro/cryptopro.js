com_haulmont_thesis_cryptopro_web_cryptopro_CryptoProJavaScriptComponent = function() {
    var connector = new Object();
    connector.connector = this;
    connector.error = function() {
            connector.connector.error();
        };
    connector.dataSigned = function(signedData) {
        connector.connector.dataSigned(signedData);
    };
    connector.signingProgress = function(processedDataCount) {
        if (connector.connector.signingProgress) {
            connector.connector.signingProgress(processedDataCount);
        }
    };
    connector.pluginLoaded = function(certsList) {
        connector.connector.pluginLoaded(certsList);
    };

    connector.availableHashAlgorithms = {
        "1.2.643.2.2.19"    : 100,  //GOST_3411
        "1.2.643.7.1.1.1.1" : 101,  //GOST_3411_2012_256
        "1.2.643.7.1.1.1.2" : 102   //GOST_3411_2012_512
    };

    function CertificateObj(certObj) {
        this.cert = certObj;
        this.certFromDate = new Date(this.cert.ValidFromDate);
        this.certTillDate = new Date(this.cert.ValidToDate);
    }

    CertificateObj.prototype.check = function(digit) {
        return (digit < 10) ? "0" + digit : digit;
    }

    CertificateObj.prototype.extract = function(from, what) {
        certName = "";

        var begin = from.indexOf(what);

        if (begin >= 0) {
            var end = from.indexOf(', ', begin);
            certName = (end < 0) ? from.substr(begin) : from.substr(begin, end - begin);
        }

        return certName;
    }

    CertificateObj.prototype.DateTimePutTogether = function(certDate) {
        return this.check(certDate.getUTCDate()) + "." + this.check(certDate.getMonth() + 1) + "." + certDate.getFullYear() + " " +
            this.check(certDate.getUTCHours()) + ":" + this.check(certDate.getUTCMinutes()) + ":" + this.check(certDate.getUTCSeconds());
    }

    CertificateObj.prototype.GetCertString = function() {
        return this.extract(this.cert.SubjectName, 'CN=') + "; Выдан: " + this.GetCertFromDate();
    }

    CertificateObj.prototype.GetCertFromDate = function() {
        return this.DateTimePutTogether(this.certFromDate);
    }

    CertificateObj.prototype.GetCertTillDate = function() {
        return this.DateTimePutTogether(this.certTillDate);
    }

    CertificateObj.prototype.GetPubKeyAlgorithm = function() {
        return this.cert.PublicKey().Algorithm.FriendlyName;
    }

    CertificateObj.prototype.GetCertName = function() {
        return this.extract(this.cert.SubjectName, 'CN=');
    }

    CertificateObj.prototype.GetIssuer = function() {
        return this.extract(this.cert.IssuerName, 'CN=');
    }

    function FillCertList() {
        var oStore = cadesplugin.CreateObject("CAPICOM.store");
        if (!oStore) {
            alert("store failed");
            return;
        }

        try {
            oStore.Open();
        } catch (ex) {
            alert("Ошибка при открытии хранилища: " + GetErrorMessage(ex));
            return;
        }

        var certCnt;

        try {
            certCnt = oStore.Certificates.Count;
        } catch (ex) {
            if ("Cannot find object or property. (0x80092004)" == GetErrorMessage(ex)) {
                var errormes = document.getElementById("boxdiv").style.display = '';
                return;
            }
        }

        var certsList = [];
        for (var i = 1; i <= certCnt; i++) {
            var cert;
            try {
                cert = oStore.Certificates.Item(i);
            } catch (ex) {
                alert("Ошибка при перечислении сертификатов: " + GetErrorMessage(ex));
                return;
            }

            var oOpt = document.createElement("OPTION");
            var certsListAtr = [];
            var dateObj = new Date();
            try {
                if (dateObj < cert.ValidToDate && cert.HasPrivateKey() && cert.IsValid()) {
                    var certObj = new CertificateObj(cert);
                    var algorithmValue = certObj.cert.PublicKey().Algorithm.Value;
                    if (algorithmValue in connector.availableHashAlgorithms) {
                        oOpt.text = certObj.GetCertString();
                        certsListAtr.push(oOpt.text);
                        certsListAtr.push(algorithmValue);
                    }

                } else {
                    continue;
                }
            } catch (ex) {
                alert("Ошибка при получении свойства SubjectName: " + GetErrorMessage(ex));
            }
            try {
                oOpt.value = cert.Thumbprint;
                certsListAtr.push(oOpt.value);
            } catch (ex) {
                alert("Ошибка при получении свойства Thumbprint: " + GetErrorMessage(ex));
            }

            certsList.push(certsListAtr)
        }
        connector.pluginLoaded(certsList);

        oStore.Close();
    }

    function SignCadesBES(thumbprint, inputData, signedProperties, hashAlgorithmValue) {
        var errormes = "";

        var algorithmId = connector.availableHashAlgorithms[hashAlgorithmValue];
        if (algorithmId == undefined) {
            errormes = "Incorrect algorithm value: " + hashAlgorithmValue;
            alert(errormes);
            throw errormes;
        }

        try {
            var oSigner = cadesplugin.CreateObject("CAdESCOM.CPSigner");
        } catch (err) {
            errormes = "Failed to create CAdESCOM.CPSigner: " + err.number;
            alert(errormes);
            throw errormes;
        }

        thumbprint = thumbprint.split(" ").reverse().join("").replace(/\s/g, "").toUpperCase();
        try {
            var oStore = cadesplugin.CreateObject("CAPICOM.store");
            oStore.Open();
        } catch (err) {
            alert('Failed to create CAPICOM.store: ' + err.number);
            return;
        }
        var CAPICOM_CERTIFICATE_FIND_SHA1_HASH = 0;
        var oCerts = oStore.Certificates.Find(CAPICOM_CERTIFICATE_FIND_SHA1_HASH, thumbprint);

        if (oCerts.Count == 0) {
            alert("Certificate not found");
            return;
        }
        var certObject = oCerts.Item(1);
        if (oSigner) {
            oSigner.Certificate = certObject;
        } else {
            errormes = "Failed to create CAdESCOM.CPSigner";
            alert(errormes);
            throw errormes;
        }

        var oSignedData = cadesplugin.CreateObject("CAdESCOM.CadesSignedData");
        var CADES_BES = 1;
        var Signature;

        var dataToSignArray = inputData.split(",");
        var signedData = "";
        if (signedProperties)
            signedData += "signedProperties:" + signedProperties + ",";
        for (var i = 0; i < dataToSignArray.length; i++) {
            var entry = dataToSignArray[i];
            var splittedEntry = entry.split(":");
            var dataToSign = splittedEntry[1];
            if (dataToSign) {
                var oHashedData = cadesplugin.CreateObject("CAdESCOM.HashedData");
                oHashedData.Algorithm = algorithmId;
                oHashedData.SetHashValue(dataToSign);
                oSigner.Options = 1; //CAPICOM_CERTIFICATE_INCLUDE_WHOLE_CHAIN
                try {
                    Signature = oSignedData.SignHash(oHashedData, oSigner, CADES_BES);
                    signedData += splittedEntry[0] + ":" + Signature + ",";
                } catch (err) {
                    errormes = "Не удалось создать подпись из-за ошибки: " + GetErrorMessage(err);
                    connector.error();
                    alert(errormes);
                    throw errormes;
                }
            }
            if (i < dataToSignArray.length - 1) {
                connector.signingProgress(i + 1);
            }
        }
        connector.dataSigned(signedData);
    }

    function decimalToHexString(number) {
        if (number < 0) {
            number = 0xFFFFFFFF + number + 1;
        }

        return number.toString(16).toUpperCase();
    }

    function GetErrorMessage(e) {
        var err = e.message;
        if (!err) {
            err = e;
        } else if (e.number) {
            err += " (0x" + decimalToHexString(e.number) + ")";
        }
        return err;
    }

    function importAsync(webAppUrl) {
        var allsuspects = document.getElementsByTagName("script");
        var filename = webAppUrl + "/VAADIN/resources/js/cryptopro/cryptopro_async.js";
        for (var i = allsuspects.length; i >= 0; i--) {
            if (allsuspects[i] && allsuspects[i].getAttribute("src") != null && allsuspects[i].getAttribute("src").indexOf(filename) != -1) {
                return true;
            }
        }

        var cryptopro_async = document.createElement("script");
        cryptopro_async.setAttribute("type", "text/javascript");
        cryptopro_async.setAttribute("src", filename);

        cryptopro_async.onload = function() {
            Signer.init(connector);
            Signer.FillCertList_async();
        };

        document.getElementsByTagName("head")[0].appendChild(cryptopro_async);
        return false;
    }

    function postInit(webAppUrl) {
        var canAsync = !!cadesplugin.CreateObjectAsync;

        if (canAsync) {
            if (importAsync(webAppUrl)) {
                Signer.init(connector);
                Signer.FillCertList_async();
            }
        } else {
            FillCertList();
        }
    }

    this.init = function(webAppUrl) {
        var canPromise = !!window.Promise;
        if (canPromise) {
            cadesplugin.then(function() {
                    postInit(webAppUrl);
                },
                function(error) {
                    var errormes = "Не удалось загрузить плагин: " + error;
                    alert(errormes);
                }
            );
        } else {
            window.addEventListener("message", function(event) {
                    if (event.data == "cadesplugin_loaded") {
                        postInit(webAppUrl);
                    } else if (event.data == "cadesplugin_load_error") {
                        alert("Не удалось загрузить плагин");
                    }
                },
                false);
            window.postMessage("cadesplugin_echo_request", "*");
        }
    };

    this.sign = function(thumbprint, inputData, signedProperties, hashAlgorithmValue) {
        var canAsync = !!cadesplugin.CreateObjectAsync;
        if (canAsync) {
            Signer.SignCadesBES_async(thumbprint, inputData, signedProperties, hashAlgorithmValue);
        } else {
            SignCadesBES(thumbprint, inputData, signedProperties, hashAlgorithmValue);
        }
    };
};