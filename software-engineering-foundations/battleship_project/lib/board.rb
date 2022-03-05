class Board
	attr_reader :size

	def self.print_grid(grid) 
		grid.each do |row|
			puts row.join(" ")
		end
	end

	def initialize(n)
		@grid = Array.new(n) { Array.new(n, :N) }
		@size = n * n
	end

	def [](position)
		row, col = position
		@grid[row][col]
	end

	def []=(position, value)
		row, col = position
		@grid[row][col] = value
	end

	def num_ships
		count = 0
		@grid.each { |row| count += row.count(:S) }
		count
	end

	def attack(position)
		if self[position] == :S
			self[position] = :H
			puts "you sunk my battleship!"
			true
		else
			self[position] = :X
			false
		end
	end

	def place_random_ships
		n = @size / 4
		m = Math.sqrt(@size).to_i
		positions = []
		
		while positions.length < n
			row = rand(0...m)
			col = rand(0...m)
			position = [row, col]
			if positions.include?(position)
				next
			end

			self[position] = :S 
			positions << position
		end
	end

	def hidden_ships_grid
		@grid.map do |row|
			row.map do |symbol|
				if symbol == :S
					:N 
				else
					symbol
				end
			end
		end
	end

	def cheat
		Board.print_grid(@grid)
	end

	def print 
		Board.print_grid(self.hidden_ships_grid)
	end
end
