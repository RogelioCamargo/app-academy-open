import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
import { fetchSearchGiphys } from "./util/api_util";
import { receiveSearchGiphys } from "./actions/giphy_actions";

window.fetchSearchGiphys = fetchSearchGiphys;
window.receiveSearchGiphys = receiveSearchGiphys;

document.addEventListener("DOMContentLoaded", () => {
	const store = configureStore();
	window.store = store;
	const root = document.getElementById("root");
	ReactDOM.render(<Root store={store} />, root);
});

// fetchSearchGiphys("puppies").then((res) => console.log(res.data));
