import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

const TodoList = ({ todos, receiveTodo, removeTodo }) => {
	return (
		<div>
			<h3>Todos</h3>
			<ul>
				{todos.map((todo) => (
					<TodoListItem
						todo={todo}
						receiveTodo={receiveTodo}
						removeTodo={removeTodo}
					/>
				))}
			</ul>
			<TodoForm receiveTodo={receiveTodo} />
		</div>
	);
};

export default TodoList;
