def my_map(array, &prc)
	new_array = []

	array.each { |ele| new_array << prc.call(ele) }

	new_array
end

def my_select(array, &prc)
	new_array = []

	array.each { |ele| 	new_array << ele if prc.call(ele) }

	new_array
end

def my_count(array, &prc)
	count = 0

	array.each { |ele| count += 1 if prc.call(ele) }

	count
end

def my_any?(array, &prc)
	array.each { |ele| return true if prc.call(ele) }

	false
end

def my_all?(array, &prc)
	array.each { |ele| return false if !prc.call(ele) }

	true
end

def my_none?(array, &prc)
	array.each { |ele| return false if prc.call(ele) }

	true
end