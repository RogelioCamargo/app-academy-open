export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const DELETE_TODO = "DELETE_TODO";

export const receiveTodos = (todos) => {
	return {
		type: RECEIVE_TODOS,
		todos,
	};
};

export const receiveTodo = (todo) => {
	return {
		type: RECEIVE_TODO,
		todo,
	};
};

export const removeTodo = (todo) => {
	return {
		type: DELETE_TODO,
		todo,
	};
};

window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.removeTodo = removeTodo;
