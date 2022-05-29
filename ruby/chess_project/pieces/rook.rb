require_relative "slideable" 
require_relative "piece"

class Rook < Piece
	include Slideable

	def symbol 
		"♜".colorize(color)
	end

	private

	def move_directions
		horizontal_and_vertical_directions
	end
end