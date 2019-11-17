/// Object for loading files via drag'n'drop
BaseMixin {
	signal filesAdded;	///< any file dropped inside DropZone signal
	signal elementAdded;  ///< other stuff dropped inside

	///@private
	constructor: {
		var parent = this.parent

		parent.element.on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			e.dataTransfer.dropEffect = 'copy';
		})

		var self = this
		parent.element.on('drop', function (e) {
			e.stopPropagation();
			e.preventDefault();
			if(e.dataTransfer.files)
				self.filesAdded(e.dataTransfer.files)
			else
				self.elementAdded(e.dataTransfer)
		}.bind(parent));
	}
}
