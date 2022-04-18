// Function.prototype.inherits = function (Parent) {
// 	function Surrogate() {}
// 	Surrogate.prototype = Parent.prototype;
// 	this.prototype = new Surrogate();
// 	this.prototype.constructor = this;
// };

Function.prototype.inherits = function (Parent) {
	this.prototype = Object.create(Parent.prototype);
	this.prototype.constructor = this; 
}

function MovingObject(name) {
	this.name = name;
}

function Ship(name) {
	MovingObject.call(this, name);
}

Ship.inherits(MovingObject);

MovingObject.prototype.attack = function () {
	console.log(`${this.name} Attacks!`);
};

Ship.prototype.turn = function () {
	console.log(`${this.name} Turns!`);
}


const ship = new Ship("Maria");

// function Asteroid() {}
// Asteroid.inherits(MovingObject);

// const asteroid = new Asteroid();

// console.log(ship.__proto__);
// console.log(asteroid.__proto__.__proto__);

ship.attack();
ship.turn();
