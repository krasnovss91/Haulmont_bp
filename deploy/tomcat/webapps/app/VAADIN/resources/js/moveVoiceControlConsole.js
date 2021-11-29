com_haulmont_thesis_web_app_mainwindow_MoveVoiceControlConsoleExtension = function () {
	var self = this;
	var component = self.getElement(self.getParentId());

	var header = component.getElementsByClassName("voice-control-header-box")[0];
	var moving = false;

	var prevX = 0;
	var prevY = 0;
	header.addEventListener('mousedown', function(e) {
		if (e.which === 1) {
			moving = true;
			prevX = e.screenX;
			prevY = e.screenY;
		}
	})

	window.addEventListener('mousemove', function(e) {
		if (e.buttons === 1 && moving) {
			if (Math.abs(e.movementX) == 65535 || Math.abs(e.movementY) == 65535) {
				return;
			}

			var movementX = (prevX ? e.screenX - prevX : 0)
			var movementY = (prevY ? e.screenY - prevY : 0)
		
			prevX = e.screenX;
			prevY = e.screenY;		

			var right = Math.max(0, Number(component.style.right.replace("px", ""))	 - movementX);
			var bottom = Math.max(0, Number(component.style.bottom.replace("px", "")) - movementY);

			bottom = Math.min(window.innerHeight - component.offsetHeight, bottom);
			right = Math.min(window.innerWidth - component.offsetWidth, right);

			component.style.bottom = bottom + "px";
			component.style.right = right + "px";
		}
	});

	window.addEventListener('mouseup', function(e) {
		if (e.buttons === 0 && moving) {
			prevX = 0;
			prevY = 0;

			moving = false;
			self.moved(+component.style.bottom.replace("px", ""), +component.style.right.replace("px", ""));
		}
	});
}