def no_dupes(array)
	hash = Hash.new(0)

	array.each { |ele| hash[ele] += 1	}
	hash.keys.select { |k| hash[k] == 1 }
end

def no_consecutive_repeats?(array)
	(0...array.length - 1).each do |i|
		return false if array[i] == array[i + 1]
	end
	
	true
end

def char_indices(str) 
	hash = Hash.new { |h, k| h[k] = [] } 

	str.each_char.with_index do |char, idx|
		hash[char] << idx
	end
	
	hash
end


def longest_streak(str)
	longest = ""
	current = ""

	(0...str.length).each do |i|
		if i == 0 || str[i] == str[i - 1]
			current += str[i]
		else
			current = str[i]
		end

		longest = current if current.length >= longest.length
	end

	longest
end

def is_prime?(num)
	(2...num).each { |n| return false if num % n == 0 }

	true
end

def bi_prime?(num)
	primes = (2...num).select { |n| is_prime?(n) }

	(0...primes.length).each do |i|
		(i...primes.length).each do |j|
			return true if primes[i] * primes[j] == num
		end
	end

	false
end

def vigenere_cipher(message, keys)
	alphabet = ("a".."z").to_a
	encoded = ""
	current_key = 0

	message.each_char do |char|
		current_key = 0 if current_key >= keys.length
		spacer = keys[current_key]
		o_idx = alphabet.index(char)
		n_idx = (o_idx + spacer) % 26
		encoded	+= alphabet[n_idx]

		current_key += 1
	end
	# puts encoded
	encoded
end

def vowel_rotate(str)
	vowels = str.split("").select { |char| "aeiou".include?(char) }
	vowels_length = vowels.length
	new_str = ""

	current_vowel = vowels_length - 1
	str.each_char do |char|
		if "aeiou".include?(char)
			new_str += vowels[current_vowel % vowels_length]
			current_vowel += 1
		else 
			new_str += char
		end
		current_vowel = 0 if current_vowel >= vowels_length
	end

	new_str
end

class String
	def select(&prc)
		new_str = ""
		return new_str if !prc

		self.each_char do |char|
			new_str << char if prc.call(char)
		end
		new_str
	end

	def map!(&prc)
		return self if !prc

		self.each_char.with_index do |char, idx|
			self[idx] = prc.call(char, idx)
		end

		self
	end
end

# puts "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# puts "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# puts "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"


def multiply(a, b)
	# puts [a, b].join(" ")
	return 0 if a == 0 || b == 0
	
	if b < 0
		-(a + multiply(a, (-b) - 1))
	else
		a + multiply(a, b - 1)
	end
end

# puts multiply(3, 5)        # => 15
# puts multiply(5, 3)        # => 15
# puts multiply(2, 4)        # => 8
# puts multiply(0, 10)       # => 0
# puts multiply(-3, -6)      # => 18
# puts multiply(3, -6)       # => -18
# puts multiply(-3, 6)       # => -18

def lucas_sequence(num)
	return [] if num <= 0
	return [2] if num == 1
	return [2, 1] if num == 2

	array = lucas_sequence(num - 1)
	[*array, array[-1] + array[-2]]
end

# print lucas_sequence(0)   # => []
# puts
# print lucas_sequence(1)   # => [2]    
# puts
# print lucas_sequence(2)   # => [2, 1]
# puts
# print lucas_sequence(3)   # => [2, 1, 3]
# puts
# print lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# puts
# print lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
# puts


def prime_factorization(num)
	(2...num).each do |factor|
		if num % factor == 0
			other_factor = num / factor
			return [*prime_factorization(factor), *prime_factorization(other_factor)]
		end
	end
	[num]
end

# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]
