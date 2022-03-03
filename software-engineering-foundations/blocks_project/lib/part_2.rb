def all_words_capitalized?(array) 
	array.all? do |word|
		word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
	end
end

def no_valid_url?(array)
	array.none? { |url| url.match?(/\.com|\.net|\.io|\.org/) }
end

def any_passing_students?(array)
	array.any? do |person|
		grades = person[:grades]
		(grades.sum / grades.length) > 75
	end
end