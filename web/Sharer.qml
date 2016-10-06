Object {
	property enum socailNetwork { GPlus, Facebook, Vk, Twitter };
	property string url;

	function _update(name, value) {
		switch (name) {
			case 'socailNetwork':
				switch(value) {
				case this.GPlus:	this.href = 'https://plus.google.com/share?url='; break
				case this.Facebook:	this.href = 'https://www.facebook.com/sharer/sharer.php?s=100&amp;p%5Burl%5D='; break
				case this.Vk:		this.href = 'https://vkontakte.ru/share.php?url='; break
				case this.Twitter:	this.href = 'https://twitter.com/share?url='; break
				}
				break
		}

		qml.core.Object.prototype._update.apply(this, arguments);
	}

	open: {
		if (!this.url) {
			log("url is undefined!")
			return
		}
		window.open(this.href + this.url + '%2Fauth%2Flogin')
	}

	redirect: {
		if (!this.url) {
			log("url is undefined!")
			return
		}
		window.location = this.href + this.url + '%2Fauth%2Flogin'
	}
}
