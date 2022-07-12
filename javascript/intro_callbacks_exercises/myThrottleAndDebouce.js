Function.prototype.myThrottle = function (interval) {
	let tooSoon = false;
	return (...args) => {
		if (tooSoon) return;

		tooSoon = true;
		setTimeout(() => (tooSoon = false), interval);
		this(...args);
	};
};

Function.prototype.myDebounce = function (interval) {
	let timeout;
	return (...args) => {
		const fnCall = () => {
			timeout = null;
			this(...args);
		};
		clearTimeout(timeout);
		timeout = setTimeout(fnCall, interval);
	};
};
