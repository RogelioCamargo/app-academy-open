class HumanPlayer
	attr_accessor :previous_guess

	def initialize
		@previous_guess = nil
	end

	def prompt
		puts "Please enter the position of the card you'd like to flip (e.g. '2,3')"
		print ">"
	end

	def get_input
		position = gets.chomp
		position.split(",").map { |value| Integer(value) }
	end

	def receive_match(position_one, position_two)
		puts "It's A Match!"
	end

	def receive_revealed_card(position, value)
		# do something
	end
end