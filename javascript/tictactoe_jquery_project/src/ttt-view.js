class View {
	constructor(game, $el) {
		this.game = game;
		this.$el = $el;

		this.setupBoard();
		this.bindEvents();
	}

	bindEvents() {
		this.$el.on("click", "li", (event) => {
			const $square = $(event.currentTarget);
			this.makeMove($square);
		});
	}

	makeMove($square) {
		const pos = $square.data("pos");
		const currentPlayer = this.game.currentPlayer;

		try {
			this.game.playMove(pos);
		} catch (error) {
			alert("This " + error.msg.toLowerCase());
		}

		$square.addClass(currentPlayer);

		if (!this.game.isOver()) return;

		this.$el.off("click"); // remove event handler 
		this.$el.addClass("game-over");

		const winner = this.game.winner();
		const $figcaption = $("<figcaption>");

		if (winner) $figcaption.html(`You win, ${winner.toUpperCase()}!`);
		else $figcaption.html("It's a draw!");

		this.$el.append($figcaption); 
	}

	setupBoard() {
		const $ul = $("<ul>");
		for (let i = 0; i < 3; i++) {
			for (let j = 0; j < 3; j++) {
				const $li = $("<li>");
				$li.data("pos", [i, j]);
				$ul.append($li);
			}
		}
		this.$el.append($ul);
	}
}

module.exports = View;
