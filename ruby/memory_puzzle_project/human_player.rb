class HumanPlayer
	attr_accessor :previous_guess

	def initialize(_size = 4)
		@previous_guess = nil 
	end

	def prompt 
		print "Enter a positon: "
	end

	def get_input
		prompt
		x, y = gets.chomp.split(" ")
		[x.to_i, y.to_i]
	end

	def receive_revealed_card(_position, _value)
	end

	def receive_match(_position_1, _position_2)
		puts "It's a match!"
	end

end