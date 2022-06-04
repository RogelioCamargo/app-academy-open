# O(nk)
# O(k)
# def windowed_max_range(array, size)
# 	current_max_range = nil 
# 	(0..array.length - size).each do |i|
# 		min = array[i...i+size].min 
# 		max = array[i...i+size].max
# 		range = max - min 
# 		if current_max_range.nil? || range > current_max_range 
# 			current_max_range = range 
# 		end
# 	end
# 	current_max_range
# end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

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

	def size 
		@store.length 
	end
end

class StackQueue 
	def initialize
		@entry = MyStack.new
		@depart = MyStack.new
	end

	def enqueue(item)
		@entry.push(item)
	end

	def dequeue
		return nil if empty?
		@entry.size.times { @depart.push(@entry.pop) } if @depart.empty? 
		@depart.pop 
	end

	def empty? 
		@entry.empty? && @depart.empty?
	end

	def size 
		@entry.size + @depart.size
	end
end

# q = StackQueue.new 
# q.enqueue(1)
# q.enqueue(2)
# q.enqueue(3)
# q.enqueue(4)
# q.enqueue(5)
# p q.size
# p q
# p q.dequeue
# p q
# q.enqueue(6)
# q.enqueue(7)
# p q
# p q.dequeue
# p q.dequeue
# p q
# p q.dequeue
# p q.dequeue
# p q
# p q.dequeue
# p q

class MinMaxStack
	attr_reader :store
  def initialize
		@store = MyStack.new
	end 

	def push(value)
		@store.push({
			value: value, 
			min: new_min(value), 
			max: new_max(value)
		})
	end

	def pop 
		@store.pop[:value] unless empty? 
	end

	def min 
		@store.peek[:min] unless empty? 
	end

	def max 
		@store.peek[:max] unless empty? 
	end

	def size 
		@store.size
	end

	def peek 
		@store.peek[:value] unless empty?
	end

	def empty? 
		@store.empty?
	end

	private 

	def new_min(value)
		empty? ? value : [min, value].min 
	end

	def new_max(value)
		empty? ? value : [max, value].max
	end
end

# s = MinMaxStack.new 
# s.push(9)
# s.push(4)
# s.push(7)
# s.push(6)
# s.push(1)
# # s.render
# p s.min 
# p s.max 
# s.pop 
# s.pop 
# # s.render
# p s.min 
# p s.max 


class MinMaxStackQueue
	attr_reader :in, :out
	def initialize
		@in = MinMaxStack.new 
		@out = MinMaxStack.new
	end

	def enqueue(value)
		@in.push(value)
	end

	def dequeue
		transfer if @out.empty? 
		@out.pop
	end

	def min 
		mins = [] 
		mins << @in.min unless @in.empty?
		mins << @out.min unless @out.empty? 
		mins.min
	end

	def max 
		maxs = [] 
		maxs << @in.max unless @in.empty?
		maxs << @out.max unless @out.empty? 
		maxs.max
	end

	def empty? 
		@in.empty? && @out.empty?
	end

	def size 
		@in.size + @out.size
	end

	private 

	def transfer 
		@out.push(@in.pop) until @in.empty?
	end
end
   
# q = MinMaxStackQueue.new 
# q.enqueue(1)
# q.enqueue(2)
# q.enqueue(3)
# p q.min # 1
# p q
# q.dequeue
# p q
# p q.min 
# q.dequeue
# p q.min

def windowed_max_range(array, window_size)
	q = MinMaxStackQueue.new 
	window_size.times { |i| q.enqueue(array[i]) }
	current_max_range = q.max - q.min  
	(window_size...array.length).each do |i|
		q.dequeue 
		q.enqueue(array[i])
		range = q.max - q.min 
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