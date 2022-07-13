Function.prototype.curry = function (numArgs) {
	const args = [];
	const fn = this;
	return function _curry(arg) {
		args.push(arg);
		if (numArgs === args.length) return fn.apply(null, args);
		else return _curry;
	};
};
