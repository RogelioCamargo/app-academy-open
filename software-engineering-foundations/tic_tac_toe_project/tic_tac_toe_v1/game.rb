require_relative "board.rb"
require_relative "human_player.rb"

class Game 
	def initialize(player_1_mark, player_2_mark)
		@player_1 = HumanPlayer.new(player_1_mark)
		@player_2 = HumanPlayer.new(player_2_mark)
		@board = Board.new
		@current_player = @player_1
	end

	def switch_turn
		@current_player = @current_player == @player_1 ? @player_2 : @player_1
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