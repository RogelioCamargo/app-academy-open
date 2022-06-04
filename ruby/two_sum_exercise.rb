require "set"

# O(n^2)
# def two_sum?(array, target)
# 	(0...array.length).each do |i|
# 		(i + 1...array.length).each do |j|
# 			return true if array[i] + array[j] == target
# 		end
# 	end
# 	false
# end

# O(nlogn)
# def two_sum?(array, target)
# 	sorted = array.sort { |a, b| a - b }
# 	i = 0 
# 	j = array.length - 1
# 	while i < j 
# 		sum = array[i] + array[j] 
# 		case sum <=> target 
# 		when -1 
# 			i += 1 
# 		when 0 
# 			return true 
# 		when 1 
# 			j -= 1
# 		end
# 	end
# 	false 
# end

def two_sum?(array, target)
	set = Set.new
	array.each { |el| set.add(el) }

	array.each do |n|
		remainder = target - n 
		return true if remainder != n && set.include?(remainder) 
	end
	false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false