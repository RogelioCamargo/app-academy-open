def reverser(str, &prc)
	new_str = str.reverse
	prc.call(new_str)
end

def word_changer(sentence, &prc)
	words = sentence.split(" ")
	updated_words = words.map { |word| prc.call(word) }
	updated_words.join(" ")
end

def greater_proc_value(number, prc_1, prc_2)
	result_1 = prc_1.call(number)
	result_2 = prc_2.call(number)

	result_1 > result_2 ? result_1 : result_2
end

def and_selector(array, prc_1, prc_2)
	new_array = []

	array.each { |ele| new_array << ele if prc_1.call(ele) && prc_2.call(ele) }

	new_array
end

def alternating_mapper(array, prc_1, prc_2)
	array.map.with_index do |ele, idx| 
		if idx % 2 == 0
			prc_1.call(ele)
		else
			prc_2.call(ele)
		end
	end
end