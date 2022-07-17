import React, { useState, useEffect } from "react"; 

function Clock() {
	const [date, setDate] = useState(new Date()); 
	// useEffect(() => {
	// 	const interval = setInterval(tick, 1000); 
	// 	return () => { clearInterval(interval); }
	// }, []);

	const tick = () => {
		setDate(new Date())
	}

	return (
		<div>
			<div>{`${date.getHours() % 12}:${date.getMinutes()}:${date.getSeconds()}`}</div>
			<div>{`${date.toDateString()}`}</div>
		</div>
	)
}

export default Clock; 