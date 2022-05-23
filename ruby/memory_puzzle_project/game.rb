require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class MemoryPuzzleGame 
	def initialize(player)
		@board = Board.new 
		@previous_guess = nil 
		@player = player 
	end

	def play 
		until game_over?
			render 
			guess_position = get_player_input
			make_guess(guess_position)
		end
	end

	private 
	attr_reader :board, :player
	attr_accessor :previous_guess

	def get_player_input 
		position = nil 
		position = player.get_input until valid_guess?(position)
		position
	end

	def make_guess(guess_position)
		raise "Invalid guess" unless valid_guess?(guess_position)
		current_card = board[guess_position]
		current_card.reveal 
		player.receive_revealed_card(guess_position, current_card)
		compare_guess(guess_position)
	end

	def compare_guess(current_guess)
		if !previous_guess 
			self.previous_guess = current_guess 
			player.previous_guess = current_guess
		else  
			if match?(previous_guess, current_guess)
				render
				player.receive_match(previous_guess, current_guess)
				sleep(1)
			else
				render
				puts "Not a match!"
				sleep(1)
				[previous_guess, current_guess].each { |position| board[position].hide }
			end
			self.previous_guess = nil 
			player.previous_guess = nil
		end
	end

	def match?(position_1, position_2)
		board[position_1] == board[position_2]
	end

	def valid_guess?(guess_position)
		return false if !guess_position
		row, col = guess_position
		row < board.number_of_rows && row >= 0 && col < board.number_of_rows && col >= 0
	end

	def render 
		system("clear")
		board.render
	end

	def game_over?
		board.won?
	end
end


if $PROGRAM_NAME == __FILE__
	type_of_player = ARGV.shift
	case type_of_player
	when "C"
		MemoryPuzzleGame.new(ComputerPlayer.new).play 
	when "H"
		MemoryPuzzleGame.new(HumanPlayer.new).play
	else 
		raise "Invalid type of player!"
	end
end