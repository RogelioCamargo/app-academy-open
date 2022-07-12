const readline = require("readline");
const reader = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
});

function askIfGreaterThan(el1, el2, callback) {
	reader.question(`${el1} > ${el2}? `, (response) => {
		if (response === "yes") callback(true);
		else callback(false);
	});
}

function innerBubbleSortLoop(array, i, madeAnySwaps, outerBubbleSortLoop) {
	if (i == (array.length - 1)) outerBubbleSortLoop(madeAnySwaps); 
	if (i < array.length - 1) {
		askIfGreaterThan(array[i], array[i + 1], (isGreaterThan) => {
			if (isGreaterThan) {
				[array[i], array[i + 1]] = [array[i + 1], array[i]]; 
				innerBubbleSortLoop(array, i + 1, true, outerBubbleSortLoop); 
			}
			else innerBubbleSortLoop(array, i + 1, false, outerBubbleSortLoop); 
		})
	}
}

function absurdBubbleSort(array, sortCompletionCallback) {
	function outerBubbleSortLoop(madeAnySwaps) {
		if (madeAnySwaps) innerBubbleSortLoop(array, 0, false, outerBubbleSortLoop)
		else sortCompletionCallback(array); 
	}

	outerBubbleSortLoop(true); 
}

absurdBubbleSort([3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

innerBubbleSortLoop([5, 3, 1], 0, false, (array) => console.log(`In outerBubbleSortLoop. ${array}`)); 