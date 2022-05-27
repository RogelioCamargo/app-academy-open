require "byebug"
class PolyTreeNode
	attr_reader :parent, :children, :value

	def initialize(value)
		@parent = nil
		@children = []
		@value = value 
	end

	def parent=(new_parent)
		old_parent = @parent
		@parent = new_parent
		old_parent.children.delete(self) unless old_parent.nil? 
		new_parent.children.push(self) unless new_parent.nil?
	end

	def add_child(new_child)
		new_child.parent = self
	end

	def remove_child(child)
		raise "Not a child of parent" unless self.children.include?(child)
		child.parent = nil
	end

	def dfs(value)
		return self if self.value == value 

		self.children.each do |child|
			node = child.dfs(value)
			return node unless node.nil?
		end

		nil
	end

	def bfs(value)
		queue = [self]
		until queue.empty? 
			node = queue.shift 
			return node if node.value == value 
			node.children.each do |child_node|
				queue.push(child_node)
			end
		end	
		nil
	end

	def inspect 
		{
			value: value
		}.inspect
	end
end
