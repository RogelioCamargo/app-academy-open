def partition(array, number) 
	new_array = [[], []]
	array.each do |value|
		if value < number 
			new_array[0].push(value)
		else 
			new_array[1].push(value)
		end
	end

	new_array
end

def merge(hash_one, hash_two) 
	new_hash = Hash.new
	hash_one.each_pair { |k, v| new_hash[k] = v }
	hash_two.each_pair { |k, v| new_hash[k] = v }
	new_hash
end

def censor(string, array) 
	new_array = []
	string.split(" ").each do |word|
		if array.include?(word.downcase)
			new_array.push(censor_word(word))
		else
			new_array.push(word)
		end
	end

	new_array.join(" ");
end

def censor_word(string)
	new_string = ""
	string.each_char do |char|
		if "aeiou".include?(char.downcase)
			new_string += "*" 
		else 
			new_string += char
		end
	end
	new_string
end

def power_of_two?(number)
	i = 1
	while i < number 
		i *= 2
	end
	i === number
end