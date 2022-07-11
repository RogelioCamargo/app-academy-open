// const readline = require("readline");

// const reader = readline.createInterface({
// 	input: process.stdin,
// 	output: process.stdout,
// });

function teaAndBiscuits() {
	let first, second;

	reader.question("Would you like some tea?", (res) => {
		first = res;
		console.log(`You replied ${res}.`);
		reader.question("Would you like some biscuits?", (res) => {
			second = res;
			console.log(`You replied ${res}`);

			const firstRes = first === "yes" ? "do" : "don't";
			const secondRes = second === "yes" ? "do" : "don't";
			console.log(
				`So you ${firstRes} want tea and you ${secondRes} want biscuits.`
			);
			reader.close();
		});
	});
}

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

const markov = new Cat ();
const noodles = new Dog ();

noodles.chase(markov); 
noodles.chase.call(markov, noodles); 
noodles.chase.apply(markov, [noodles]); 