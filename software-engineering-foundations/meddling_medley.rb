def duos(string)
	count = 0 
	(0...string.length - 1).each do |i|
		count += 1 if string[i] == string[i + 1]
	end
	count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(string, hash)
	altered = string.split(" ").map do |word|
		if hash.has_key?(word)
			hash[word]
		else 
			word 
		end
	end
	altered.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, value_prc, &key_prc) 
	new_hash = Hash.new 
	hash.each do |k, v|
		new_key = key_prc.call(k)
		new_value = value_prc.call(v)
		new_hash[new_key] = new_value
	end
	new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(string)
	counts = Hash.new(0)
	string.each_char do |ch|
		counts[ch] += 1
	end

	counts.select { |k, v| v > 2 }.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(string)
	(0...string.length - 2).each do |i|
		return true if string[i..i + 2] == string[i] * 3
	end

	false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(string, hash)
	new_string = "" 
	string.each_char do |ch|
		if hash.has_key?(ch) 
			new_string += hash[ch]
		elsif ch == " "
			new_string += ch 
		else
			new_string += "?"
		end
	end
	new_string
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(encoded)
	decoded = ""
	(0...encoded.length - 1).each do |i|
		ch = encoded[i]
		times = encoded[i + 1].to_i
		decoded += (ch * times)
	end
	decoded
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

