# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
		return nil if self.length == 0

		min = self.min
		max = self.max

		max - min
	end

	def average
		return nil if self.length == 0

		self.sum / (self.length * 1.0)
	end

	def average
		return nil if self.length == 0

		self.sum / (self.length * 1.0)
	end

	def median
		return nil if self.length == 0

		sorted_array = self.sort
		
		if sorted_array.length.even?
			mid = (sorted_array.length / 2) - 1
			(sorted_array[mid] + sorted_array[mid + 1]) / 2.0
		else
			mid = sorted_array.length / 2
			sorted_array[mid]
		end
	end

	def counts
		hash = Hash.new(0)

		self.each { |ele| hash[ele] += 1 }

		hash
	end

	def my_count(target)
		count = 0

		self.each { |ele| count += 1 if ele == target }

		count
	end

	def my_index(target)
		self.each_with_index { |ele, idx| return idx if ele == target }

		nil
	end

	def my_uniq
		unique = []

		self.each { |ele| unique << ele if !unique.include?(ele) }
		unique 
	end

	def my_transpose
		col = 0
		new_array = []
		while col < self[0].length
			new_row = []
			row = 0
			while row < self.length
				new_row << self[row][col]
				row += 1
			end
			new_array << new_row
			col += 1
		end

		new_array
	end
end
