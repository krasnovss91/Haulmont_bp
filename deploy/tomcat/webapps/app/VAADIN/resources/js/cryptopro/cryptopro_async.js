var Signer = new Object();
Signer.init = function(connector) {
    Signer.connector = connector;
};


Signer.FillCertList_async = function() {
    cadesplugin.async_spawn(function*() {
        var oStore = yield cadesplugin.CreateObjectAsync("CAPICOM.store");
        if (!oStore) {
            alert("store failed");
            return;
        }

        try {
            yield oStore.Open();
        } catch (ex) {
            alert("Ошибка при открытии хранилища: " + Signer.GetErrorMessage(ex));
            return;
        }

        var certCnt;
        var certs;

        try {
            certs = yield oStore.Certificates;
            certCnt = yield certs.Count;
        } catch (ex) {
            if ("Cannot find object or property. (0x80092004)" == Signer.GetErrorMessage(ex)) {
                var errormes = document.getElementById("boxdiv").style.display = '';
                return;
            }
        }

        var certsList = [];
        for (var i = 1; i <= certCnt; i++) {
            var cert;
            try {
                cert = yield certs.Item(i);
            } catch (ex) {
                alert("Ошибка при перечислении сертификатов: " + Signer.GetErrorMessage(ex));
                return;
            }

            var oOpt = document.createElement("OPTION");
            var certsListAtr = [];
            var dateObj = new Date();
            try {
                if ((dateObj < new Date(yield cert.ValidToDate)) && (yield cert.HasPrivateKey()) && (yield cert.IsValid())) {
                    var certPublicKey = yield cert.PublicKey();
                    var certPublicKeyAlgorithm = yield certPublicKey.Algorithm;
                    var algorithmValue = yield certPublicKeyAlgorithm.Value;

                    if (algorithmValue in Signer.connector.availableHashAlgorithms) {
                        var certSubjectName = yield cert.SubjectName;
                        var certSerialNumber = yield cert.SerialNumber;
                        var certValidFromDate = yield cert.ValidFromDate;

                        oOpt.text = Signer.extract_rdn_comp(certSubjectName, "CN") + "; Выдан: " + Signer.PrintDate(new Date((certValidFromDate)));
                        certsListAtr.push(oOpt.text);
                        certsListAtr.push(algorithmValue);
                    }
                } else {
                    continue;
                }
            } catch (ex) {
                alert("Ошибка при получении свойства SubjectName: " + Signer.GetErrorMessage(ex));
            }
            try {
                oOpt.value = yield cert.Thumbprint;
                certsListAtr.push(oOpt.value);
            } catch (ex) {
                alert("Ошибка при получении свойства Thumbprint: " + Signer.GetErrorMessage(ex));
            }

            certsList.push(certsListAtr);
        }

        Signer.connector.pluginLoaded(certsList);

        yield oStore.Close();
    });
};

Signer.extract_rdn_comp = function(from, what) {
    certName = "";

    var begin = from.indexOf(what);

    if (begin >= 0) {
        var end = from.indexOf(', ', begin);

        if (end < 0) {
            var end = from.indexOf(' ', begin);
            certName = (end < 0) ? from.substr(begin) : from.substr(begin, end - begin);
        } else {
            certName = from.substr(begin, end - begin);
        }
    }

    return certName;

};

Signer.SignCadesBES_async = function(thumbprint, inputData, signedProperties, hashAlgorithmValue) {
    cadesplugin.async_spawn(function*(arg) {
        var inputData = arg[1];
        var signedProperties = arg[2];

        var algorithmId = Signer.connector.availableHashAlgorithms[hashAlgorithmValue];
        if (algorithmId == undefined) {
            errormes = "Incorrect algorithm value: " + hashAlgorithmValue;
            alert(errormes);
            throw errormes;
        }

        var thumbprint = arg[0].split(" ").reverse().join("").replace(/\s/g, "").toUpperCase();
        try {
            var oStore = yield cadesplugin.CreateObjectAsync("CAPICOM.store");
            yield oStore.Open();
        } catch (err) {
            alert('Failed to create CAPICOM.store: ' + err.number);
            return;
        }

        var CAPICOM_CERTIFICATE_FIND_SHA1_HASH = 0;
        var all_certs = yield oStore.Certificates;
        var oCerts = yield all_certs.Find(CAPICOM_CERTIFICATE_FIND_SHA1_HASH, thumbprint);

        if (yield oCerts.Count == 0) {
            alert("Certificate not found");
            return;
        }
        var certificate = yield oCerts.Item(1);

        var dataToSignArray = inputData.split(",");
        var signedData = "";
        if (signedProperties)
            signedData += "signedProperties:" + signedProperties + ",";
        for (var i = 0; i < dataToSignArray.length; i++) {
            // Данные на подпись ввели
            var entry = dataToSignArray[i];
            var splittedEntry = entry.split(":");
            var dataToSign = splittedEntry[1];

            var Signature;
            try {
                var errormes = "";
                try {
                    var oSigner = yield cadesplugin.CreateObjectAsync("CAdESCOM.CPSigner");
                } catch (err) {
                    errormes = "Failed to create CAdESCOM.CPSigner: " + err.number;
                    throw errormes;
                }
                var oSigningTimeAttr = yield cadesplugin.CreateObjectAsync("CADESCOM.CPAttribute");

                var CAPICOM_AUTHENTICATED_ATTRIBUTE_SIGNING_TIME = 0;
                yield oSigningTimeAttr.propset_Name(CAPICOM_AUTHENTICATED_ATTRIBUTE_SIGNING_TIME);
                var oTimeNow = new Date();

                this.PrintDigit = Signer.PrintDigit;

                yield oSigningTimeAttr.propset_Value(oTimeNow);
                var attr = yield oSigner.AuthenticatedAttributes2;
                yield attr.Add(oSigningTimeAttr);

                var oDocumentNameAttr = yield cadesplugin.CreateObjectAsync("CADESCOM.CPAttribute");
                var CADESCOM_AUTHENTICATED_ATTRIBUTE_DOCUMENT_NAME = 1;
                oDocumentNameAttr.propset_Name(CADESCOM_AUTHENTICATED_ATTRIBUTE_DOCUMENT_NAME);
                oDocumentNameAttr.propset_Value("Document Name");
                yield attr.Add(oDocumentNameAttr);

                if (oSigner) {
                    oSigner.propset_Certificate(certificate);
                } else {
                    errormes = "Failed to create CAdESCOM.CPSigner";
                    throw errormes;
                }

                var oSignedData = yield cadesplugin.CreateObjectAsync("CAdESCOM.CadesSignedData");
                var CADES_BES = 1;

                if (dataToSign) {
                    var oHashedData = yield cadesplugin.CreateObjectAsync("CAdESCOM.HashedData");
                    oHashedData.propset_Algorithm(algorithmId);
                    oHashedData.SetHashValue(dataToSign);
                    oSigner.propset_Options(1); //CAPICOM_CERTIFICATE_INCLUDE_WHOLE_CHAIN
                    try {
                        Signature = yield oSignedData.SignHash(oHashedData, oSigner, CADES_BES);
                    } catch (err) {
                        errormes = "Не удалось создать подпись из-за ошибки: " + Signer.GetErrorMessage(err);
                        throw errormes;
                    }
                }

            } catch (err) {
                Signer.connector.error();
                alert("Возникла ошибка:\n" + err);
                return;
            }

            signedData += splittedEntry[0] + ":" + Signature + ",";
            if (i < dataToSignArray.length - 1) {
                Signer.connector.signingProgress(i + 1);
            }
        }
        Signer.connector.dataSigned(signedData);
    }, thumbprint, inputData, signedProperties, hashAlgorithmValue);
};

Signer.PrintDate = function(certDate) {
    return Signer.PrintDigit(certDate.getUTCDate()) + "." + Signer.PrintDigit(certDate.getMonth() + 1) + "." + certDate.getFullYear() + " " +
        Signer.PrintDigit(certDate.getUTCHours()) + ":" + Signer.PrintDigit(certDate.getUTCMinutes()) + ":" + Signer.PrintDigit(certDate.getUTCSeconds());
};

Signer.PrintDigit = function(digit) {
    return (digit < 10) ? "0" + digit : digit;
};

Signer.decimalToHexString = function(number) {
    if (number < 0) {
        number = 0xFFFFFFFF + number + 1;
    }

    return number.toString(16).toUpperCase();
};

Signer.GetErrorMessage = function(e) {
    var err = e.message;
    if (!err) {
        err = e;
    } else if (e.number) {
        err += " (0x" + decimalToHexString(e.number) + ")";
    }
    return err;
};