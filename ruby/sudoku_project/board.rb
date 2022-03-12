require_relative "tile"

class Board 
	def self.from_file(filename)
		rows = File.readlines(filename).map(&:chomp)
		grid = rows.map do |row|
			row.split("").map do |value|
				integer = value.to_i
				Tile.new(integer)
			end
		end
		grid
	end

	def initialize(grid)
		@grid = grid
	end

	def [](position)
		x, y = position
		@grid[x][y] 
	end

	def []=(position, value)
		x, y = position
		tile = @grid[x][y]
		tile.value = value
	end

	def render
		puts "  #{(0..8).to_a.join(' ')}"
		grid.each_with_index do |row, index|
			puts "#{index} #{row.join(" ")}"
		end
	end

	def solved?
		rows.all? { |row| solved_set?(row) } &&
		columns.all? { |column| solved_set?(column) } &&
		squares.all? { |square| solved_set?(square) }
	end

	private

	attr_reader :grid

	def rows
		grid
	end

	def columns
		grid.transpose
	end

	def size
		grid.length
	end

	def solved_set?(tiles)
		values = tiles.map(&:value)
		values.sort == (1..9).to_a
	end

	def square(idx)
    tiles = []
    x = (idx / 3) * 3
    y = (idx % 3) * 3

    (x...x + 3).each do |i|
      (y...y + 3).each do |j|
        tiles << self[[i, j]]
      end
    end

    tiles
  end

  def squares
    (0..8).to_a.map { |i| square(i) }
  end
end