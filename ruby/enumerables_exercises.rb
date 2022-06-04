class Array 
	def my_each(&prc)
		self.length.times do |i|
			prc.call(self[i])
		end
		self
	end

	def my_select(&prc)
		selected = []
		self.my_each { |el| selected << el if prc.call(el) }
		selected
	end

	def my_reject(&prc)
		rejected = []
		self.my_select { |el| rejected << el if !prc.call(el) }
		rejected 
	end

	def my_any?(&prc)
		self.my_each { |el| return true if prc.call(el) }
		false 
	end

	def my_all?(&prc)
		self.my_each { |el| return false if !prc.call(el) }
		true 
	end

	def my_flatten
		flatten_array = []
		self.my_each do |el|
			if el.is_a?(Array)
				flatten_array.concat(el.my_flatten)
			else 
				flatten_array << el 
			end
		end
		flatten_array
	end

	def my_zip(*arrays)
		zipped = []
    self.length.times do |i|
      subzip = [self[i]]
      arrays.my_each do |array|
				el = i >= array.length ? nil : array[i]
        subzip << el
      end
      zipped << subzip
    end
    zipped
	end

	def my_rotate(amount = 1)
		split_index = amount % self.length 
		self.drop(split_index) + self.take(split_index)
	end

	def my_join(seperator = "")
		new_string = ""
		self.each_with_index do |el, idx| 
			new_string += el 
			new_string += seperator if idx != self.length - 1
		end
		new_string 
	end

	def my_reverse 
		new_array = []
		i = self.length - 1
		while i >= 0 do
			new_array << self[i]
			i -= 1
		end
		new_array
	end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# r1 = a.my_rotate         #=> ["b", "c", "d", "a"]
# p r1
# r1 = a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p r1
# r1 = a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p r1
# r1 = a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# p r1

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# r1 = [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p r1
# r1 = a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p r1
# r1 = [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
# p r1

# c = [10, 11, 12]
# d = [13, 14, 15]
# r1 = [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
# p r1

# r1 = [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# p r1 

# a = [1, 2, 3]
# r1 = a.my_any? { |num| num > 1 } # => true
# r2 = a.my_any? { |num| num == 4 } # => false
# r3 = a.my_all? { |num| num > 1 } # => false
# r4 = a.my_all? { |num| num < 4 } # => true
# p r1
# p r2
# p r3
# p r4

# a = [1, 2, 3]
# r1 = a.my_reject { |num| num > 1 } # => [1]
# r2 = a.my_reject { |num| num == 4 } # => [1, 2, 3]
# p r1 
# p r2

# a = [1, 2, 3]
# r1 = a.my_select { |num| num > 1 } # => [2, 3]
# r2 = a.my_select { |num| num == 4 } # => []

# p r1
# p r2

# return_value = [1, 2, 3].my_each do |num|
# 	puts num
# end
# # => 1
# #    2
# #    3
# #    1
# #    2
# #    3
# p return_value  # => [1, 2, 3]
