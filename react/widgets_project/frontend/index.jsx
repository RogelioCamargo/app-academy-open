import React from "react";
import { createRoot } from "react-dom/client";
import Clock from "./clock";

function Root() {
	return (
		<div>
			<Clock />
		</div>
	);
}

const container = document.getElementById("root");
const root = createRoot(container);
root.render(<Root />);
