class Board 
	attr_reader :size

	def initialize(size)
		@size = size
		@grid = Array.new(size) { Array.new(size).fill('_') }
	end

	def reset
		@grid = Array.new(@size) { Array.new(@size).fill('_') }
	end

	def valid?(position)
		x, y = position
		x < size && x >= 0 && y < size && y >= 0
	end

	def empty?(position)
		x, y = position
		@grid[x][y] == '_'
	end	

	def place_mark(position, mark)
		raise "Invalid Position" if !valid?(position)
		raise "Not Empty" if !empty?(position)

		x, y = position
		@grid[x][y] = mark
	end

	def print 
		p "  #{(0...size).to_a.join(" ")}"
		@grid.each_with_index do |row, idx|
			p "#{idx} #{row.join(" ")}"
		end
	end

	def win_row?(mark)
		(0...size).each do |row|
			return true if (0...size).all? { |col| @grid[row][col] == mark }
		end
		false
	end

	def win_col?(mark)
		(0...size).each do |col|
			return true if (0...size).all? { |row| @grid[row][col] == mark }
		end
		false 
	end

	def win_diagonal?(mark)
		return true if (0...size).all? { |i| @grid[i][i] == mark }
		reversed_grid = @grid.reverse
		p reversed_grid
		return true if (0...size).all? { |i| reversed_grid[i][i] == mark }
		false 
	end

	def win?(mark)
		win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
	end

	def empty_positions?
		(0...size).each do |row|
			return true if (0...size).any? { |col| @grid[row][col] == '_' }
		end
		false
	end
end