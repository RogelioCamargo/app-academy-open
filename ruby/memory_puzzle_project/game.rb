require_relative "board"

class MemoryPuzzleGame 
	def initialize
		@board = Board.new 
	end

	def play 
		@previous_guess = nil 
		until game_over?
			render 
			guess_position = prompt 
			make_guess(guess_position)
		end
	end

	private 
	attr_reader :board, :previous_guess

	def prompt 
		print "Enter a positon: "
		x, y = gets.chomp.split(" ")
		[x.to_i, y.to_i]
	end

	def make_guess(guess_position)
		raise "Invalid guess" unless valid_guess?(guess_position)
		current_guess = board[guess_position]

		if !previous_guess 
			@previous_guess = current_guess 
			current_guess.reveal 
		else  
			if previous_guess == current_guess
				current_guess.reveal
				render
				puts "It's a match!"
				sleep(2)
			else
				current_guess.reveal
				puts current_guess.value
				render
				puts "Not a match!"
				sleep(2)
				previous_guess.hide 
				current_guess.hide 
			end
			@previous_guess = nil 
		end
	end

	def valid_guess?(guess_position)
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
  game = MemoryPuzzleGame.new
  game.play
end