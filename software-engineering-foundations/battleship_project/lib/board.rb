class Board
	attr_reader :size

  def initialize(size)
		@grid = Array.new(size) { Array.new(size).fill(:N) }
		@size = size * size
	end

	def [](position)
		r, c = position
		@grid[r][c]
	end

	def []=(position, value)
		r, c = position
		@grid[r][c] = value
	end

	def num_ships 
		count = 0
		(0...@grid.length).each do |r|
			(0...@grid.length).each do |c|
				count += 1 if @grid[r][c] == :S
			end
		end
		count
	end
end
