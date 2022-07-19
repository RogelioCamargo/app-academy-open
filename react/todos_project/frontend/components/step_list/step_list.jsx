import React from "react";

const StepList = ({ steps, todo_id, receiveStep }) => {
	return (
		<div>
			<ul>
				{steps.map(step => <li>{step.title}</li>)}
			</ul>
		</div>
	);
};

export default StepList;
