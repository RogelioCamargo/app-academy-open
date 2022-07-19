import React from "react";

const TodoListItem = ({ todo, receiveTodo, removeTodo }) => {
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
			<p>{todo.title}</p>
			<p>{todo.body}</p>
			<button onClick={() => removeTodo(todo)}>Delete</button>
			<button onClick={toggleComplete}>
				{todo.done ? "Not Done" : "Done"}
			</button>
		</li>
	);
};

export default TodoListItem;
