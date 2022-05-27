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

	def inspect 
		{
			value: value
		}.inspect
	end
end
