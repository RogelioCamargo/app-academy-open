require_relative "piece"

class Board 
	attr_reader :rows
	def initialize
		rows = Array.new(8)
		@rows = rows.map.with_index do |row, index|
			if [0, 1, 6, 7].include?(index)
				Array.new(8) { Piece.new }
			else 
				Array.new(8)
			end
		end
	end

	def [](position)
		row, col = position
		@rows[row][col]
	end

	def []=(position, piece)
		row, col = position 
		@rows[row][col] = piece 
	end

	def move_piece(start_position, end_position)
		if self[start_position].nil?
			raise ArgumentError.new "There is no piece at the #{start_position} starting position"
		end
		unless self[end_position].nil? 
			raise ArgumentError.new "Piece can't move to the #{end_position} ending position becuase it's not empty"
		end

		piece = self[start_position] 
		self[start_position] = nil 
		self[end_position] = piece
	end
end