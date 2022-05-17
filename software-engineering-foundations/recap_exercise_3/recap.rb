require "set" 

def no_dupes?(array)
	counts = Hash.new(0)
	array.each do |value|
		counts[value] += 1
	end

	uniques = []
	counts.each do |k, v|
		uniques << k if v == 1
	end
	uniques
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(array)
	(0...array.length - 1).each do |i|
		return false if array[i] == array[i + 1]
	end
	true 
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])  

def char_indices(array)
	indices = Hash.new { |h, k| h[k] = [] }
	array.each_char.with_index do |char, index|
		indices[char] << index 
	end
	indices
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(string)
	longest_streak = ""
	longest_length = 0 

	i = 0
	l = string.length 

	while i < l do
		char = string[i] 
		j = i + 1
		while char == string[j] do 
			j += 1
		end

		streak = string[i...j]
		if streak.length >= longest_length
			longest_length = streak.length 
			longest_streak = streak
		end
		i = j
	end

	longest_streak
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'