def hipsterfy(string)
	new_string = ""
	i = string.length - 1
	found = false
	while i >= 0 do 
		if string[i].match?(/[aeiou]/) && !found
			found = true 
		else 
			new_string += string[i]
		end
		i -= 1
	end

	new_string.reverse
end

def vowel_counts(string)
	counts = Hash.new(0)

	string.each_char do |char|
		if "aeiou".include?(char.downcase)
			counts[char.downcase] += 1
		end
	end

	counts
end

def caesar_cipher(stirng, amount)
	alphabet = ("a".."z").to_a
	new_string = ""
	stirng.each_char.with_index do |char, index|
		if (alphabet.include?(char)) 
			location = alphabet.index(char)
			new_string += alphabet[(location + amount) % 26]
		else 
			new_string += char 
		end
	end
	new_string
end