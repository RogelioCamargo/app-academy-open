// const readline = require("readline");

// const reader = readline.createInterface({
// 	input: process.stdin,
// 	output: process.stdout,
// });

// function teaAndBiscuits() {
// 	let first, second;

// 	reader.question("Would you like some tea?", (response) => {
// 		first = response;
// 		console.log(`You replied ${response}`);

// 		reader.question("Would you like some biscuits?", (response) => {
// 			second = response;
// 			console.log(`You replied ${response}`);

// 			const firstResponse = first === "y" ? "do" : "don't";
// 			const secondResponse = second === "y" ? "do" : "don't";

// 			console.log(
// 				`So you ${firstResponse} want tea and you ${secondResponse} want biscuits.`
// 			);
// 			reader.close();
// 		});
// 	});
// }

// teaAndBiscuits();

function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);
Noodles.chase.call(Markov, Noodles);
Noodles.chase.apply(Markov, [Noodles]);


