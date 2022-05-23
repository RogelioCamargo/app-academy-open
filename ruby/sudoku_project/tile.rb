class Tile 
	attr_accessor :value 

	def initialize(value, given = false)
		@value = value 
		@given = given
	end

	def to_s 
		value == 0 ? "*" : value.to_s
	end
	
	def given?
		@given
	end
end
