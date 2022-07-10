function Cat(name, owner) {
	this.name = name;
	this.owner = owner;
}

const charles = new Cat("Charles", "Roger");
Cat.prototype.cuteStatement = function () {
	return `${this.owner} loves ${this.name}`;
};

console.log(charles.cuteStatement());

Cat.prototype.cuteStatement = function () {
	return `Everyone loves ${this.name}!`;
};

console.log(charles.cuteStatement());

Cat.prototype.meow = function () {
	return 'meow'; 
}; 

console.log(charles.meow()); 

charles.meow = function () {
	return 'prrrr'; 
}

console.log(charles.meow()); 