
Function.prototype.inherits = function(parentClass) {
	function Surrogate () {}
	Surrogate.prototype = parentClass.prototype; 
	this.prototype = new Surrogate(); 
	this.prototype.contructor = this; 
}

Function.prototype.inherits = function(parentClass) {
	this.prototype = Object.create(parentClass.prototype); 
	this.prototype.contructor = this; 
}