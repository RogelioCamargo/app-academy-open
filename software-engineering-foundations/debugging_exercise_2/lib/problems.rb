# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def is_prime?(num) 
	return false if num < 2

	(2...num).each do |val|
		return false if num % val == 0
	end

	true
end

def largest_prime_factor(num) 
	current = num
	while current > 2
		return current if num % current == 0 && is_prime?(current)
		current -= 1
	end

	current
end

def unique_chars?(str)
	char_counts = Hash.new(0)

	str.each_char { |char| char_counts[char] += 1 }

	char_counts.each_value do |v|
		return false if v > 1
	end

	true
end

def dupe_indices(array)
	hash = {}

	array.each_with_index do |ele, idx|
		if hash.has_key?(ele)
			hash[ele] << idx
		else 
			hash[ele] = [idx]
		end
	end

	hash.select { |k, v| v.length > 1 }
end

def ana_array(arr1, arr2)
	arr1.each do |ele|
		return false if !arr2.include?(ele)
	end

	arr2.each do |ele|
		return false if !arr1.include?(ele)
	end

	true
end

