require_relative "card"

class Board 
	def initialize(size = 4)
		@grid = Array.new(size) { Array.new(size) }
		populate
	end

	def render 
		puts "  #{(0...grid.length).to_a.join(" ")}"
		grid.each_with_index do |row, index|
			puts "#{index} #{row.join(" ")}"
		end
	end

	def reveal(guess_position)
		row, col = guess_position
		grid[row][col].reveal
	end

	private 
	attr_reader :grid

	def populate
		pairs = Card.get_shuffled_pairs((grid.length ** 2) / 2)
		(0...grid.length).each do |row|
			(0...grid.length).each do |col|	
				self[[row, col]] = pairs.pop
			end
		end
	end

	def won? 
		gird.all? do |row|
			row.all? { |card| card.revealed? }
		end
		true 
	end

	def [](position)
		row, col = position
		grid[row][col]
	end

	def []=(position, value)
		row, col = position
		grid[row][col] = value
	end
end