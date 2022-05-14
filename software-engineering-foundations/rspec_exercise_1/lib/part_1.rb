def average(a, b) 
	(a + b) / 2.0
end

def average_array(array) 
	array.sum / (array.length * 1.0)
end

def repeat(string, amount) 
	new_string = ""
	amount.times { new_string += string }
	new_string
end

def yell (string)
	string.upcase + "!"
end

def alternating_case(string)
	array = string.split(" ").map.with_index do |word, index|
		if index % 2 == 0
			word.upcase
		else
			word.downcase
		end
	end
	array.join(" ")
end