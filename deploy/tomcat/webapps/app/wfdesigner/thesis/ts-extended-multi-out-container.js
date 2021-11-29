/*
 * Copyright (c) 2020 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 *
 * @author Lebedev.A
 */

Wf.TsExtendedMultiOutContainer = function(options, layer) {
    Wf.TsExtendedMultiOutContainer.superclass.constructor.call(this, options, layer);
};

YAHOO.lang.extend(Wf.TsExtendedMultiOutContainer, Wf.MultiOutContainer, {

    xtype: "Wf.TsExtendedMultiOutContainer",

    createLabelEditor: function(name){
        var field;
        var terminal = this.getTerminal(name);
        var fixed = (terminal && terminal.fixed);
        if (fixed) {
            caption = (terminal.label && terminal.label.length > 0 ? terminal.label : name);
            field = new inputEx.UneditableField({
                                         className: "terminalLabel", parentEl: this.bodyEl , value: caption});
            WireIt.sn(field.fieldContainer, null, {float : "none" , "text-align" : "center"});
        }
        else {
            field = Wf.TsExtendedMultiOutContainer.superclass.createLabelEditor.call(this, name);
        }
        return field;
    },

    deleteOutput: function(e) {
        YAHOO.util.Event.stopEvent(e);
        if (!this.delOutEditor) {
            var choices = [];
            var outputs = this.getOutputs();
            for (var i = 0; i < outputs.length; i++) {
                var terminal = this.getTerminal(outputs[i].name);
                if (!terminal || !terminal.fixed) {
                    choices.push(outputs[i].name);
                }
            }

            this.delOutEditor = new inputEx.InPlaceEdit({
                parentEl: this.bodyEl,
                editorField:{type:'select', choices: choices}, animColors:{from:"#FFFF99", to:"#DDDDFF"}
            });
            this.delOutEditor.updatedEvt.subscribe(this.removeOutput, this, true);
            this.delOutEditor.cancelLink.clickEvent.subscribe(this.closeDelOutEditor, this, true);
            this.delOutEditor.openEditor();
        }
    }

});