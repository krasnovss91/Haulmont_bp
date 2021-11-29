/*
 * Copyright (c) 2008-2014 Haulmont. All rights reserved.
 * Use is subject to license terms, see http://www.cuba-platform.com/license for details.
 */

Wf.ScriptModuleSelect = function(options) {
    Wf.ScriptModuleSelect.superclass.constructor.call(this, options);

    this.needSetDefault = true;
    this.refresh();
};

YAHOO.lang.extend(Wf.ScriptModuleSelect, inputEx.SelectField, {

    allowVariable: false,
    scriptModulesLoaded: false,

    setOptions: function(options) {
        Wf.OutputSelect.superclass.setOptions.call(this, options);

        this.options.className = options.className || 'Wf-ScriptModuleSelect';
        this.options.container = options.container;
    },

    setValue: function(val, sendUpdatedEvt) {
        if (!val) {
            return;
        }
        this.newVal = val;
        Wf.ScriptModuleSelect.superclass.setValue.call(this, val, sendUpdatedEvt);
    },

    refresh: function() {
        var i;

        this.clear();
        for (i = 0; i < this.choicesList.length; i++) {
            var choice = this.choicesList[i];
            this.removeChoiceNode(choice.node);
        }
        this.choicesList = [];

        if (Wf.scriptModulesCache) {
            for (var j = 0; j < Wf.scriptModulesCache.length; j++) {
                var s = Wf.scriptModulesCache[j];
                var v = {value: s};
                if (this.getChoicePosition(v) == -1)
                    this.addChoice(v);
            }

            this.setDefaultValueIfNeeded();
        } else {
            this.loadScriptModules(this.handleScriptModulesResponse, this);
        }
    },

    setDefaultValueIfNeeded: function() {
        if (this.needSetDefault && Wf.defaultScriptModule) {
            Wf.ScriptModuleSelect.superclass.setValue.call(this, Wf.defaultScriptModule, false);
            this.needSetDefault = false;
            return true;
        }
        return false;
    },

    handleScriptModulesResponse: function(scriptModulesResponse) {
        var scriptModulesLoaded = this.scriptModulesLoaded;
        this.scriptModulesLoaded = true;

        Wf.defaultScriptModule = scriptModulesResponse.default;
        Wf.scriptModulesCache = scriptModulesResponse.values;

        this.refresh();

        if (this.newVal) {
            Wf.ScriptModuleSelect.superclass.setValue.call(this, this.newVal, scriptModulesLoaded && this.sendUpdatedEvt);
            if (this.options.container) {
                this.options.container.previousValue = this.newVal;
            }
            this.newVal = null;
        }
    },

    loadScriptModules: function(callback, scope) {
        Wf.loadJson('action/loadScriptModules.json', callback, scope);
    }
});

inputEx.registerType("tsScriptModuleSelect", Wf.ScriptModuleSelect);
