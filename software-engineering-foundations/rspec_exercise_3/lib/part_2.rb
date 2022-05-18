def element_count(array)
	counts = Hash.new(0)
	array.each do |el|
		counts[el] += 1
	end
	counts
end

def char_replace!(string, hash)
	
	string.each_char.with_index do |char, idx|
		if hash.has_key?(char)
			string[idx] = hash[char]
		end
	end

	string
end

def product_inject(array)
	array.inject { |acc, el| acc * el }
end