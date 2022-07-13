// function sum() {
// 	return Array.from(arguments).reduce((sum, element) => sum + element, 0);
// }

function sum(...values) {
	return values.reduce((sum, value) => sum + value, 0);
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);
