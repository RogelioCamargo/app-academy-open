import React from "react";
import StepListItemContainer from "./step_list_item_container";

const StepList = ({ steps, todo_id, receiveStep }) => {
	return (
		<div>
			<ul>
				{steps.map(step => <StepListItemContainer step={step} />)}
			</ul>
		</div>
	);
};

export default StepList;
