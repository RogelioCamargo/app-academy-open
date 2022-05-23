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

	private 
	attr_reader :board

	def prompt
		position = get_position
		value = get_value

		board[position] = value
	end

	def get_position 
		position = nil
		until valid_position?(position) do
			print "Enter a position: "
			position = gets.chomp.split(" ").map { |x| x.to_i } 
		end
		position	
	end

	def get_value 
		value = nil
		until valid_value?(value) do 
			print "Enter a value: "
			value = gets.chomp.to_i 
		end
		value
	end

	def solved?
		board.solved?
	end

	def render
		board.render
	end

	def valid_position?(position)
		position.is_a?(Array) && 
		position.length == 2 && 
		position.all? { |index| index.between?(0, board.size - 1) }
	end

	def valid_value?(value)
		value.is_a?(Integer) && value.between?(0, 9) 
	end

end

if $PROGRAM_NAME == __FILE__
	SudokuGame.new("sudoku1_almost.txt").play
end