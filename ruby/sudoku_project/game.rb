require_relative "board"
class SudokuGame 
	VALID_VALUES = (1..9).to_a 

	def initialize(filename = "sudoku1.txt")
		@board = Board.new(filename)
	end

	def play 
		until solved?
			system("clear")
			render
			prompt 
		end
		system("clear")
		render
		puts "You finished! Congrats!"
	end

	def prompt
		print "Enter a position: "
		position = get_position
		print "Enter a value: "
		value = get_value

		board[position] = value
	end

	def get_position 
		x, y = gets.chomp.split(" ")
		[x.to_i, y.to_i]
	end

	def get_value 
		value = gets.chomp.to_i
	end

	def solved?
		board.solved?
	end

	def render
		board.render
	end

	private 
	attr_reader :board

end

if $PROGRAM_NAME == __FILE__
	SudokuGame.new("sudoku1_almost.txt").play
end