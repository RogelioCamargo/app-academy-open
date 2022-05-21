require_relative "board.rb"
require_relative "human_player.rb"

class Game 
	def initialize(board_size, player_marks)
		@players = player_marks.map { |player_mark| HumanPlayer.new(player_mark) }
		@number_of_players = player_marks.length 
		@board = Board.new(board_size)
		@current_player = @players[0]
		@current_player_index = 0
	end

	def switch_turn
		@current_player_index = (@current_player_index + 1) % @number_of_players
		@current_player = @players[@current_player_index]
	end

	def reset 
		@board.reset
	end

	def play 
		while @board.empty_positions? 
			@board.print 
			position = @current_player.get_position
			continue if !@board.valid?(position) || !@board.empty?(position)
			@board.place_mark(position, @current_player.mark)
			if @board.win?(@current_player.mark)
				puts "#{@current_player.mark} WINS!"
				break 
			else 
				switch_turn
			end
		end
	end

end