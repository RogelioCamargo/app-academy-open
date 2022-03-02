def hipsterfy(str)
	idx = str.rindex(/[aeiou]/)

	!idx ? str : str[0...idx] + str[(idx + 1)..-1]
end

def vowel_counts(str)
	vowel_count = Hash.new(0)

	str.each_char.with_index do |char, idx|
		vowel_count[char.downcase] += 1 if "eaiou".include?(char.downcase)
	end

	vowel_count
end

def caesar_cipher(str, num) 
	alphabet = ("a".."z").to_a

	new_str = str[0..-1]
	str.each_char.with_index do |char, idx|
		idxof_char = alphabet.index(char)
		new_str[idx] = alphabet[(idxof_char + num) % 26] if alphabet.include?(char)
	end

	new_str
end