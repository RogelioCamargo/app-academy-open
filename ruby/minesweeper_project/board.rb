require_relative "tile"

class Board 
	GRID_SIZE = 9
	NUMBER_OF_BOMBS = 10

	def initialize
		generate_board
	end

	def size 
		GRID_SIZE
	end

	def [](position)
		x, y = position
		@grid[x][y]
	end

	def render(reveal = false)
		@grid.map do |row|
			row.map do |tile|
				reveal ? tile.reveal : tile.render
			end.join("")
		end.join("\n")
	end

	def reveal 
		render(true)
	end

	def lost? 
		@grid.flatten.any? { |tile| tile.bombed? && tile.explored? }
	end

	def won? 
		@grid.flatten.all? { |tile| tile.bombed? != tile.explored? }
	end

	private
	def generate_board 
		@grid = Array.new(GRID_SIZE) do |row|
			Array.new(GRID_SIZE) do |col|
				Tile.new(self, [row, col])
			end
		end

		plant_bombs
	end

	def plant_bombs 
		bombs_on_board = 0 
		while bombs_on_board < NUMBER_OF_BOMBS
			random_position = [rand(GRID_SIZE), rand(GRID_SIZE)]
			tile = self[random_position]
			next if tile.bombed?
			tile.plant_bomb
			bombs_on_board += 1
		end
	end
end