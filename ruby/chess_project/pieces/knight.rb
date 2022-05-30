require_relative "piece"
require_relative "stepable"
require 'colorize'

class Knight < Piece
	include Stepable

	def symbol 
		'♞'.colorize(color)
	end

	private 

	def all_possible_moves
		[
			[-1,-2], [1,-2], [2,-1], [2,1],
			[1,2], [-1,2], [-2, -1], [-2,1]
		]
	end
end