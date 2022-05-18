def my_reject(array, &prc)
	new_array = []
	array.each do |el|
		new_array << el if !prc.call(el)
	end
	new_array
end

def my_one?(array, &prc)
	matches = 0
	array.each do |el|
		return false if matches > 1
		matches += 1 if prc.call(el)
	end

	matches == 1
end

def hash_select(hash, &prc)
	new_hash = Hash.new
	hash.each do |k, v|
		new_hash[k] = v if prc.call(k, v)
	end
	new_hash
end

def xor_select(array, prc_1, prc_2)
	selected = []
	array.each do |el|
		selected << el if prc_1.call(el) && !prc_2.call(el)
		selected << el if !prc_1.call(el) && prc_2.call(el)
	end
	selected
end

def proc_count(num, procs)
	count = 0
	procs.each do |proc|
		count += 1 if proc.call(num)
	end
	count
end