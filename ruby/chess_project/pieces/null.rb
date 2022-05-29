require "singleton"
require_relative "piece"

class NullPiece < Piece
	include Singleton
	attr_reader :symbol 
	
	def initialize
		@symbol = " "
		@color = :none 
	end

	def symbol 
		" "
	end

	def moves 
		[]
	end
end