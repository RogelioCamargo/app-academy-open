import { connect } from "react-redux";
import {
	receiveTodos,
	receiveTodo,
	removeTodo,
} from "../../actions/todo_actions";
import { allTodos } from "../../reducers/selectors";
import TodoList from "./todo_list";

const mapStateToProps = (state) => ({
	// map slice of state to props object
	todos: allTodos(state),
});

const mapDispatchToProps = (dispatch) => ({
	// create action dispatcher
	receiveTodo: (todo) => dispatch(receiveTodo(todo)),
	removeTodo: (todo) => dispatch(removeTodo(todo)),
});

const TodoListContainer = connect(
	mapStateToProps,
	mapDispatchToProps
)(TodoList);

export default TodoListContainer;
