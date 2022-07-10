Array.prototype.uniq = function () {
	const set = new Set();
	const uniques = [];
	this.forEach((value) => {
		if (!set.has(value)) {
			uniques.push(value);
			set.add(value);
		}
	});
	return uniques;
};
// console.log([1, 2, 2, 3, 3, 3].uniq());

Array.prototype.twoSum = function () {
	const pairs = [];
	for (let i = 0; i < this.length; i++) {
		for (let j = i + 1; j < this.length; j++) {
			if (this[i] + this[j] === 0) pairs.push([i, j]);
		}
	}
	return pairs;
};

// console.log([1, -1, 0, 2].twoSum());

Array.prototype.transpose = function () {
	new_array = [...Array(this[0].length)].map((_) => Array(this.length));
	for (let i = 0; i < this.length; i++) {
		for (let j = 0; j < this[0].length; j++) {
			new_array[j][i] = this[i][j];
		}
	}
	return new_array;
};

console.log([[1, 2], [3, 4], [5, 6]].transpose()); 