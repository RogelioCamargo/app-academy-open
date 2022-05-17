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

def bi_prime?(number)
	(2...number).each do |i|
		(2...number).each do |j|
			if i * j == number && is_prime?(i) && is_prime?(j)
				return true 
			end
		end
	end

	false
end

def is_prime?(number)
	(2...number).each do |factor|
		return false if number % factor == 0
	end

	true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(string, array)
	alphabet = ("a".."z").to_a 
	encoded = Array.new(string.length)

	string.each_char.with_index do |char, index|
		old_index = alphabet.index(char) 
		shift_value = array[index % array.length]
		encoded[index] = alphabet[(old_index + shift_value) % 26]
	end

	encoded.join("")
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(string)
	vowels = []
	string.each_char do |char|
		if "aeiou".include?(char)
			vowels << char 
		end
	end
	# p vowels

	new_string = Array.new(string.length)
	i = vowels.length - 1
	string.each_char.with_index do |char, index|
		if "aeiou".include?(char)
			new_string[index] = vowels[i]
			i = (i + 1) % vowels.length
		else 
			new_string[index] = char
		end
	end

	new_string.join("")
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"