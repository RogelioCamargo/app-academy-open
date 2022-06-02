def my_min(array)
	array.inject { |a, b| a < b ? a : b }
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# def largest_contiguous_subsum(array)
# 	subarrays = []
# 	(0...array.length).each do |i|
# 		(i...array.length).each do |j|
# 			subarrays << array[i..j]
# 		end
# 	end
# 	subarrays.map(&:sum).inject { |a, b| a > b ? a : b }
# end

def largest_contiguous_subsum(array)
	largest_sum = -Float::INFINITY
	current_sum = -Float::INFINITY
	array.each do |el|
		current_sum = [el, current_sum + el].max 
		if current_sum > largest_sum 
			largest_sum = current_sum
		end
	end
	largest_sum
end 

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

# possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7