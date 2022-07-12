const readline = require("readline");
const reader = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
});

function addNumbers(sum, numsLeft, completionCallback) {
	if (numsLeft > 0) {
		reader.question("Enter a nunmber: ", (response) => {
			new_sum = sum + parseInt(response);
			addNumbers(new_sum, numsLeft - 1, completionCallback)
		});
	} else {
		completionCallback(sum);
		reader.close();
	}
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));