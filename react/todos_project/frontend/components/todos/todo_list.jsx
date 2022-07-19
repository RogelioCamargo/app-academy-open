import React from "react";
import TodoListItem from "./todo_list_item";

const TodoList = ({ todos, receiveTodo }) => {
	return (
		<div>
			<h3>Todos</h3>
			<ul>
				{todos.map((todo) => (
					<TodoListItem todo={todo} />
				))}
			</ul>
		</div>
	);
};

export default TodoList;
