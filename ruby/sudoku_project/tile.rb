class Tile 
	attr_reader :value 

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

	def value=(new_value)
		if given?
			puts "Can't alter given values."
			sleep(1)
		else
			@value = new_value
		end
	end
end
