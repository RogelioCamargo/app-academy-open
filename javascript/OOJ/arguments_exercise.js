// function sum() {
// 	let total = 0;
// 	for (let i = 0; i < arguments.length; i++) total += arguments[i];
// 	return total;
// }

// const sum = (...values) => {
// 	return values.reduce((total, current) => total + current, 0);
// };

// console.log(sum(1, 2, 3, 4)); // 10

function curriedSum(numArgs) {
	const numbers = [];
	return function _curriedSum(number) {
		numbers.push(number);
		if (numbers.length === numArgs)
			return numbers.reduce((total, current) => total + current, 0);
		else return _curriedSum;
	};
}

// const currySum = curriedSum(3);
// console.log(currySum(1)(2)(3));  // 6

function sumThree(num1, num2, num3) {
	return num1 + num2 + num3;
}

// Function.prototype.curry = function (numArgs) {
// 	const args = [];
// 	const that = this;
// 	return function _curry(arg) {
// 		args.push(arg);
// 		if (args.length === numArgs) return that(...args);
// 		else return _curry;
// 	};
// };

// Function.prototype.curry = function (numArgs) {
// 	const args = [];
// 	const that = this;
// 	return function _curry(arg) {
// 		args.push(arg);
// 		if (args.length === numArgs) return that.apply(null, args);
// 		else return _curry;
// 	};
// };

Function.prototype.curry = function (numArgs) {
	const args = [];
	const _curry = (arg) => {
		args.push(arg);
		if (args.length == numArgs) return this(...args);
		else return _curry;
	};
	return _curry;
};

let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
console.log(f1);
