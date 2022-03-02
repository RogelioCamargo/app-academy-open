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

def censor(str, c_words)
	new_str = "";
	words_array = str.split(" ");

	words_array.each_with_index do |word, idx|
		if c_words.include?(word.downcase)
			new_str += word.gsub(/[aeiouAEIOU]/, "*")
		else
			new_str += word
		end
		new_str += " "
	end

	new_str.strip
end

def power_of_two?(num)
	i = num
	while i >= 2
		return false if i % 2 != 0
		i /= 2
	end

	true
end