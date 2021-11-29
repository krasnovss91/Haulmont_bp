/*
 * Copyright (c) 2016 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.

 * @author mishunin
 * @version $Id$
 */

Wf.TsSignatureContainer = function(options, layer) {
    Wf.TsSignatureContainer.superclass.constructor.call(this, options, layer);
    
    this.eventModuleDigitalSignChanged = new YAHOO.util.CustomEvent("eventModuleDigitalSignChanged");

    if (options.signCardAvailable)
        this.signCardAvailable =  options.signCardAvailable;
};

YAHOO.lang.extend(Wf.TsSignatureContainer, Wf.TsExtendedMultiOutContainer, {

    xtype: "Wf.TsSignatureContainer",
    digitalSignature: null,
    signCardAvailable: false,  //доступ к флагу "подписание карточки"
    
    onContainerFocus: function(eventName, containers) {
        var focused_save = containers[0].focused;
        
        Wf.TsSignatureContainer.superclass.onContainerFocus.call(this, eventName, containers);
        
        if (focused_save == true)
            return;
        
        var self = this;
        this.optionsForm.updatedEvt.subscribe(
            function(event, params) {
                var digitalSignature = params[0].digitalSignature;
                
                if (self.digitalSignature === null || self.digitalSignature != digitalSignature) {
                    self.digitalSignature = digitalSignature;
                    
                    self.eventModuleDigitalSignChanged.fire([digitalSignature]);
                }
        });
    }

});