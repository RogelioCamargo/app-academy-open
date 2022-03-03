def select_even_nums(array)
	array.select(&:even?)
end

def reject_puppies(array)
	array.reject { |hash| hash["age"] <= 2 }
end

def count_positive_subarrays(array)
	array.count { |arr| arr.sum > 0 }
end

def aba_translate(str)
	new_str = ""
	str.each_char do |char|
		if "aeiou".include?(char)
			new_str += (char + "b" + char)
		else
			new_str += char
		end
	end

	new_str
end

def aba_array(array) 
	array.map { |str| aba_translate(str) }
end