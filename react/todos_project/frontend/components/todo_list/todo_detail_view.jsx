import React from "react";
import StepListContainer from "../step_list/step_list_container";

const TodoDetailView = ({ todo, removeTodo }) => {
	return (
		<div>
			<p>{todo.body}</p>
			<StepListContainer todo_id={todo.id} />
			<button onClick={removeTodo}>Delete</button>
		</div>
	);
};

export default TodoDetailView;
