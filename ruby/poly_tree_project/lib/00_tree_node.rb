class PolyTreeNode
	attr_accessor :value
  attr_reader :parent

	def initialize(value)
		@parent = nil
		@children = []
		@value = value
	end

	def children
    @children.dup
  end

	def parent=(parent)
		return if self.parent == parent

    # First, detach from current parent.
    if self.parent
      self.parent._children.delete(self)
    end

    # No new parent to add this to.
    @parent = parent
    self.parent._children << self unless self.parent.nil?

    self
	end

	def add_child(child)
		# Just reset the child's parent to us!
    child.parent = self
	end

	def remove_child(child)
    if child && !self.children.include?(child)
      raise "Tried to remove node that isn't a child"
    end

    child.parent = nil
	end

	def dfs(target)
		return self if target == self.value

		self.children.each do |child|
			result = child.dfs(target)
			return result unless result.nil?
		end

		nil
	end

	def bfs(target)
		queue = [self]
		until queue.empty?
			node = queue.shift
			return node if node.value == target
			node.children.each do |child|
				queue.push(child)
			end
		end

		nil
	end

	protected 

	# Protected method to give a node direct access to another node's
  # children.
	def _children
    @children
  end
end