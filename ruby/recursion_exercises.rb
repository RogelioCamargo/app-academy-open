def sum_to(n)
	return nil if n < 1
	return 1 if n == 1

	n + sum_to(n - 1)
end

# puts sum_to(5)  # => returns 15
# puts sum_to(1)  # => returns 1
# puts sum_to(9)  # => returns 45
# puts sum_to(-8)  # => returns nil

def add_numbers(array)
	return nil if array.length == 0
	return array.first if array.length == 1
	array.first + add_numbers(array[1..-1])
end

# puts add_numbers([1,2,3,4]) # => returns 10
# puts add_numbers([3]) # => returns 3
# puts add_numbers([-80,34,7]) # => returns -39
# puts add_numbers([]) # => returns nil

def gamma_fnc(n)
	return nil if n < 1
	return 1 if n == 1

	(n - 1) * gamma_fnc(n - 1)

end

# puts gamma_fnc(0)  # => returns nil
# puts gamma_fnc(1)  # => returns 1
# puts gamma_fnc(4)  # => returns 6
# puts gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
	return false if flavors.empty?
	return true if flavors.first == favorite

	ice_cream_shop(flavors[1..-1], favorite)
end

# puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# puts ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# puts ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
	return string if string.length <= 1
	reverse(string[1..-1]) + string[0]
end

# puts reverse("house") # => "esuoh"
# puts reverse("dog") # => "god"
# puts reverse("atom") # => "mota"
# puts reverse("q") # => "q"
# puts reverse("id") # => "di"
# puts reverse("") # => ""

# def exp(b, n)
# 	puts n
# 	return 1 if n == 0
# 	return 0 if b == 0

# 	b * exp(b, n - 1)
# end

def exp(b, n)
	return 1 if n == 0

	half = exp(b, n / 2)

	if n.even?
		half * half
	else
		b * half * half
	end
end

# puts exp(0, 0) # => 1
# puts exp(0, 1) # => 0
# puts exp(1, 0) # => 1
# puts exp(1, 1) # => 1
# puts exp(2, 0) # => 1
# puts exp(2, 1) # => 2
# puts exp(2, 2) # => 4
# puts exp(3, 20) # => 243

class Array
	def deep_dup
		self.map do |element|
			if element.is_a?(Array)
				element.deep_dup
			else
				element
			end
		end
	end
end

# array = [1, [2], [3, [4]]]
# array_copy = array.deep_dup 
# array_copy[1] << 5 # => [1, [2], [3, [4]]]
# p array_copy # => [1, [2, 5], [3, [4]]]
# p array # => [1, [2], [3, [4]]]

# def fibonacci(n)
# 	return [] if n <= 0
# 	return [0] if n == 1
# 	return [0, 1] if n == 2

# 	array = fibonacci(n - 1)
# 	array + [array[-2] + array[-1]]
# end

def fibonacci(n)
	if n <= 2
		[0, 1].take(n)
	else
		result = fibonacci(n - 1)
		result << result[-2] + result[-1]
	end
end


# p fibonacci(0) # => []
# p fibonacci(1) # => [0]
# p fibonacci(2) # => [0, 1]
# p fibonacci(3) # => [0, 1, 1]
# p fibonacci(4) # => [0, 1, 1, 2]
# p fibonacci(5) # => [0, 1, 1, 2, 3]
# p fibonacci(8) # => [0, 1, 1, 2, 3, 5, 8, 13]

def bsearch(array, target)
	return nil if array.empty?

	# mid = array.length / 2
	# if target < array[mid]
	# 	bsearch(array[0...mid], target)
	# elsif target > array[mid]
	# 	result = bsearch(array[mid + 1..-1], target)
	# 	result.nil? ? nil : (mid + 1) + result
	# else
	# 	mid
	# end

	mid = array.length / 2
	case target <=> array[mid]
	when -1
		bsearch(array[0...mid], target)
	when 0
		mid
	when 1
		result = bsearch(array[mid + 1..-1], target)
		result.nil? ? nil : (mid + 1) + result
	end

end

# puts bsearch([1, 2, 3], 1) # => 0
# puts bsearch([2, 3, 4, 5], 3) # => 1
# puts bsearch([2, 4, 6, 8, 10], 6) # => 2
# puts bsearch([1, 3, 4, 5, 9], 5) # => 3
# puts bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# puts bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# puts bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def subsets(array)
	return [[]] if array.empty?

	subsets_without_last = subsets(array[0...-1])
	subsets_with_last = subsets_without_last.map { |subset| subset + [array.last] }
	subsets_without_last + subsets_with_last
end

# class Array
# 	def subsets
# 		return [[]] if self.empty?

# 		subsets_without_last = self[0...-1].subsets
# 		subsets_with_last = subsets_without_last.map { |subset| subset + [self.last] }
# 		subsets_without_last + subsets_with_last
# 	end
# end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# p [].subsets
# p [1].subsets
# p [1, 2].subsets
# p [1, 2, 3].subsets

def permutations(array) 
	return [array] if array.length <= 1

	perms = permutations(array[1..-1])
	first = array.first

	total_permutations = []

	perms.each do |perm|
		(0..perm.length).each do |i|
			total_permutations << perm[0...i] + [first] + perm[i..-1]
		end
	end

	total_permutations
	
end

# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]

# def merge(left, right)
# 	array = []

# 	until left.empty? || right.empty?
# 		case left.first <=> right.first
# 		when -1
# 			array << left.first
# 			left.shift
# 		when 0
# 			array.push(left.first, right.first)
# 			left.shift
# 			right.shift
# 		when 1
# 			array << right.first
# 			right.shift
# 		end
# 	end

# 	array + left + right
# end

def merge(left, right)
	array = []

	until left.empty? || right.empty?
		array << ((left.first < right.first) ? left.shift : right.shift)
	end

	array + left + right
end

def merge_sort(array)
	return array if array.length <= 1

	mid = array.length / 2
	left = merge_sort(array[0...mid])
	right = merge_sort(array[mid..-1])

	merge(left, right)
end

# p merge_sort([38, 27, 43, 3, 9, 82, 10]) # => [3, 9, 10, 27, 38, 43, 82]

def make_better_change(target, coins = [25, 10, 5, 1])
	return [] if target == 0
	return nil if coins.none? { |coin| coin <= target }
	
	best_change = nil
	coins.each_with_index do |coin, index|
		next if coin > target

		remainder = target - coin
		best_remainder = make_better_change(remainder, coins[index..-1])

		next if best_remainder.nil?

		current_change = [coin] + best_remainder

		if best_change.nil? || (current_change.count < best_change.count)
			best_change = current_change
		end
	end
	best_change
end

p make_better_change(24, [10,7,1]) # => [10, 7, 7]