class HumanPlayer
	attr_reader :mark 

	def initialize(mark)
		@mark = mark
	end

	def get_position
		input = gets.chomp 
		raise "Invalid Input" if input.length != 3
		x_string, y_sting = input.split(" ")
		raise "Invalid Input" if !x_string || !y_sting
		[x_string.to_i, y_sting.to_i]
	end
end