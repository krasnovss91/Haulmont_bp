com_haulmont_thesis_web_ui_common_ede_OnlyOfficeEditorJavaScriptComponent = function() {
    var connector = this;
    var unregistered = true;
    var element = connector.getElement();
    var div = document.createElement('div');
    div.className = "ext-doc-editor-frame";

    var iframeEditor = document.createElement('div');
    iframeEditor.id = "iframeExtDocEditor";
    div.append(iframeEditor);

    element.append(div);

    var docEditor;

    var destroyEditor = function () {
        if (docEditor != null) {
            docEditor.destroyEditor();
            docEditor = null;
        }
    }

    var innerAlert = function (message) {
        if (console && console.log)
            console.log(message);
    };

    var onAppReady = function () {
        innerAlert("Document editor ready");
    };

    var onDocumentStateChange = function (event) {
       // do not process
    };

    var onRequestEditRights = function () {
        // do not process
    };

    var onError = function (event) {
        if (event)
            innerAlert(event.data);
    };

    var onOutdatedVersion = function (event) {
        destroyEditor();
        connector.outdatedVersion();
    };

    var onRequestClose = function (event) {
        destroyEditor();
        connector.requestClose();
    };

    var config = null;

    var сonnectEditor = function (initConfig) {
        config = initConfig;
        destroyEditor();
        docEditor = new DocsAPI.DocEditor("iframeExtDocEditor", initConfig);
    };

    this.init = function(onlyOfficeConfiguration) {
        onlyOfficeConfig = JSON.parse(onlyOfficeConfiguration);
        onlyOfficeConfig.width = "100%";
        onlyOfficeConfig.height = "100%";
        onlyOfficeConfig.events = {
            "onAppReady": onAppReady,
            "onDocumentStateChange": onDocumentStateChange,
            'onRequestEditRights': onRequestEditRights,
            "onError": onError,
            "onOutdatedVersion": onOutdatedVersion,
            "onRequestClose": onRequestClose,
        };
        unregistered = false;
        сonnectEditor(onlyOfficeConfig);
    };

    this.onUnregister = function () {
        destroyEditor();
        unregistered = true;
    }

    if (unregistered === true) {
        if (connector.initRequest) {
            connector.initRequest();
        }
    }

}