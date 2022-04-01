class PolyTreeNode
	def initialize(value)
		@value = value
		@parent = nil 
		@children = []
	end

	attr_reader :value, :parent, :children

	def parent=(parent)
		return if self.parent == parent

    # First, detach from current parent.
    if self.parent
      self.parent.children.delete(self)
    end

    # No new parent to add this to.
    @parent = parent
    self.parent.children << self unless self.parent.nil?

    self
	end

	def add_child(child)
		child.parent = self
	end

	def remove_child(child)
		raise "Not a child" if !self.children.include?(child)
		child.parent = nil
	end

	def dfs(target_value)
		return self if target_value == self.value

		self.children.each do |child|
			result = child.dfs(target_value) 
			return result unless result.nil?
		end

		nil 
	end

	def bfs(target_value)
		queue = [self]
		while !queue.empty? 
			node = queue.shift
			return node if target_value == node.value 

			node.children.each do |child|
				queue << child 
			end
		end

		nil
	end
end