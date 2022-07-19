import React from "react";

const TodoListItem = ({ todo }) => (
	<li>
		<span>{todo.title}</span>
	</li>
);

export default TodoListItem;
