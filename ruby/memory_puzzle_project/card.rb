class Card 
	VALUES = ("A".."Z").to_a
	attr_reader :value

	def self.get_shuffled_pairs(number_of_pairs)
		card_values = VALUES.sample(number_of_pairs)
		pairs = card_values + card_values
		pairs.shuffle!
		pairs.map { |value| Card.new(value) }
	end

	def initialize(value)
		@value = value 
		@revealed = false 
	end

	def hide 
		@revealed = false
	end

	def reveal 
		@revealed = true
	end 

	def revealed? 
		@revealed
	end

	def ==(other_card)
		self.value == other_card.value 
	end

	def to_s
		@revealed ? @value : " "
	end
end