import React, { useState } from "react";
import { uniqueId } from "../../util/id_generator";

const StepForm = ({ todo_id, receiveStep }) => {
	const [newStep, setNewStep] = useState({
		title: "",
		body: "",
		done: false,
		todo_id: todo_id,
	});

	const handleChange = (property) => (e) => setNewStep({ ...newStep, [property]: e.target.value });

	const handleSubmit = (e) => {
		e.preventDefault();

		receiveStep({
			id: uniqueId(),
			...newStep,
		});

		setNewStep({
			title: "",
			body: "",
			done: false,
			todo_id: todo_id,
		});
	};

	return (
		<form onSubmit={handleSubmit}>
			<label>
				Title
				<input type="text" value={newStep.title} onChange={handleChange("title")} />
			</label>
			<label>
				Description
				<input type="text" value={newStep.body} onChange={handleChange("body")} />
			</label>
			<button>Submit</button>
		</form>
	);
};

export default StepForm;
