class HumanPlayer
	attr_accessor :previous_guess
	
	def initialize
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

end