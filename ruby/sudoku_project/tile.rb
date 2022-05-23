class Tile 
	attr_accessor :value 

	def initialize(value, given = false)
		@value = value 
		@given = given
	end

	def to_s 
		@given ? value.to_s : "*"
	end
end
