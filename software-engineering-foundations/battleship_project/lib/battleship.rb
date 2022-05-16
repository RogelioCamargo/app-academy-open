require_relative "board"
require_relative "player"

class Battleship
	attr_reader :board, :player 

	def initialize(n)
		@board = Board.new(n)
		@player = Player.new 
		@remaining_misses = (n * n) / 2
	end

	def start_game 
		@board.place_random_ships
		puts "Ships remaining: #{@board.num_ships}"
		@board.print
	end

	def lose? 
		if @remaining_misses <= 0 
			puts 'you lose'
			return true 
		else 
			return false 
		end
	end

	def win? 
		if @board.num_ships == 0
			puts 'you win' 
			return true 
		end 

		false 
	end

	def game_over? 
		lose? || win?
	end

	def turn 
		position = @player.get_move 
		if !@board.attack(position)
			@remaining_misses -= 1
		end
		
		@board.print
		puts "#{@remaining_misses}"
	end
end
