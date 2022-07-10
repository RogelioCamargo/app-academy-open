Array.prototype.bubbleSort = function () {
	let sorted = false;
	while (!sorted) {
		sorted = true;
		for (let i = 0; i < this.length - 1; i++) {
			if (this[i] > this[i + 1]) {
				[this[i], this[i + 1]] = [this[i + 1], this[i]];
				sorted = false;
			}
		}
	}
	return this;
};

// console.log([3, 9, 4, 6, 1, 5].bubbleSort());

String.prototype.substrings = function () {
	substrings = []
	for (let i = 0; i < this.length; i++) {
		for (let j = i; j < this.length; j++) {
			substrings.push(this.slice(i, j + 1));
		}
	}
	return substrings; 
}

console.log("free".substrings()); 