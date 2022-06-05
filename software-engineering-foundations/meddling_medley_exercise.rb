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

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(array, *procs)
	array.select do |el|

		procs.all? { |proc| proc.call(el) }
	end
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(string)
	words = string.split(" ")

	altered = words.map do |word|
		if word.length < 3
			word 
		else 
			if "aeiou".include?(word[0].downcase)
				word + "yay"
			else 
				idx = word.index(/[aeiouAEIOU]/)
				new_word = word[idx...word.length].downcase + word[0..idx].downcase + "ay"
				new_word[0] = new_word[0].upcase if word[0] == word[0].upcase
				new_word
			end
		end
	end 

	altered.join(" ")
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(string)
	words = string.split(" ")
	vowels = "aeiouAEIOU"
	altered = words.map do |word|
		if word.length < 3 
			word 
		elsif vowels.include?(word[-1])
			word + word.downcase
		else  
			idx = word.rindex(/[aeiouAEIOU]/)
			word + word[idx..-1]
		end
	end

	altered.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(array, *procs)
	array.select { |el| procs.any? { |proc| proc.call(el) } }
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(string)
	words = string.split(" ")
	altered = words.map.with_index do |word, idx|
		if idx.even?
			index = word.index(/[aeiou]/)
			if !index 
				word 
			else 
				word[0...index] + word[index + 1..-1]
			end
		else
			index = word.rindex(/[aeiou]/)
			if !index 
				word 
			else 
				word[0...index] + word[index + 1..-1]
			end
		end
	end
	altered.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(string)
	words = string.split(" ")
	vowels = "aeiouAEIOU"
	altered = words.map do |word|
		if vowels.include?(word[-1])
			word + word[-1]
		else 
			new_string = ""
			word.each_char do |ch|
				if vowels.include?(ch)
					new_string += ch + "b" + ch.downcase
				else
					new_string += ch
				end
			end
			new_string 
		end
	end
	altered.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(string)
	i = 0 
	encoded = ""
	while i < string.length do 
		j = i
		count = 0 
		while string[i] == string[j] do 
			count += 1
			j += 1
		end

		if count > 1
			encoded += string[i] + "#{count}"
		else 
			encoded += string[i]
		end
		i = j
	end
	encoded
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"