class Piece 
	attr_reader :color, :board, :position

	def initialize(color, board, position)
		@color = color
		@board = board 
		@position = position
	end

	def to_s
		" #{symbol} "
	end

	def empty? 
		false
	end

	def valid_moves
		raise NotImplementedError
	end

	def symbol
		raise NotImplementedError
	end

	def move_into_check?(end_position)
		raise NotImplementedError
	end
end