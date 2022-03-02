def average(num1, num2)
	(num1 + num2) / 2.0
end

def average_array(array)
	array.inject(0) { |acc, el| acc + el } / array.length.to_f
end

def repeat(str, num) 
	new_str = ""
	num.times { new_str += str }
	new_str
end

def yell(str) 
	str.upcase + "!"
end

def alternating_case(str) 
	words = str.split(" ").map.with_index do |word, idx|
		if idx % 2 == 0
			word.upcase
		else
			word.downcase
		end
	end

	words.join(" ")
end