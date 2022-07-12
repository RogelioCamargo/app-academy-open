class Game {
	constructor() {
		this.towers = [[3, 2, 1], [], []];
	}

	promptMove(reader, callback) {
		this.print();
		reader.question("Start Tower Index: ", (startIndex) => {
			const startTowerIndex = parseInt(startIndex);
			reader.question("End Tower Index: ", (endIndex) => {
				const endTowerIndex = parseInt(endIndex);
				callback(startTowerIndex, endTowerIndex);
			});
		});
	}

	isValidMove(startTowerIndex, endTowerIndex) {
		const startTower = this.towers[startTowerIndex];
		const endTower = this.towers[endTowerIndex];

		if (!startTower.length) return false;
		if (!endTower.length) return true;

		return startTower[startTower.length - 1] < endTower[endTower.length - 1];
	}

	move(startTowerIndex, endTowerIndex) {
		if (!this.isValidMove(startTowerIndex, endTowerIndex)) return false;

		const startTower = this.towers[startTowerIndex];
		const endTower = this.towers[endTowerIndex];
		endTower.push(startTower.pop());
		return true;
	}

	print() {
		console.log(JSON.stringify(this.towers));
	}

	isWon() {
		return this.towers[1].length === 3 || this.towers[2].length === 3;
	}

	run(reader, completionCallback) {
		this.promptMove(reader, (startTowerIndex, endTowerIndex) => {
			if (!this.move(startTowerIndex, endTowerIndex))
				console.log("Invalid Move!");

			if (!this.isWon()) this.run(reader, completionCallback);
			else {
				this.print();
				console.log("You win!");
				completionCallback();
			}
		});
	}
}

module.exports = Game; 