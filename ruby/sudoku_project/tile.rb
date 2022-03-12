require "colorize"

class Tile
	attr_reader :value

	def initialize(value)
		@value = value
		@given = value == 0 ? true : false
	end

	def value=(new_value)
		@value = new_value unless given?
	end

	def to_s
		value.to_s.colorize(color)
	end

	private

	def color
		given? ? :yellow : :red
	end

	def given?
		@given
	end
end