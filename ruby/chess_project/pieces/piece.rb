class Piece 
	attr_reader :color, :board, :position
	attr_writer :position
	def initialize(color, board, position)
		raise "invalid color" unless %i(white black).include?(color)
		raise "invalid position" unless board.valid_position?(position)

		@color = color
		@board = board 
		@position = position

		board.add_piece(self, position)
	end

	def to_s
		" #{symbol} "
	end

	def empty? 
		false
	end

	def valid_moves
		moves.reject { |end_position| move_into_check?(end_position) }
	end

	def symbol
		raise NotImplementedError
	end

	def move_into_check?(end_position)
		board_dup = board.dup 
		board_dup.move_piece!(position, end_position)
		board_dup.in_check?(color)
	end
end