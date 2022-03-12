require_relative "board"

class Game
	def initialize(file)
		grid = Board.from_file("./puzzles/#{file}")
		@board = Board.new(grid)
	end

	def play
		until solved?
			board.render
			position = get_position
			p position
			value = get_value
			board[position] = value
		end

		board.render
    puts "Congratulations, you win!"
	end

	private

	def prompt_position
		puts "Please enter a position on the board (e.g., '3,4')"
		print "> "
	end

	def prompt_value
		puts "Please enter a value between 1 and 9 (0 to clear the tile)"
		print "> "
	end

	def get_position
		prompt_position
		x, y = gets.chomp.split(",")
		[x.to_i, y.to_i]
	end

	def get_value
		prompt_value
		value = gets.chomp.to_i
		value
	end

	def solved?
		board.solved?
	end

	private

	attr_reader :board
end



game = Game.new("sudoku1.txt")
game.play