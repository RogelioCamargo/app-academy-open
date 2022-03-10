class Array
	def my_each(&prc)
		i = 0
		while i < self.length
			prc.call(self[i])
			i += 1
		end

		self
	end

	def my_select(&prc)
		selected = []
		self.my_each do |ele|
			selected << ele if prc.call(ele)
		end

		selected
	end

	def my_reject(&prc)
		selected = []
		self.each { |ele| selected << ele if !prc.call(ele) } 
		selected
	end

	def my_any?(&prc)
		self.each { |ele| return true if prc.call(ele) }
		false
	end

	def my_flatten
		array = []
		self.each do |ele|
			if ele.kind_of?(Array)
				array.push(*ele.my_flatten)
			else 
				array.push(ele)
			end
		end
		array
	end

	def my_zip(*params)
		new_array = Array.new(self.length) { Array.new }
		self.each_with_index do |self_ele, idx|
			new_array[idx] << self_ele
			params.each { |arr| new_array[idx] << arr[idx] }
		end
		new_array
	end

	def my_rotate(rotations = 1)
		new_array = self[0..-1]

		if rotations < 0
			(-rotations).times do 
				removed_element = new_array.pop
				new_array.unshift(removed_element)
			end
		else
			rotations.times do
				removed_element = new_array.shift
				new_array.push(removed_element)
			end
		end

		new_array
	end

	def my_join(union = "")
		joined_string = ""

		(0...self.length - 1).each do |index|
			joined_string += self[index] + union
		end

		joined_string + self[-1]
	end

	def my_reverse
		return self if self.length == 0

		[*self[1..-1].my_reverse, self[0]]
	end
end

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

p ["a", "b", "c"].my_reverse   #=> ["c", "b", "a"]
p [1].my_reverse               #=> [1]