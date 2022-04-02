class KnightPathFinder
	attr_reader :starting_positioning

	MOVES = [
		[-1, 2], [-2, 1], [1, 2], [2, 1], 
		[-2, -1], [-1, -2], [1, -2], [2, -1]
	]

	private_constant :MOVES

	def self.valid_moves(position)
		valid_moves = []
		x, y = position 
		MOVES.each do |(dx, dy)|
			if (x + dx).between(0, 7) && (y + dy).between?(0, 7)
				valid_moves << [x + dx, y + dy]
			end
		end
		valid_moves
	end

	def initialize(starting_positioning)
		@starting_positioning = starting_positioning
		@considered_positions = [starting_positioning]

		build_move_tree
	end

	private 

	attr_accessor :root_node, :considered_positions

	def new_move_positions(new_position)
		valid_moves = KnightPathFinder.valid_moves(new_position)
		filtered_valid_moves = valid_moves.reject do |position|
			!considered_positions.include?(position)
		end 
		considered_positions.push(*filtered_valid_moves)
		filtered_valid_moves
	end

	def build_move_tree
		@root_node = PolyTreeNode.new(self.starting_positioning)
		queue = [root_node]
		until queue.empty? 
			parent_node = queue.shift 
			valid_moves = new_move_positions(parent_node.value)
			valid_moves.each do |next_position|
				child_node = PolyTreeNode.new(next_position)
				parent_node.add_child(child_node)
				queue << child_node
			end
		end
	end
end