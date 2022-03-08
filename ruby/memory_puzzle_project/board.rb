require_relative "card.rb"

class Board
	attr_reader :size

	def initialize(size = 4)
		@grid = Array.new(size) { Array.new(size) }
		@size = size
		self.populate
	end

	def [](position)
		x, y = position
		@grid[x][y]
	end

	def []=(position, value)
		x, y = position
		@grid[x][y] = value
	end

	def populate
		number_of_pairs = self.size**2 / 2
		cards = Card.shuffle_pairs(number_of_pairs)
		(0...self.size).each do |x|
			(0...self.size).each do |y|
				self[[x, y]] = cards.pop
			end
		end
	end

	def render
		system "clear"
		puts "  #{(0...size).to_a.join(" ")}"
		@grid.each_with_index do |row, index|
			puts "#{index} #{row.join(" ")}"
		end
	end

	def won?
		(0...self.size).each do |x|
			(0...self.size).each do |y|
				return false unless self.revealed?([x, y])
			end
		end
		true
	end

	def revealed?(position)
		self[position].revealed?
	end

	def hide(position)
		self[position].hide
	end

	def reveal(position)
		if self.revealed?(position)
			puts "Card Already Revealed!"
		else
			self[position].reveal
		end
		self[position].value
	end

	private 

	attr_reader :grid
end