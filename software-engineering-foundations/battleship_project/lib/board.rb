class Board
	attr_reader :size

	def self.print_grid(grid)
		grid.each do |row|
			puts row.join(" ")
		end
	end

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

	def attack(position) 
		if self[position] == :S 
			self[position] = :H
			puts 'you sunk my battleship!'
			return true
		else 
			self[position] = :X
			return false 
		end
	end

	def place_random_ships 
		ship_count = self.size / 4
		n = @grid.length - 1
		while (ship_count != 0)
			position = [rand(0..n), rand(0..n)]
			if self[position] == :N 
				self[position] = :S
				ship_count -= 1
			end
		end
	end

	def hidden_ships_grid
		n = @grid.length
		new_grid = Array.new(n) { Array.new(n) }
		(0...n).each do |r|
			(0...n).each do |c|
				position = [r, c]
				if self[position] == :S
					new_grid[r][c] = :N 
				else 
					new_grid[r][c] = self[position]
				end
			end
		end
		new_grid
	end

	def cheat 
		Board.print_grid(@grid)
	end

	def print
		Board.print_grid(self.hidden_ships_grid)
	end
end
