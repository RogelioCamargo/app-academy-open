require "colorize"

class Tile
	attr_reader :value

	def initialize(value, revealed = false)
		@value = value
		@revealed = revealed
	end

	def to_s
		revealed? ? value.to_s.colorize(:red) : "-"
	end

	def revealed?
		@revealed
	end
end