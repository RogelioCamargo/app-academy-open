export const allTodos = ({ todos }) => Object.values(todos);

export const stepsByTodoId = ({ steps }, todoId) =>
	Object.values(steps).filter((step) => step.todo_id === todoId);
