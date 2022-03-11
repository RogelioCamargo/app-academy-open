class Stack
	def initialize
		# create ivar to store stack here!
		@stack = []
	end

	def push(el)
		# adds an element to the stack
		@stack.push(el)
	end

	def pop
		# removes one element from the stack
		@stack.pop
	end

	def peek
		# returns, but doesn't remove, the top element in the stack
		@stack.last
	end
end

# stack = Stack.new
# stack.push(1)
# puts stack.peek # => 1

# stack.push(2)
# puts stack.peek # => 2

# stack.push(3)
# puts stack.peek # => 3

# stack.pop
# puts stack.peek # => 2

class Queue
	def initialize
		@queue = []
	end

	def enqueue(el)
		@queue.push(el)
	end

	def dequeue
		@queue.shift
	end

	def peek
		@queue.first
	end
end

# queue = Queue.new
# queue.enqueue(1)
# puts queue.peek # => 1

# queue.enqueue(2)
# puts queue.peek # => 2

# queue.enqueue(3)
# puts queue.peek # => 3

# queue.dequeue
# puts queue.peek # => 2

class Map 
	def initialize
		@map = []
	end

	def set(key, value)
		if get(key).nil?
			map.push([key, value])
		else
			index = get_index(key)
			map[index] = [key, value]
		end
	end

	def get(key)
		map.each do |pair|
			k, v = pair
			return v if key == k
		end

		nil
	end

	def get_index(key)
		map.index { |pair| pair[0] == key }
	end	
		

	def delete(key)
		index = get_index(key)
		map.delete_at(index)
	end

	def show
		puts "---- Map ----"
		map.each do |pair|
			p pair
		end
		puts "-------------"
	end

	private

	attr_reader :map
end

map = Map.new
map.set("roger", 24) # set
map.set("emma", 23) # set
map.show
map.set("emma", 25) # update
map.show
map.delete("emma") # delete
map.show
puts map.get("roger") # get