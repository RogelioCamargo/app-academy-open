def strange_sums(array)
	count = 0
	(0...array.length).each do |i|
		(i + 1...array.length).each do |j|
			count += 1 if array[i] + array[j] == 0 
		end
	end

	count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(array, target)
 	(0...array.length).each do |i|
		(i + 1...array.length).each do |j|
			return true if array[i] * array[j] == target

		end
 	end

	false 
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(string, hash)
	new_string = []
	string.each_char do |ch|
		if hash.has_key?(ch)
			count = hash[ch] 
			count.times { new_string << ch }
		else 
			new_string << ch 
		end
	end

	new_string.join("")
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
	(0..num).each do |val|
		return true if val * val == num 

	end

	false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def num_factors(num)
	(1..num).count { |i| num % i == 0 }
end

def anti_prime?(num)
	amount = num_factors(num)
	(1...num).all? { |i| amount > num_factors(i) }
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(matrix_a, matrix_b)
	h = matrix_a.length 
	w = matrix_a[0].length
	sums = Array.new(h) { Array.new(2) }
	(0...h).each do |i|
		(0...w).each do |j|
			sums[i][j] = matrix_a[i][j] + matrix_b[i][j]
		end
	end
	sums
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
	min = nums.min
	mutuals = []
	(1..min).each do |i|
		if nums.all? { |num| num % i == 0 }
			mutuals << i  
		end
	end

	mutuals 
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n) 
	raise "invalid number" if n <= 0 

	return 1 if n == 1 || n == 2 
	return 2 if n == 3 

	tribonacci_number(n - 3) + tribonacci_number(n - 2) + tribonacci_number(n - 1)
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
	h = matrices.first.length  
	return nil if !matrices.all? { |m| m.length == h }
	w = matrices.first.first.length 
	return nil if !matrices.all? { |m| m.length == h }

	sums = Array.new(h) { Array.new(w).fill(0) }
	(0...matrices.length).each do |i|
		(0...h).each do |row|
			(0...w).each do |col|
				sums[row][col] += matrices[i][row][col]
			end
		end
	end
	sums
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(matrix)
	n = matrix.length 

	(0...n).each do |row|
		val = matrix[row][0]
		return true if (1...n).all? { |col| matrix[row][col] == val }
	end

	(0...n).each do |col|
		val = matrix[0][col]
		return true if (1...n).all? { |row| matrix[row][col] == val }
	end

	false

end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def check_diagonal(matrix)
	n = matrix.length 

	val = matrix[0][0]
	(1...n).all? { |i| matrix[i][i] == val }
end

def squaragonal?(matrix)
	check_diagonal(matrix) || check_diagonal(matrix.map(&:reverse))
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(levels)
	triangle = [[1]]
	(levels - 1).times do 
		last = triangle.last 
		new_level = [1]
		(0...last.length - 1).each do |i|
			new_level << last[i] + last[i + 1]
		end
		new_level << 1

		triangle << new_level
	end

	triangle
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

def prime?(num)
	(2...num).each do |factor|
		return false if num % factor == 0
	end

	true 
end

def mersenne_prime(num)
	i = 0
	x = 2 
	while i != num 
		one_less = (2 ** x) - 1
		if prime?(one_less)
			i += 1
		end
		x += 1
	end

	one_less
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def word_sum(word)
	alphabet = ("a".."z").to_a
	sum = 0
	word.each_char do |char|
		sum += (alphabet.index(char)) + 1
	end
	sum
end

def triangular_word?(word)
	value = word_sum(word)
	(1..value).each do |i|
		result = (i * (i + 1)) / 2
		return true if value == result 
	end

	false
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(array)
	collapsed = false 
	copy = array[0..-1]

	while !collapsed
		collapsed = true 
		i = 0
		while i < copy.length - 1
			# p array.length - 1
			# p [array[i + 1], array[i]]
			difference = (copy[i + 1] - copy[i]).abs
			if difference == 1
				copy = copy[0...i] + copy[i + 2..-1]
				collapsed = false 
				break
			end
			i += 1
		end
	end

	copy
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []
