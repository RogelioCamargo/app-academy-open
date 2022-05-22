class Card 
	attr_reader :value 
	
	def initialize(value)
		@value = value 
		@visible = false 
	end

	def hide 
		@visible = false
	end

	def reveal 
		@visible = true
	end 

	def ==(other_card)
		self.value == other_card.value 
	end

	def to_s
		@visible ? @value : " "
	end
end