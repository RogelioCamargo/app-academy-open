function range(start, end) {
	if (start > end) return [];
	return [start, ...range(start + 1, end)];
}

// console.log(range(1, 10));

function sumRec(array) {
	if (array.length === 0) return 0;
	return array[0] + sumRec(array.slice(1));
}

// console.log(sumRec([1, 2, 3]));

// function exponent(b, n) {
// 	if (n === 0) return 1;

// 	if (n < 0)
// 		return 1 / (b * exponent(b, -n - 1));
// 	else
// 		return b * exponent(b, n - 1);
// }

function exponent(b, n) {
	if (n === 0) return 1;
	if (n === 1) return b;

	if (n % 2 === 0) return exponent(b, n / 2) ** 2;
	else return b * exponent(b, (n - 1) / 2) ** 2;
}

// console.log(exponent(2, 3));
// console.log(exponent(2, 1));

function fibonacci(n) {
	if (n <= 2) return [1, 1].slice(0, n);
	result = fibonacci(n - 1);
	return [...result, result[result.length - 1] + result[result.length - 2]];
}

// console.log(fibonacci(4));

function deepDup(array) {
	if (!(array instanceof Array))
		return array; 
	
	return array.map(element => {
		return deepDup(element); 
	}); 
}

// console.log(deepDup([1, [2], [[3]]])); 

function bsearch(array, target) {
	if (array.length === 0) return -1; 

	let mid = Math.floor(array.length / 2); 
	if (array[mid] === target) 
		return mid; 
	else if (array[mid] > target)
		return bsearch(array.slice(0, mid), target); 
	else {
		const subproblem = bsearch(array.slice(mid + 1), target); 
		return subproblem === -1 ? -1 : subproblem + mid + 1;
	}
}

// console.log(bsearch([0, 1, 2, 3, 4, 5], 4)); 

function merge(left, right) {
  const merged = [];

  while (left.length > 0 && right.length > 0) {
    let nextItem = (left[0] < right[0]) ? left.shift() : right.shift();
    merged.push(nextItem);
  }

  return merged.concat(left, right);
}

function mergeSort(array) {
  if (array.length < 2) {
    return array;
  } else {
    const middle = Math.floor(array.length / 2);

    const left = mergeSort(array.slice(0, middle));
    const right = mergeSort(array.slice(middle));

    return merge(left, right);
  }
}

// console.log(`mergeSort([4, 5, 2, 3, 1]) = ${mergeSort([4, 5, 2, 3, 1])}`);

function subsets(array) {
	if (array.length === 0) return [array]; 
	const first = array[0]; 
	const subsets_without_first = subsets(array.slice(1)); 
	console.log(subsets_without_first);
	const subsets_with_first = subsets_without_first.map(set => [first, ...set]);
	return subsets_without_first.concat(subsets_with_first); 
}

console.log(subsets([1, 2, 3])); 