Item {
	property int contentWidth;
	property int contentHeight;
	property string code;
	property string language;
	property Font font: Font {}

	function _update(name, value) {
		switch (name) {
			case 'width':		this._updateSize(); break
			case 'height':		this._updateSize(); break
			case 'code':		this._code.dom.innerHTML = value; window.hljs.highlightBlock(this._code.dom); this._updateSize(); break
			case 'language':	this._code.dom.className = value; window.hljs.highlightBlock(this._code.dom); break
		}
		_globals.core.Item.prototype._update.apply(this, arguments);
	}

	/// returns tag for corresponding element
	function getTag() { return 'pre' }

	constructor: {
		if (!window.hljs) {
			log("hljs is not defined! Maybe you forget to attach highlight.js file.")
			return
		}
		this._code = this._context.createElement('code')
		this._code.dom.style.width = "auto"
		this._code.dom.style.height = "auto"
		this._code.dom.style.font = "inherit"
		this.element.append(this._code)
	}

	function _updateSize() {
		this.contentWidth = this._code.dom.scrollWidth
		this.contentHeight = this._code.dom.scrollHeight
		if (this.height && this.contentHeight != this.height)
			this._code.dom.style.height = "inherit"
		if (this.width && this.contentWidth != this.width)
			this._code.dom.style.width = "inherit"
		var style = { width: this.width, height: this.height }
		this.style(style)
	}
}
