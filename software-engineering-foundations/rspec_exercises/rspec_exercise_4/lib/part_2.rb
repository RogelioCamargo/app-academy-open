def proper_factors(num)
	factors = []
	(1...num).each do |factor|
		factors << factor if num % factor == 0
	end
	factors
end

def aliquot_sum(num)
	factors = proper_factors(num)
	factors.inject(0) { |acc, el| acc + el }
end

def perfect_number?(num)
	num == aliquot_sum(num)
end

def ideal_numbers(num)
	count = 0 
	perfect_numbers = []
	i = 2
	while count != num 
		if perfect_number?(i)
			perfect_numbers << i 
			count += 1
		end
		i += 1
	end
	perfect_numbers
end

