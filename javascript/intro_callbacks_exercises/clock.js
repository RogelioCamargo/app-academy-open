class Clock {
	constructor() {
		const date = new Date();
		this.hours = date.getHours();
		this.minutes = date.getMinutes();
		this.seconds = date.getSeconds();
	}

	printTime() {
		console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
	}

	_tick() {
		this.printTime();
		setInterval(() => {
			this.seconds += 1;
			if (this.seconds > 59) {
				this.seconds = 0;
				this.minutes += 1;
				if (this.minutes > 59) {
					this.minutes = 0;
					this.hours += 1;
					if (this.hours > 23)
						this.hours = 0;
				}
			}

			this.printTime();
		}, 1000)
	}
}

const clock = new Clock();
clock._tick();