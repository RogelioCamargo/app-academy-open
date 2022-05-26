require_relative "board"

class MinesweeperGame
	attr_reader :board 

	def initialize
		@board = Board.new
	end

	def play 
		until won? || lost? 
			puts render 
			puts reveal
			action, position = get_move
			perform_action(action, position)
		end

		if won? 
			puts "You win!"
		else 
			puts "You lost!"
			puts reveal
		end
	end

	private 

	def get_move
		action, x, y = gets.chomp.split(",")
		[action, [x.to_i, y.to_i]]
	end

	def perform_action(action, position)
		tile = board[position]
		case action 
		when "f"
			tile.toggle_flag
		when "e"
			tile.explore 
		else 
			puts "Choose one of the options"
		end
	end

	def lost? 
		board.lost? 
	end
	
	def won? 
		board.won?
	end

	def render 
		board.render
	end

	def reveal 
		board.reveal
	end
		
end

if $PROGRAM_NAME == __FILE__
  MinesweeperGame.new.play
end