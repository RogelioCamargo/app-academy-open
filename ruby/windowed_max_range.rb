# O(nk)
# O(k)
def windowed_max_range(array, size)
	current_max_range = nil 
	(0..array.length - size).each do |i|
		min = array[i...i+size].min 
		max = array[i...i+size].max
		range = max - min 
		if current_max_range.nil? || range > current_max_range 
			current_max_range = range 
		end
	end
	current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
	def initialize
		@store = []
	end

	def enqueue(item)
		@store << item 
	end

	def dequeue
		return nil if empty?
		@store.shift 
	end

	def peek
		return nil if empty? 
		@store.first 
	end

	def empty? 
		@store.empty?
	end

	def size 
		@store.length 
	end
end

class MyStack 
	def initialize
		@store = [] 
	end

	def push(item)
		@store << item 
	end

	def pop
		return nil if empty? 
		@store.pop 
	end

	def empty? 
		@store.empty?
	end

	def peek 
		return nil if empty?
		@store.last
	end

	def sise 
		@store.length 
	end
end