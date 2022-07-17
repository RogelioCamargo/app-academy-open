import React from "react";
import { createRoot } from "react-dom/client";
import Clock from "./clock";
import Tabs from "./tabs";

function Root() {
	const data = [
		{
			id: 0,
			title: "Tab One",
			content:
				"Tab One Content. Tab One Content. Tab One Content. Tab One Content.",
		},
		{
			id: 1,
			title: "Tab Two",
			content:
				"Tab Two Content. Tab Two Content. Tab Two Content. Tab Two Content.",
		},
		{
			id: 2,
			title: "Tab Three",
			content:
				"Tab Three Content. Tab Three Content. Tab Three Content. Tab Three Content.",
		},
	];
	return (
		<div>
			<Clock />
			<br />
			<Tabs data={data} />
		</div>
	);
}

const container = document.getElementById("root");
const root = createRoot(container);
root.render(<Root />);
