class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
		self.prev.next = self.next if self.prev
		self.next.prev = self.prev if self.next 
		self.next = nil 
		self.prev = nil

		self
  end
end

class LinkedList
	include Enumerable

	attr_reader :head, :tail 
  def initialize
		@head = Node.new 
		@tail = Node.new
		@head.next = @tail 
		@tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
		empty? ? nil : self.head.next 
  end

  def last
		empty? ? nil : self.tail.prev
  end

  def empty?
		self.head.next == self.tail
  end

  def get(key)
		each { |node| return node.val if node.key == key }
		nil
  end

  def include?(key)
		each { |node| return true if node.key == key }
		false
  end

  def append(key, val)
		new_node =  Node.new(key, val)

		self.tail.prev.next = new_node
		new_node.prev = self.tail.prev 
		new_node.next = self.tail
		self.tail.prev = new_node
  end

  def update(key, val)
		each { |node| node.val = val if node.key == key }
  end

  def remove(key)
		each do |node| 
			if node.key == key 
				node.remove
				return 
			end
		end
  end

  def each
		current_node = self.head.next
		until current_node == self.tail 
			yield current_node
			current_node = current_node.next
		end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
