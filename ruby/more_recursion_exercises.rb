#Problem 1: 
def sum_recur(array)
	return 0 if array.empty?
	array[0] + sum_recur(array[1..-1])
end

# p sum_recur([1, 2, 3, 4, 5]) #15

#Problem 2: 

def includes?(array, target)
	return false if array.empty? 
	array[0] == target || includes?(array[1..-1], target)
end

# p includes?([1, 2, 3, 4], 3) # true 
# p includes?([1, 2, 3, 4], 6) # false 

# Problem 3: 

def num_occur(array, target)
	return 0 if array.empty?
	count = 0
	count += 1 if array[0] == target 
	count += num_occur(array[1..-1], target)
	count
end

# p num_occur([2, 6, 3, 9, 3, 1, 7, 3], 3)

# Problem 4: 

def add_to_twelve?(array)
	return false if array.length < 2
	(array[0] + array[1]) == 12 || add_to_twelve?(array[1..-1])
end

# p add_to_twelve?([2, 8, 6, 6, 1, 9, 8]) # true
# p add_to_twelve?([2, 8, 2, 6, 1, 9, 3]) # true
# p add_to_twelve?([2, 8, 2, 6, 1, 9, 4]) # false

# Problem 5: 

def sorted?(array)
	return true if array.length < 2 
	array[0] <= array[1] && sorted?(array[1..-1])
end

# p sorted?([1, 2, 3, 4, 5]) # true 
# p sorted?([2, 3, 4, 5, 4]) # false

# Problem 6: 

def reverse(string)
	return "" if string.length <= 0
	reverse(string[1..-1]) + string[0]
end

p reverse("god") #dog
