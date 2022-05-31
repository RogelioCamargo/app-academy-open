require_relative "board"
require_relative "human_player"
require_relative "display"

class ChessGame
	attr_reader :board, :display, :players, :current_player
	def initialize
		@board = Board.new 
		@display = Display.new(@board)
		@players = {
			white: HumanPlayer.new(:white, @display),
			black: HumanPlayer.new(:black, @display)
		}
		@current_player = :white
	end

	def play 
		until board.checkmate?(current_player)
			begin 
				start_position, end_position = players[current_player].make_move
				board.move_piece(current_player, start_position, end_position)
				swap_turn!
				notify_players
			rescue StandardError => e
				@display.notifications[:error] = e.message
        retry
      end
		end

		display.render 
		puts "#{current_player} is checkmated."

		nil
	end 

	private 

	def notify_players
		if board.in_check?(current_player)
			display.set_check!
		else
			display.uncheck!
		end
	end

	def swap_turn!
		@current_player = current_player == :white ? :black : :white
	end
end


if $PROGRAM_NAME == __FILE__
  game = ChessGame.new
	game.play
end