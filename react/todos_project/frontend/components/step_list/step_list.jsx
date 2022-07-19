import React from "react";
import StepForm from "./step_form";
import StepListItemContainer from "./step_list_item_container";

const StepList = ({ steps, todo_id, receiveStep }) => {
	return (
		<div>
			<ul>
				{steps.map(step => <StepListItemContainer step={step} />)}
			</ul>
			<StepForm todo_id={todo_id} receiveStep={receiveStep} />
		</div>
	);
};

export default StepList;
