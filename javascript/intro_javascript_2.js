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

const el = new Elephant("Roger", 25, [
	"painting a picture",
	"running after a ball",
]);
el.addTrick('building a house');
el.grow()
console.log(el)