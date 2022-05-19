def zip(*arrays)
	length = arrays.first.length
	(0...length).map do |idx|
		arrays.map { |array| array[idx] }
	end
end

def prizz_proc(array, proc_1, proc_2)
	selected = []
	array.each do |el|
		selected << el if proc_1.call(el) && !proc_2.call(el) || !proc_1.call(el) && proc_2.call(el)
	end

	selected
end

def zany_zip(*arrays)
	length = arrays.map(&:length).max
	(0...length).map do |idx|
		arrays.map { |array| array[idx] }
	end
end

def maximum(array, &prc)
	return nil if array.length == 0

	max = array.first
	array.each do |el|
		max = el if prc.call(el) >= prc.call(max)
	end
	max
end

def my_group_by(array, &prc)
	groups = Hash.new { |h, k| h[k] = [] }
	array.each do |el|
		result = prc.call(el)
		groups[result] << el 
	end
	groups
end

def max_tie_breaker(array, tie_breaker, &prc)
	max = array.first 

	array.each do |el|
		result_el = prc.call(el)
		result_max = prc.call(max)
		if result_el > result_max
			max = el 
		elsif result_el == result_max && tie_breaker.call(el) > tie_breaker.call(max)
			max = el 
		end
	end
	max
end

def silly_syllables(string)
	words = string.split(" ")
	altered_words = words.map do |word|
		indices = find_vowel_indexes(word)
		if indices.length < 2 
			word
		else 
			start_idx = indices[0] 
			end_idx = indices[-1]
			word[start_idx..end_idx]
		end
	end

	altered_words.join(" ")
end

def find_vowel_indexes(word)
	indices = []
	word.each_char.with_index do |ch, idx|
		indices << idx if "aeiou".include?(ch)
	end
	indices 
end