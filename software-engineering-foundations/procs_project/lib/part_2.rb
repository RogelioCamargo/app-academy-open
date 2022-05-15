def reverser(string, &prc)
	new_string = string.reverse 
	prc.call(new_string)
end

def word_changer(string, &prc)
	words = string.split(" ")
	altered_words = words.map do |word|
		prc.call(word)
	end
	altered_words.join(" ")
end

def greater_proc_value(number, prc_one, prc_two)
	result_one = prc_one.call(number)
	result_two = prc_two.call(number)
	result_one > result_two ? result_one : result_two
end

def and_selector(array, prc_one, prc_two)
	new_array = []
	array.each do |el|
		if prc_one.call(el) && prc_two.call(el)
			new_array << el 
		end
	end
	new_array
end

def alternating_mapper(array, prc_one, prc_two)
	new_array = []
	array.each_with_index do |el, index|
		if index % 2 == 0
			new_array << prc_one.call(el)
		else 
			new_array << prc_two.call(el)
		end
	end
	new_array
end