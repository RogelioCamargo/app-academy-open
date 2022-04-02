require_relative "00_tree_node"
class KnightPathFinder
	attr_reader :starting_position

	MOVES = [
		[-1,  2], [-2,  1], [1,  2], [2,  1], 
		[-2, -1], [-1, -2], [1, -2], [2, -1]
	]

	private_constant :MOVES

	def self.valid_moves(position)
		valid_moves = []
		x, y = position 
		MOVES.each do |(dx, dy)|
			if (x + dx).between?(0, 7) && (y + dy).between?(0, 7)
				valid_moves << [x + dx, y + dy]
			end
		end
		valid_moves
	end

	def initialize(starting_position)
		@starting_position = starting_position
		@considered_positions = [starting_position]

		build_move_tree
	end

	def find_path(end_position)
		end_node = root_node.bfs(end_position)
		trace_path_back(end_node)
			.reverse
			.map(&:value)
	end

	private 

	attr_accessor :root_node, :considered_positions

	def new_move_positions(new_position)
		valid_moves = KnightPathFinder.valid_moves(new_position)

		filtered_valid_moves = valid_moves.reject do |position|
			considered_positions.include?(position)
		end 
		considered_positions.push(*filtered_valid_moves)
		filtered_valid_moves
	end

	def build_move_tree
		self.root_node = PolyTreeNode.new(self.starting_position)
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

	def trace_path_back(node)
		path = []
		current_node = node 
		until current_node.nil?
			path << current_node
			current_node = current_node.parent
		end
		path
	end
end

if $PROGRAM_NAME == __FILE__
	kpf = KnightPathFinder.new([0, 0])
	p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
	p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
end