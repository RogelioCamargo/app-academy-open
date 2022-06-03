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
  def initialize
    @store = MyStack.new
  end

  def peek
    @store.peek[:value] unless empty?
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @store.peek[:max] unless empty?
  end

  def min
    @store.peek[:min] unless empty?
  end

  def pop
    @store.pop[:value] unless empty?
  end

  def push(val)
    # By using a little extra memory, we can get the max simply by peeking,
    # which is O(1).
    @store.push({
      max: new_max(val),
      min: new_min(val),
      value: val
    })
  end

  private

  def new_max(val)
    empty? ? val : [max, val].max
  end

  def new_min(val)
    empty? ? val : [min, val].min
  end
end

# s = MinMaxStack.new 
# s.push(9)
# s.push(4)
# s.push(7)
# s.push(6)
# s.push(1)
# s.render
# p s.min 
# p s.max 
# s.pop 
# s.pop 
# s.render
# p s.min 
# p s.max 


class MinMaxStackQueue < StackQueue
	def initialize
    @in_stack = MinMaxStack.new
    @out_stack = MinMaxStack.new
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def dequeue
    queueify if @out_stack.empty?
    @out_stack.pop
  end

  def enqueue(val)
    @in_stack.push(val)
  end

  def max
    # At most two operations; O(1)
    maxes = []
    maxes << @in_stack.max unless @in_stack.empty?
    maxes << @out_stack.max unless @out_stack.empty?
    maxes.max
  end

  def min
    mins = []
    mins << @in_stack.min unless @in_stack.empty?
    mins << @out_stack.min unless @out_stack.empty?
    mins.min
  end

  private
  def queueify
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
end
   
q = MinMaxStackQueue.new 
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
p q.min
p q
q.dequeue
p q
p q.min 
q.dequeue
p q.min