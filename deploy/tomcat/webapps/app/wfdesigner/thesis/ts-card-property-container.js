/*
 * Copyright (c) 2015 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.

 * @author mishunin
 * @version $Id$
 */

Wf.TsCardPropertyContainer = function(options, layer) {
    Wf.TsCardPropertyContainer.superclass.constructor.call(this, options, layer);
};

YAHOO.lang.extend(Wf.TsCardPropertyContainer, Wf.CardPropertyContainer, {

    xtype: "Wf.TsCardPropertyContainer",

    updateValuefields: function(result) {
        Wf.TsCardPropertyContainer.superclass.updateValuefields.call(this, result);
        if (result.attributeType != "DATE_TIME" && result.attributeType != "DATE") {
            this.expressionField.setValue(false, !this.isLoadEvent);
            this.expressionField.hide();
        }
    }

});