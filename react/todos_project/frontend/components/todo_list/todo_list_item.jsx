import React, { useState } from "react";
import TodoDetailViewContainer from "./todo_detail_view_container";

const TodoListItem = ({ todo, receiveTodo }) => {
	const [showDetails, setShowDetails] = useState(false);

	const toggleComplete = (e) => {
		e.preventDefault();
		const updatedTodo = {
			...todo,
			done: !todo.done,
		};
		receiveTodo(updatedTodo);
	};

	return (
		<li>
			<h3>
				<a onClick={() => setShowDetails((previousState) => !previousState)}>
					{todo.title}
				</a>
			</h3>
			<button onClick={toggleComplete}>
				{todo.done ? "Not Done" : "Done"}
			</button>
			{showDetails && <TodoDetailViewContainer todo={todo} />}
		</li>
	);
};

export default TodoListItem;