class Dog
	def initialize(name, breed, age, bark, favorite_foods)
		@name = name
		@breed = breed 
		@age = age 
		@bark = bark 
		@favorite_foods = favorite_foods
	end

	def name 
		@name
	end

	def breed 
		@breed 
	end

	def age 
		@age 
	end

	def age=(number)
		@age = number 
	end

	def bark
		if @age <= 3 
			@bark.downcase
		else
			@bark.upcase
		end
	end

	def favorite_foods
		@favorite_foods
	end

	def favorite_food?(food)
		@favorite_foods.each do |favorite_food|
			if favorite_food.downcase == food.downcase
				return true
			end
		end
		false
	end
end
