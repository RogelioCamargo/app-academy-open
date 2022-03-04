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

	def age=(name)
		@age = name
	end

	def bark
		@age > 3 ? @bark.upcase : @bark.downcase
	end

	def favorite_foods
		@favorite_foods
	end

	def favorite_food?(food)
		@favorite_foods.include?(food.capitalize)
	end
end
