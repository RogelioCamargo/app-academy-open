import React, { useState, useEffect } from "react"; 

function Clock() {
	const [date, setDate] = useState(new Date()); 
	useEffect(() => {
		const interval = setInterval(tick, 1000); 
		return () => { clearInterval(interval); }
	}, []);

	const tick = () => {
		setDate(new Date())
	}

	const getDay = (date) => {
		switch (date.getDay()) {
			case 0: return "Sunday"; 
			case 1: return "Monday";
			case 2: return "Tuesday";
			case 3: return "Wednesday";
			case 4: return "Thursday";
			case 5: return "Friday";
			case 6: return "Saturday"; 
			default: return "Not Found"
		}
	}

	const getMonth = (date) => {
		switch (date.getMonth()) {
			case 0: return "January";
			case 1: return "February"; 
			case 2: return "March";
			case 3: return "April"; 
			case 4: return "May"; 
			case 5: return "June"; 
			case 6: return "July"; 
			case 7: return "August";
			case 8: return "September";
			case 9: return "October";
			case 10: return "November"; 
			case 11: return "December";
			default: return "Not Found"
		}
	}

	return (
		<div>
			<div>{`${date.getHours() % 12}:${date.getMinutes()}:${date.getSeconds()}`}</div>
			<div>{`${getDay(date)} ${date.getDate()} ${getMonth(date)} ${date.getFullYear()}`}</div>
		</div>
	)
}

export default Clock; 