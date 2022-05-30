require_relative "slideable"
require_relative "piece"
require 'colorize'

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