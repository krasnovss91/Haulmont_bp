/*
 * Copyright (c) 2011 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.

 * Author: Konstantin Krivopustov
 * Created: 07.02.11 13:04
 *
 * $Id$
 */

YAHOO.lang.augmentObject(i18nDict, thesis_i18nDict, true);

var i18n = new I18n(i18nDict);

YAHOO.util.Event.onDOMReady(function() {
    try {
        thesisLanguage.registerForms();

        var lang = Wf.mergeLanguages(wfLanguage, thesisLanguage);

        if (thesisLanguage.extendContainers) {
            for (var i = 0; i < thesisLanguage.extendContainers.length; i++) {
                var superContainer = thesisLanguage.extendContainers[i].superContainer;
                var extendContainer = thesisLanguage.extendContainers[i].extendContainer;
                for (var j = 0; j < lang.modules.length; j++) {
                    if (lang.modules[j].container && lang.modules[j].container.xtype == superContainer)
                        lang.modules[j].container.xtype = extendContainer;
                }
            }
        }

        Wf.localizeLanguage(lang);

        lang.adapter = WireIt.WiringEditor.adapters.WfAdapter;

        Wf.editor = new Wf.Editor(lang);
        Wf.editor.accordionView.openPanel(1);
        Wf.editor.allowVariable = false;

    } catch(ex) {
        console.log(ex);
    }
});

window.onload = (function() {
    i18n.translateNodes();
});