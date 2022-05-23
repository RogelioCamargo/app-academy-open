require_relative "card"

class Board 
	def initialize(size = 4)
		@grid = Array.new(size) { Array.new(size) }
		populate
	end

	def number_of_rows 
		grid.length
	end

	def render 
		puts "  #{(0...number_of_rows).to_a.join(" ")}"
		grid.each_with_index do |row, index|
			puts "#{index} #{row.join(" ")}"
		end
	end

	def reveal(guess_position)
		row, col = guess_position
		grid[row][col].reveal
	end

	def won? 
		grid.all? do |row|
			row.all? { |card| card.revealed? }
		end 
	end

	def [](position)
		row, col = position
		grid[row][col]
	end

	def []=(position, value)
		row, col = position
		grid[row][col] = value
	end

	private 
	attr_reader :grid

	def populate
		pairs = Card.get_shuffled_pairs((number_of_rows ** 2) / 2)
		(0...number_of_rows).each do |row|
			(0...number_of_rows).each do |col|	
				self[[row, col]] = pairs.pop
			end
		end
	end
end