// class Clock {
// 	constructor() {
// 		const date = new Date();
// 		this.hours = date.getHours();
// 		this.minutes = date.getMinutes();
// 		this.seconds = date.getSeconds();
// 	}

// 	printTime() {
// 		console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
// 	}

// 	_tick() {
// 		this.printTime();
// 		setInterval(() => {
// 			this.seconds += 1;
// 			if (this.seconds > 59) {
// 				this.seconds = 0;
// 				this.minutes += 1;
// 				if (this.minutes > 59) {
// 					this.minutes = 0;
// 					this.hours += 1;
// 					if (this.hours > 23)
// 						this.hours = 0;
// 				}
// 			}

// 			this.printTime();
// 		}, 1000)
// 	}
// }

// const clock = new Clock();
// clock._tick();

const readline = require("readline");
const reader = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
});

// function addNumbers(sum, numsLeft, completionCallback) {
// 	if (numsLeft > 0) {
// 		reader.question("Enter a nunmber: ", (response) => {
// 			new_sum = sum + parseInt(response);
// 			addNumbers(new_sum, numsLeft - 1, completionCallback)
// 		});
// 	} else {
// 		completionCallback(sum);
// 		reader.close();
// 	}
// }

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

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

// innerBubbleSortLoop([5, 3, 1], 0, false, (array) => console.log(`In outerBubbleSortLoop. ${array}`)); 