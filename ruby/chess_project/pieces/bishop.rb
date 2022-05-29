require_relative "slideable"
require_relative "piece"

class Bishop < Piece
	include Slideable

	def symbol 
		"♝".colorize(color)
	end

	private

	def move_directions
		diagonal_directions
	end
end