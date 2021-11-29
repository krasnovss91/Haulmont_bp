com_haulmont_thesis_web_voice_impl_ConstantRecognitionJavaScriptComponent = function () {

	var connector = this;

	this.reSendResult = function (value, delay) {
		setTimeout(function () { connector.handleResult([value], document.activeElement.tkPid, true); }, delay);
	}

    function sendResultToServer(value) {
		connector.handleResult(value, document.activeElement.tkPid, false);
	};

	try {
		var SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
	} catch (err) {
		console.error(err);
		return;
	}

	var recognitionStarted = false;

	var recognition = new SpeechRecognition();
	connector.getLocale();
	recognition.continuous = true;
	recognition.maxAlternatives = 3;
	recognition.useTimeout = false; //enable stop after x seconds of receiving no results

	this.setLocale = function (locale) {
		recognition.lang = locale;
	};

	recognition.addEventListener('end', function () {
		if (recognitionStarted) {
			recognition.start();
		}
	});

	this.startRec = function () {
		if (!recognitionStarted) {
			startRecognition();
		}
	};

	this.stopRec = function () {
		stopRecognition();
	};

	this.restart = function () {
		stopRecognition();
		startRecognition();
	}

	this.toggleRec = function () {
		if (recognitionStarted) {
			stopRecognition();
		} else {
			startRecognition();
		}
	}

	recognition.onerror = function (event) {
		console.error(event.error);
	};

	recognition.onresult = function (event) {
		var finalTranscripts = []
		var resultIndex = event.resultIndex
		for (var i = resultIndex; i < event.results.length; ++i) {
			if (event.results[i].isFinal) {
				if (i == resultIndex) {
					for (var j = 0; j < event.results[i].length; ++j) {
						finalTranscripts.push(event.results[i][j].transcript);
					}
				} else {
					for (var j = 0; j < finalTranscripts.length; j++) {
						finalTranscripts[j] += event.results[i][0].transcript;
					}
				}
			}
		}
		sendResultToServer(finalTranscripts);
		recognition.abort(); //will be started automatically by end listener
	};

	function voiceControlConsoleVisible() {
		return document.getElementsByClassName("voice-control-console-main").length > 0;
	}

	function stopByHotkey(e) {
		if (e.keyCode == 45) { //ins button
			stopRecognition();
		}
	}

	function startByHotkey(e) {
		if (e.keyCode == 45 && !recognitionStarted && voiceControlConsoleVisible()) { //ins button
			startRecognition();
		}
	}

	function findToggleRecButtons() {
		return document.getElementsByClassName("voice-control-toggle-rec-button");
	}

	function updateToggleRecButtonsStyling() {
		for (let switchRecButton of findToggleRecButtons()) {
			let icon = switchRecButton.getElementsByClassName("v-icon")[0];
			if (recognitionStarted) {
				icon.src = icon.src.replace("voice-control-blue", "voice-control-red-animated");
			} else {
				icon.src = icon.src.replace("voice-control-red-animated", "voice-control-blue");
			}
		}
	}

	function startRecognition() {
		recognitionStarted = true;
		updateToggleRecButtonsStyling();
		recognition.start();
	}

	function stopRecognition() {
		recognitionStarted = false;
		updateToggleRecButtonsStyling();
		recognition.stop();
	}

	updateToggleRecButtonsStyling();

	document.addEventListener('keydown', startByHotkey, false);
	document.addEventListener('keyup', stopByHotkey, false);

	var hotkeyListener = function (e) {
		var code = e.code;

		if (!(e.altKey || e.ctrlKey || e.metaKey)) {
			return;
		}

		for (mod of ['Alt', 'Shift', 'Meta', 'Control']) {
			if (code.startsWith(mod)) {
				return;
			}
		}

		var hotkeyStr = '';
		if (e.ctrlKey) {
			hotkeyStr += "Ctrl+";
		}
		if (e.metaKey) {
			hotkeyStr += "Meta+";
		}
		if (e.shiftKey) {
			hotkeyStr += "Shift+";
		}
		if (e.altKey) {
			hotkeyStr += 'Alt+';
		}

		hotkeyStr += code;

		for (prefix of ['Key', 'Digit', 'Numpad']) {
			hotkeyStr = hotkeyStr.replaceAll(prefix, '');
		}

		connector.handleHotkey(hotkeyStr, document.activeElement.tkPid);
	}

	if (document.com_haulmont_thesis_web_voice_impl_ConstantRecognitionJavaScriptComponent_hotkeyListener != null) {
		document.removeEventListener('keyup', document.com_haulmont_thesis_web_voice_impl_ConstantRecognitionJavaScriptComponent_hotkeyListener);
	}
	document.com_haulmont_thesis_web_voice_impl_ConstantRecognitionJavaScriptComponent_hotkeyListener = hotkeyListener;
	document.addEventListener('keyup', hotkeyListener);

	var focusListener = function () {
		connector.focusChanged(document.activeElement.tkPid);
	}

	if (window.com_haulmont_thesis_web_voice_impl_ConstantRecognitionJavaScriptComponent_focusListener != null) {
		document.removeEventListener('focus', document.com_haulmont_thesis_web_voice_impl_ConstantRecognitionJavaScriptComponent_focusListener);
		document.removeEventListener('blur', document.com_haulmont_thesis_web_voice_impl_ConstantRecognitionJavaScriptComponent_focusListener);
	}
	window.com_haulmont_thesis_web_voice_impl_ConstantRecognitionJavaScriptComponent_focusListener = focusListener;
	window.addEventListener('focus', focusListener);
	window.addEventListener('blur', focusListener);
}