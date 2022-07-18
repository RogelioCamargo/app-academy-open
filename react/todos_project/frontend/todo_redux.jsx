import React from "react";
import { createRoot } from "react-dom/client";
import configureStore from "./store/store";
import * as StepActions from "./actions/step_actions";

window.store = configureStore();

const container = document.getElementById("root");
const root = createRoot(container);
root.render(<h1>Todos App</h1>);
