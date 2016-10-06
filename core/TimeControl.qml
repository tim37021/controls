InputBase {
	property string max;
	property string min;
	property string value;
	width: 75;
	height: 20;
	type: "time";

	function _update(name, value) {
		switch (name) {
			case 'min': this.element.dom.min = value; break
			case 'max': this.element.dom.max = value; break
		}

		qml.qb.InputBase.prototype._update.apply(this, arguments);
	}

	constructor: {
		var self = this
		this.element.on("change", function() { self.value = this.element.dom.value }.bind(this))
	}

	function _updateSize() {
		var style = { width: this.width, height: this.height }
		this.style(style)
	}
}
