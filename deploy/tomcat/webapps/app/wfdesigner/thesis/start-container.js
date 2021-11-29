/*
 * Copyright (c) 2015 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.

 * @author mishunin
 * @version $Id$
 */

Wf.StartContainer = function(options, layer) {
	this.init = false;
    Wf.StartContainer.superclass.constructor.call(this, options, layer);
}

YAHOO.lang.extend(Wf.StartContainer, Wf.ImageContainer, {
	xtype: "Wf.StartContainer",

	render: function() {
        Wf.StartContainer.superclass.render.call(this);

        if (Wf.editor && !Wf.editor.preventLayerChangedEvent) {
            var startContainer = this;
            this.layer.eventAddContainer.subscribe(function(e,params) {
                if (!startContainer.init) {
                    var container = params[0];
                    if (startContainer === container) {
                        container.applyFocus();
                        startContainer.init = true;
                    }
                }
            });
        }
    },

    applyFocus: function() {
        if (this.layer) {
            if(this.layer.focusedContainer && this.layer.focusedContainer != this) {
                this.layer.focusedContainer.removeFocus();
            }
            this.setFocus();
            this.layer.focusedContainer = this;
        }
    }
});