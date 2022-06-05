def palindrome?(string) 
	i = 0
	j = string.length - 1
	while i <= j 
		if string[i] != string[j]
			return false
		end
		i += 1
		j -= 1
	end

	return true
end

def substrings(string)
	i = 0
	subs = []
	while i < string.length 
		j = i
		while j < string.length 
			p [i, j, string[i..j]]
			subs.push(string[i..j])
			j += 1
		end
		i += 1
	end
	p subs
	subs
end

def palindrome_substrings(string) 
	substrings = substrings(string)
	substrings.select { |substring| palindrome?(substring) && substring.length > 1}

end