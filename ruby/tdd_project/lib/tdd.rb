require "set"
class Array 
	def my_uniq 
		uniques = []
		seen = Set.new 
		self.each do |el|
			next if seen.include?(el)
			seen.add(el)
			uniques << el 
		end
		uniques
	end

	def two_sum 
		pairs = []

		(0...self.length).each do |i|
			(i+1...self.length).each do |j|
				a = self[i]
				b = self[j]
				if a + b == 0 
					pairs << [i, j]
				end
			end
		end 
		pairs
	end

	def my_transpose 
		new_matrix = []
		(0...self.length).each do |i|
			new_row = []
			(0...self.length).each do |j|
				new_row << self[j][i]
			end
			new_matrix << new_row
		end
		new_matrix
	end
end



def max_profit(prices)
	min_idx = nil
	max_idx = nil
	max_profit = 0

	i = 0 
	j = prices.length - 1 
	while i < j do 
		if prices[i] < prices[j]
			profit = prices[j] - prices[i]
			if profit > max_profit 
				min_idx = i  
				max_idx = j 
				max_profit = profit 
			end
			j -= 1
		else 
			i += 1
		end 
	end

	max_profit > 0 ? [min_idx, max_idx] : []
end


class TowersOfHanoiGame 
	attr_reader :disc_sizes, :towers
	def initialize(num_discs = 3)
		@disc_sizes = (1..num_discs).to_a.reverse
		@towers = [[*disc_sizes], [], []]
	end

	def play 
		until won? 
			render
			from_index, to_index = get_input
			move(from_index, to_index)
		end
		render
		puts "Congrats, you win!"
	end

	def move(from_index, to_index)
		from_tower = towers[from_index]
		to_tower = towers[to_index] 
		to_tower << from_tower.pop 
	end

	def won? 
		tower_3 = towers.last 
		disc_sizes == tower_3
	end

	private 

	def render 
		towers.each_with_index do |tower, index|
			puts "Tower #{index + 1}: " + tower.join(" ")
		end
	end

	def get_input 
		from_index = nil
		to_index = nil
		loop do 
			loop do 
				print "Move Disc From Tower: "
				from_index = gets.chomp.to_i 
				break if valid_input?(from_index)
			end

			loop do 
				print "Move Disc To Tower: " 
				to_index = gets.chomp.to_i 
				break if valid_input?(to_index) 
			end

			break if valid_move?(from_index, to_index)
			puts "You can't put larger discs on top of smaller discs, try again!"
			render
		end
		[from_index - 1, to_index - 1]
	end

	def valid_input?(tower_num)
		tower_num.between?(1, 3)
	end 

	def valid_move?(from_index, to_index)
		
		from_tower = towers[from_index - 1]
		to_tower = towers[to_index - 1]
		return true if to_tower.empty?
		from_tower.last <= to_tower.last
	end
end

TowersOfHanoiGame.new.play