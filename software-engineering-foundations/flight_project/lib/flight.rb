class Flight 
	attr_reader :passengers

	def initialize(flight_number, capacity)
		@flight_number = flight_number
		@capacity = capacity
		@passengers = []
	end

	def full?
		passengers.length >= @capacity
	end

	def board_passenger(passenger)
		return if full? || !passenger.has_flight?(@flight_number)

		@passengers << passenger
	end

	def list_passengers
		passengers.map { |p| p.name }
	end

	def [](idx)
		passengers[idx]
	end

	def <<(passenger)
		board_passenger(passenger)
	end
end