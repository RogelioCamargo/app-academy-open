# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require 'set'

def largest_prime_factor(number)
	div = number
	while div >= 2 do
		return div if number % div == 0 && is_prime?(div)
		div -= 1
	end
end

def is_prime?(number) 
	(2...number).each do |value|
		return false if number % value == 0
	end

	true
end

def unique_chars?(string)
	set = Set.new 
	string.each_char do |char|
		if set.include?(char)
			return false
		else 
			set.add(char)
		end
	end
	true
end

def dupe_indices(array)
	hash = Hash.new { |h, k| h[k] = [] }
	array.each_with_index do |char, index|
		hash[char] << index 
	end
	hash.select { |k, v| v.length > 1 }
end

def ana_array(array_one, array_two)
	return false if array_one.length != array_two.length
	set = Set.new 
	array_one.each do |el|
		set.add(el)
	end

	array_two.each do |el|
		return false if !set.include?(el) 
	end

	true
end