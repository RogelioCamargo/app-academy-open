function curriedSum(numArgs) {
	const numbers = [];
	return function _curriedSum(num) {
		numbers.push(num);
		
		if (numArgs === numbers.length)
			return numbers.reduce((sum, el) => sum + el, 0);
		else
			return _curriedSum; 
	};
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56
