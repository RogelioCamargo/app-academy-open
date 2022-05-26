require "yaml"
require_relative "board"

class MinesweeperGame
	attr_reader :board 

	def initialize
		@board = Board.new
	end

	def play 
		until won? || lost? 
			puts render 
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
		print "Enter a move: "
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
		when "s"
			save 
		else 
			puts "Choose one of the options"
		end
	end

	def save 
		print "Enter a filename to save at: "
		filename = gets.chomp 
		File.write(filename, YAML.dump(self))
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
  case ARGV.count
  when 0
    MinesweeperGame.new.play
  when 1
    YAML.load_file(
			ARGV.shift, 
			permitted_classes: [
				MinesweeperGame, 
				Board, Tile
			],
			aliases: true
		).play
  end
end