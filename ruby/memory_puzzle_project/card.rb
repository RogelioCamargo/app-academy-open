class Card
	VALUES = ("A".."Z").to_a

	def self.shuffle_pairs(number_of_pairs)
		values = VALUES

		while number_of_pairs > values.length
			values = values + values
		end

		values = values.shuffle.take(number_of_pairs) * 2
		values.shuffle!
		values.map { |value| self.new(values) }
	end

	attr_reader :value

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
		@reveal
	end

	def to_s
		revealed? ? value.to_s : " "
	end

	def ==(other_card)
		other_card.is_a?(self.class) && value == other_card.value
	end
end