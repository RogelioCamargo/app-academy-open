const View = require("./ttt-view");
const Game = require("./game");

$(() => {
	const root = $(".ttt");
	const game = new Game();
	new View(game, root);
});
