import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

const TodoList = ({ todos, receiveTodo }) => {
	return (
		<div>
			<h3>Todos</h3>
			<ul>
				{todos.map((todo) => (
					<TodoListItem todo={todo} />
				))}
			</ul>
			<TodoForm receiveTodo={receiveTodo} />
		</div>
	);
};

export default TodoList;
