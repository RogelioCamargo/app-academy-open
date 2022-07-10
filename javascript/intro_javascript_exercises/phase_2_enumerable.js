Array.prototype.myEach = function (cb) {
	for (let i = 0; i < this.length; i++) cb(this[i]);
};

// [1, 2, 3].myEach((value) => console.log(value));

Array.prototype.myMap = function (cb) {
	const result_array = [];
	this.myEach((value) => {
		result_array.push(cb(value));
	});
	return result_array;
};

// console.log([1, 2, 3].myMap((value) => value * 2));

Array.prototype.myReduce = function (cb, initial) {
	let result;
	if (initial === undefined) {
		result = this[0];
		array = this.slice(1);
	} else {
		result = initial;
		array = this;
	}
	array.myEach((value) => {
		result = cb(result, value);
	});
	return result;
};

console.log(
	[1, 2, 3].myReduce(function (acc, el) {
		return acc + el;
	})
);

console.log(
	[1, 2, 3].myReduce(function (acc, el) {
		return acc + el;
	}, 25)
);
