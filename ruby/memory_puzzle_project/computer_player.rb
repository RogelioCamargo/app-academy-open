class ComputerPlayer 
	attr_reader :board_size, :matched_cards
	attr_accessor :previous_guess

	def initialize(size = 4)
		@board_size = size
		@known_cards = {}
		@matched_cards = {}
		@previous_guess = nil
	end

	def receive_revealed_card(position, value)
    @known_cards[position] = value
  end

	def receive_match(position_1, position_2)
		puts "It's a match!"
		@matched_cards[position_1] = true 
		@matched_cards[position_2] = true 
	end

	def get_input
		if previous_guess
      second_guess
    else
      first_guess
    end
	end

	def first_guess
    get_unmatched_match || random_guess
  end

  def second_guess
    match_previous || random_guess
  end

	def get_unmatched_match
		(position, _) = @known_cards.find do |position_1, card_1|
			@known_cards.any? do |position_2, card_2|
				position_1 != position_2 && card_1 == card_2 && 
				!(matched_cards[position_1] || matched_cards[position_2])
			end
		end
		position
  end

  def match_previous
		(position, _) = @known_cards.find do |position, card|
			previous_guess != position && card == @known_cards[previous_guess] &&
			!matched_cards[position]
		end
		position
  end

	def random_guess
    guess_position = nil
    until guess_position && !@known_cards[guess_position]
      guess_position = [rand(board_size), rand(board_size)]
    end
    guess_position
  end
end