import React from "react";

const StepListItem = ({ step, removeStep, receiveStep }) => {
	const toggleComplete = (e) => {
		e.preventDefault();
		const updatedStep = {
			...step,
			done: !step.done,
		};
		receiveStep(updatedStep);
	};
	return (
		<div>
			<h3>{step.title}</h3>
			<p>{step.body}</p>
			<button onClick={toggleComplete}>
				{step.done ? "Not Done" : "Done"}
			</button>
			<button onClick={removeStep}>Delete</button>
		</div>
	);
};

export default StepListItem;
