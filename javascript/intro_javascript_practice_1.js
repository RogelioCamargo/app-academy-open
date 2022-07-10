function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    // var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  // let x = 'out of block again';
  console.log(x);
}

// mysteryScoping1()
// mysteryScoping2()
// mysteryScoping3()
// mysteryScoping4()
// mysteryScoping5()

function madLib(a, b, c) {
	return `We shall ${a.toUpperCase()} the ${b.toUpperCase()} ${c.toUpperCase()}.`
}

// console.log(madLib('make', 'best', 'guac'));

function isSubstring(long, sub) {
	return long.toLowerCase().search(sub.toLowerCase()) !== -1;
}

// console.log(isSubstring("time to program", "time"));
// console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(array) {
	return array.filter(value => (value % 3 === 0 && value % 5 !== 0) || (value % 3 !== 0 && value % 5 === 0));
}

// console.log(fizzBuzz([1, 2, 3, 15, 25]));

function isPrime(number) {
	if (number < 2) return false; 
	let x = 2; 
	while (x < number) {
		if (number % x == 0) return false; 
		x++
	}
	return true; 
}

function sumOfNPrimes(n) {
	if (n <= 0) return 0
	const firstNPrimes = []
	let i = 0;
	while (firstNPrimes.length < n) {
		if (isPrime(i)) {
			firstNPrimes.push(i);
		}
		i++; 
	}

	return firstNPrimes.reduce((sum, a) => sum + a, 0);
}

// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));