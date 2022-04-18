// function sum() {
// 	let total = 0;
// 	for (let i = 0; i < arguments.length; i++) 
// 		total += arguments[i]
// 	return total; 
// }

const sum = (...values) => {
	return values.reduce((total, current) => total + current, 0); 
}

// console.log(sum(1, 2, 3, 4)); // 10

