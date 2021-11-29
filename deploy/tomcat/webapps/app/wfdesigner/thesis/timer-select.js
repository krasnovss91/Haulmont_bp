Wf.ThesisTimerSelect = function(options) {
    Wf.ThesisTimerSelect.superclass.constructor.call(this, options);
};

YAHOO.lang.extend(Wf.ThesisTimerSelect, Wf.TimerSelect, {
        render: function() {
            this.divEl = inputEx.cn('div', {className: this.options.className});
            if(this.options.id) {
                this.divEl.id = this.options.id;
            }

            this.fieldset = inputEx.cn('fieldset');

            var timerTypeChoices = [
                {value: null, label: ""},
                {value: 'transision', label: i18n.get('Timer.takeTransision')},
                {value: 'script', label: i18n.get('Timer.runScript')},
                {value: 'notification', label: i18n.get('Timer.sendNotification')}
            ];
            this.timerTypeField = inputEx({
                type: 'select', label: i18n.get('Timer.timerType'), name: 'timerType', choices: timerTypeChoices
            }, this);
            this.fieldset.appendChild(this.timerTypeField.getEl());

            this.timerTypeField.updatedEvt.subscribe(this.onTimerTypeChanged, this, true);
            this.timerTypeField.updatedEvt.subscribe(this.markUnsaved, this, true);

            this.divEl.appendChild(this.fieldset);

            if(this.options.disabled) {
                this.disable();
            }
        }
});

inputEx.registerType("wfTimerSelect", Wf.ThesisTimerSelect);