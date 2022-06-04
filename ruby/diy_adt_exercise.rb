class Stack 
	attr_reader :list 

	def initialize
		@list = []
	end

	def push(el)
		@list << el 
	end

	def pop
		@list.pop 
	end

	def peek
		@list.last
	end
end

class Queue 
	attr_reader :list
	def initialize
		@list = [] 
	end

	def enqueue(el) 
		@list << el
	end 

	def dequeue
		@list.shift
	end

	def peek 
		@list.first
	end
end

class MyMap 
	attr_reader :map 
	def initialize
		@map = []
	end

	def set(key, value)
		new_pair = [key, value]
		index = find(key)
		if index.nil? 
			map << new_pair
		else 
			map[index] = new_pair
		end
	end

	def get(key)
		pair = map.find { |k, v| k == key }
		pair.last unless pair.nil?
	end

	def delete(key)
		index = find(key)
		map.delete_at(index) unless index.nil?
	end
	
	def find(key)
		map.find_index { |k, v| k == key }
	end

	def show 
		@map
	end
end

m = MyMap.new 
m.set("a", 1)
m.set("b", 2)
m.set("c", 3)
m.set("a", 4)
p m.show 		 # [["a", 4], ["b", 2], ["c", 3]]
p m.get("b") # 2
m.delete("b") 
p m.show


# q = Queue.new
# q.enqueue(1)
# q.enqueue(2)
# q.enqueue(3)
# puts q.peek 
# p q.list
# q.dequeue
# p q.list 
# q.dequeue 
# p q.list

# s = Stack.new
# s.push(1)
# s.push(2)
# s.push(3)
# puts s.peek 
# p s.list
# s.pop
# p s.list 
# s.pop 
# p s.list