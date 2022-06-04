# def exp(b, n)
# 	return 1 if n == 0
# 	b * exp(b, n - 1)
# end

def exp(b, n)
	return 1 if n == 0
	return b if n == 1 
	if n.even? 
		exp(b, n / 2) ** 2
	else 
		b * (exp(b, (n - 1) / 2) ** 2)
	end
end

# p exp(0, 0) # 1
# p exp(0, 1) # 0 
# p exp(1, 1) # 1
# p exp(1, 2) # 1
# p exp(2, 0) # 1
# p exp(2, 1) # 2
# p exp(2, 2) # 4
# p exp(2, 5) # 32
# p exp(2, 6) # 64

class Array
	def deep_dup
		self.map do |el|
			if el.is_a?(Array)
				el.deep_dup
			else
				el
			end
		end
	end
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts_copy[1]
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

def fib(n)
	return [] if n <= 0
	return [0] if n == 1
	return [0, 1] if n == 2

	previous_sequence = fib(n - 1) 
	previous_sequence + [previous_sequence[-1] + previous_sequence[-2]]

end

# p fib(0) # [0]
# p fib(1) # [0]
# p fib(2) # [0, 1]
# p fib(3) # [0, 1, 1]
# p fib(4) # [0, 1, 1, 2]

def bsearch(array, target)
	return nil if array.empty? 

	mid_idx = array.length / 2
	case array[mid_idx] <=> target 
	when -1
		idx_found = bsearch(array[mid_idx+1..-1], target)
		idx_found.nil? ? nil : mid_idx + 1 + idx_found
	when 0
		mid_idx
	when 1 
		bsearch(array[0...mid_idx], target)
	end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def subsets(array)
	return [[]] if array.empty?

	last = array[-1] 
	subsets_without_last = subsets(array[0..-2])
	subsets_with_last = subsets_without_last.map { |subset| subset + [last] } 
	subsets_without_last.concat(subsets_with_last)
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(array)
	return [array] if array.length <= 1 

	first = array[0]
	perms = permutations(array[1..-1])
	total_perms = []
	perms.each do |perm|
		(0..perm.length).each do |index|
			total_perms << perm[0...index] + [first] + perm[index..-1]
		end
	end
	total_perms
end

# [1] => [[1]]
# [1, 2] => [[1, 2], [2, 1]]
# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]


def merge_sort(array)
	return [] if array.empty?
	return array if array.length < 2
	middle_index = array.length / 2
	left_half = merge_sort(array[0...middle_index])
	right_half = merge_sort(array[middle_index..-1])
	merge_halves(left_half, right_half)
end

def merge_halves(array_1, array_2)
	new_array = []
	until array_1.empty? || array_2.empty? do
		if array_1.first <= array_2.first 
			new_array << array_1.shift
		else 
			new_array << array_2.shift 
		end
	end

	new_array + array_1 + array_2
end

# p merge_sort([6, 1, 7, 2, 4, 9, 3])

def make_change(target, coins = [25, 10, 5, 1])
	return [] if target == 0
	return nil if coins.none? { |coin| coin <= target }
	coins = coins.sort.reverse 
	best_change = nil
	coins.each_with_index do |coin, index|
		next if coin > target 

		change_remainder = make_change(target - coin, coins.drop(index))
		next if change_remainder.nil? 

		possible_best_change = [coin] + change_remainder
		if best_change.nil? || possible_best_change.length < best_change.length 
			best_change = possible_best_change
		end
	end
	best_change
end

p make_change(24, [10, 7, 1]) # [10,7,7]
