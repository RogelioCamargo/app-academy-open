import React from "react";
import TodoListContainer from "./todo_list/todo_list_container";
import { fetchTodos } from "../util/todo_api_util";

const App = () => {
	return (
		<div>
			<TodoListContainer />
		</div>
	);
};

export default App;
