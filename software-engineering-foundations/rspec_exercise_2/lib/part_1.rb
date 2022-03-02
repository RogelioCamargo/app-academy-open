def partition(array, num)
	arr2d = [[], []]

	array.each do |val|
		if val >= num
			arr2d[1] << val
		else 
			arr2d[0] << val
		end
	end

	arr2d
end

def merge(hash_1, hash_2)
	new_hash = {}

	hash_1.each { |k, v| new_hash[k] = v }
	hash_2.each { |k, v| new_hash[k] = v }

	new_hash
end

def censor(str, curse_words)
	words_array = str.split(" ");

	words = words_array.map do |word|
		if curse_words.include?(word.downcase)
			word.gsub(/[aeiouAEIOU]/, "*")
		else
			word
		end
	end

	words.join(" ")
end

def power_of_two?(num)
	i = num
	while i >= 2
		return false if i % 2 != 0
		i /= 2
	end

	true
end