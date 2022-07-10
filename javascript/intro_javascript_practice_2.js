function titleize(names, cb) {
	new_array = names.map((name) => `Mx. ${name} Jingleheimer Schmidt`);
	cb(new_array);
}

function printCallback(array) {
	array.forEach((value) => console.log(value));
}

// console.log(titleize(["Mary", "Brian", "Leo"], printCallback));

function Elephant(name, height, tricks) {
	this.name = name;
	this.height = height;
	this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
	console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!`);
};

Elephant.prototype.grow = function () {
	this.height += 12;
};

Elephant.prototype.addTrick = function (trick) {
	this.tricks.push(trick);
};

Elephant.prototype.play = function () {
	console.log(
		`${this.name} is ${
			this.tricks[Math.floor(Math.random() * this.tricks.length)]
		}!`
	);
};

// const el = new Elephant("Roger", 25, [
// 	"painting a picture",
// 	"running after a ball",
// ]);
// el.addTrick('building a house');
// el.grow()
// console.log(el)

let ellie = new Elephant("Ellie", 185, [
	"giving human friends a ride",
	"playing hide and seek",
]);
let charlie = new Elephant("Charlie", 200, [
	"painting pictures",
	"spraying water for a slip and slide",
]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, [
	"trotting",
	"playing tic tac toe",
	"doing elephant ballet",
]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
	console.log(`${elephant.name} is trotting by!`);
};

// herd.forEach(elephant => Elephant.paradeHelper(elephant));

function dinerBreakfast() {
	this.order = ["cheesy scrambled eggs"];
	console.log(`I'd like ${this.order.join(" and ")} please`);
	return (new_item) => {
		this.order.push(new_item);
		console.log(`I'd like ${this.order.join(" and ")} please`);
	};
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
