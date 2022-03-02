def palindrome?(str)
	s_i = 0
	e_i = str.length - 1
	while s_i < e_i
		return false if str[s_i] != str[e_i]
		s_i += 1
		e_i -= 1
	end

	true
end

def substrings(str)
	array = []
	(0...str.length).each do |i|
		(i...str.length).each do |j|
			substr = str[i..j]
			array << substr if !array.include?(substr)
		end
	end
	array
end

def palindrome_substrings(str)
	substr_arr = substrings(str)
	substr_arr.select { |substr| palindrome?(substr) && substr.length > 1 }
end