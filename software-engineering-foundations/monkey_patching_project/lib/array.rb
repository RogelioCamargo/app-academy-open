# Monkey-Patch Ruby's existing Array class to add your own custom methods

require "byebug"
class Array
	def span 
		return nil if self.empty?
		min = self.min
		max = self.max 
		# debugger
		max - min
	end

	def average 
		return nil if self.empty?
		self.inject(0) { |acc, el| acc + el } / (self.length * 1.0)
	end


	def median 
		return nil if self.empty?
		sorted_array = self[0..-1].sort
		l = self.length
		middle = l / 2
		if (sorted_array.length % 2 == 0)
			return (sorted_array[middle] + sorted_array[middle - 1]) / 2.0
		else
			return sorted_array[middle]
		end
	end

	def counts 
		hash = Hash.new(0)
		self.each do |el|
			hash[el] += 1
		end

		hash
	end

	def my_count(value)
		count = 0
		self.each do |el|
			if el == value 
				count += 1
			end
		end
		count
	end

	def my_index(value)
		self.each_with_index do |el, index|
			return index if el == value
		end
		nil
	end

	def my_uniq
		array = []
		self.each do |el|
			if !array.include?(el)
				array << el 
			end
		end

		array 
	end

	def my_transpose 
		new_array = []
		n = self.length 
		(0...n).each do |i|
			array = []
			(0...n).each do |j|
				array << self[j][i]
			end
			new_array << array
		end
		new_array
	end
end

# [1, 2, 3, 4].span