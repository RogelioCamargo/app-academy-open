import React, { useState, useEffect } from "react";

function Calculator() {
	const [result, setResult] = useState(0);
	const [a, setA] = useState("");
	const [b, setB] = useState("");

	const parseInputValue = (input) => {
		return !input ? 0 : parseInt(a);
	};

	const add = (e) => {
		e.preventDefault();
		setResult(parseInputValue(a) + parseInputValue(b));
	}

	const subtract = (e) => {
		e.preventDefault();
		setResult(parseInputValue(a) - parseInputValue(b));
	}

	const divide = (e) => {
		e.preventDefault();
		if (b === "" || b === "0") setResult("ERROR")
		else setResult(parseInputValue(a) / parseInputValue(b));
	}

	const multiply = (e) => {
		e.preventDefault();
		setResult(parseInputValue(a) * parseInputValue(b));
	}

	const clear = (e) => {
		e.preventDefault();
		setA("");
		setB(""); 
		setResult(0); 
	}

	return (
		<div>
			<h1>{result}</h1>
			<div>
				<input
					type="number"
					name="value_a"
					id="value_a"
					value={a}
					onChange={(e) => setA(e.target.value)}
				/>
				<input
					type="number"
					name="value_b"
					id="value_b"
					value={b}
					onChange={(e) => setB(e.target.value)}
				/>
			</div>
			<br />
			<div>
				<button onClick={add}>+</button>
				<button onClick={subtract}>-</button>
				<button onClick={divide}>/</button>
				<button onClick={multiply}>*</button>
				<button onClick={clear}>clear</button>
			</div>
		</div>
	);
}

export default Calculator;
