import React from "react";
import { createRoot } from "react-dom/client";
import Root from "./components/root";
import configureStore from "./store/store";

const store = configureStore();

const container = document.getElementById("root");
const root = createRoot(container);
root.render(<Root store={store} />);
