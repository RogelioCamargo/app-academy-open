class View {
	constructor(game, $el) {
		this.game = game;
		this.$el = $el;
		this.fromTowerTdx = null;

		this.$el.on("click", "ul", this.clickTower.bind(this)); 

		this.setupTowers();
		this.render();
	}

	clickTower(event) {
		const clickedTowerIdx = $(event.currentTarget).index();

		if (this.fromTowerTdx === null) 
			this.fromTowerTdx = clickedTowerIdx; 
		else {
			if (!this.game.move(this.fromTowerTdx, clickedTowerIdx))
				alert("Invalid move! Try again."); 

			this.fromTowerTdx = null; 
		}

		this.render(); 

		if (!this.game.isWon()) return; 

		this.$el.off("click"); 
		this.$el.addClass("game-over"); 
		alert("Good job!"); 
	}

	setupTowers() {
		this.$el.empty();

		let $tower, $disk;
		for (let i = 0; i < 3; i++) {
			$tower = $("<ul>");

			for (let j = 0; j < 3; j++) {
				$disk = $("<li>");
				$tower.append($disk);
			}
			this.$el.append($tower);
		}
	}

	render() {
		const $towers = this.$el.find("ul");
		$towers.removeClass();

		// simply displays bar 
		if (this.fromTowerTdx !== null)
			$towers.eq(this.fromTowerTdx).addClass("selected");

		this.game.towers.forEach((disks, towerIdx) => {
			const $disks = $towers.eq(towerIdx).children();
			$disks.removeClass();

			disks.forEach((diskWidth, diskIdx) => {
				$disks.eq(-1 * (diskIdx + 1)).addClass(`disk-${diskWidth}`);
			});
		});
	}
}

module.exports = View; 
