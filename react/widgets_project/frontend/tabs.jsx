import React, { useState } from "react";

function Tabs({ data }) {
	const [tab, setTab] = useState(0);

	return (
		<div>
			<div style={{ display: "flex" }}>
				{data.map((item) => (
					<p key={item.id} style={{ marginRight: "10px", cursor: "pointer" }} onClick={() => setTab(item.id)}>{item.title}</p>
				))}
			</div>
			<p>{data[tab].content}</p>
		</div>
	);
}

export default Tabs;
