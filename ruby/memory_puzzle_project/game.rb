require_relative "board.rb"
require_relative "human_player.rb"

class MemoryGame
	attr_reader :player

	def initialize(size, player)
		@board = Board.new(size)
		@previous_guess = nil
		@player = player
	end

	def play
		while !board.won?
			board.render
			player.prompt
			position = player.get_input
			make_guess(position)
		end
	end

	def make_guess(position)
		revealed_value = board.reveal(position)
		player.receive_revealed_card(position, revealed_value)
		board.render
		self.compare_guess(position)

		sleep(2)
	end

	def compare_guess(current_guess)
		if self.previous_guess
			if self.match?(current_guess, previous_guess)
				player.receive_match(current_guess, previous_guess)
			else
				puts "Incorrect! Try Again!"
				[self.previous_guess, current_guess].each { |guess| board.hide(guess) }
			end
			self.previous_guess = nil
			player.previous_guess = nil
		else
			self.previous_guess = current_guess
			player.previous_guess = current_guess
		end
	end

	def match?(position_one, position_two)
		board[position_one] == board[position_two]
	end

	private

	attr_accessor :previous_guess
	attr_reader :board
end

player = HumanPlayer.new
memory_game = MemoryGame.new(3, player)
memory_game.play

