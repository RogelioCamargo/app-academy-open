import React, { useState } from "react";
import { uniqueId } from "../../util/id_generator";

const TodoForm = ({ receiveTodo }) => {
	const [newTodo, setNewTodo] = useState({
		title: "",
		body: "",
	});

	const handleChange = (property) => (e) =>
		setNewTodo({ ...newTodo, [property]: e.target.value });

	const handleSubmit = (e) => {
		e.preventDefault();
		console.log(newTodo);
		const todo = Object.assign({}, newTodo, { id: uniqueId() });
		receiveTodo(todo);
		setNewTodo({
			title: "",
			body: "",
		});
	};

	return (
		<form onSubmit={handleSubmit}>
			<label>
				Title
				<input
					type="text"
					name="todo_title"
					id="todo_title"
					onChange={handleChange("title")}
					value={newTodo.title}
				/>
			</label>
			<label>
				Body
				<textarea
					type="text"
					name="todo_body"
					id="todo_body"
					onChange={handleChange("body")}
					value={newTodo.body}
				/>
			</label>
			<button>Submit</button>
		</form>
	);
};

export default TodoForm;
