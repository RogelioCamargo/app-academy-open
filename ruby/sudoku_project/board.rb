require_relative "tile"

class Board 
	SOLVED = (1..9).to_a 

	def self.from_file(filename)
		File
			.readlines(filename)
			.map(&:chomp)
			.map do |row| 
				row.split("").map do |value| 
					Tile.new(value.to_i, value == "0" ? false : true)
				end
			end
	end

	def initialize(filename)
		@grid = Board.from_file("puzzles/#{filename}")
	end

	def render 
		puts "  #{(0...grid.length).to_a.join(" ")}"
		grid.each_with_index do |row, index|
			puts "#{index} #{row.join(" ")}"
		end
	end

	def solved?
		rows_solved? && columns_solved? && squares_solved?
	end

	def []=(position, new_value)
		x, y = position
		tile = @grid[x][y]
		tile.value = new_value
	end

	private 
	attr_reader :grid

	def rows_solved?
		grid.all? do |row|
			row.map(&:value).sort == SOLVED
		end
	end

	def columns_solved?
		(0...grid.length).all? do |col|
			row = (0...grid.length).map do |row| 
				grid[row][col].value 
			end
			row.sort == SOLVED
		end
	end	

	def squares_solved?
		# 0 | 3 | 6 
		# 1 | 4 | 7
		# 2 | 5 | 8
		(0...grid.length).all? do |quadrant_index| 
			quadrant_values = [] 
			x = 3 * (quadrant_index / 3)
			y = 3 * (quadrant_index % 3)
			(x...x + 3).each do |row|
				(y...y + 3).each do |col|
						quadrant_values << grid[row][col].value
				end
			end
			quadrant_values.sort == SOLVED
		end
	end
end


if $PROGRAM_NAME == __FILE__
	(filename, _) = ARGV
	board = Board.new(filename)
	board.render 
	p board.solved?
end
