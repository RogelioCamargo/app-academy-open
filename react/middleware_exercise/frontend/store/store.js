import { applyMiddleware, createStore } from "redux";
import rootReducer from "../reducers/root_reducer";

const addLoggingToDispatch = (store) => (next) => (action) => {
	console.log(store.getState());
	console.log(action);
	next(action);
	console.log(store.getState());
};

const stupidMiddleware = (store) => (next) => (action) => {
	console.log("Stupid");
	next(action);
};

const configureStore = (preloadedState = {}) => {
	const store = createStore(
		rootReducer,
		preloadedState,
		applyMiddleware(addLoggingToDispatch, stupidMiddleware)
	);
	store.subscribe(() => {
		localStorage.state = JSON.stringify(store.getState());
	});
	return store;
};

export default configureStore;
