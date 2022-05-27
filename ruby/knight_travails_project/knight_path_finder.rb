require_relative "poly_tree_node"

class KnightPathFinder
	GRID_SIZE = 8
	DELTAS = [
		[-2, 1], [-1, 2], [1, 2], [2, 1],
		[2, -1], [1, -2], [-2, -1], [-1, -2]
	]

	def self.valid_moves(position)
		raise "Invalid Position" unless position.is_a?(Array) && position.length == 2
		valid_moves = []
		x, y = position
		DELTAS.each do |dx, dy|
			new_position = [x + dx, y + dy]
			if new_position.all? { |coordinate| coordinate.between?(0, GRID_SIZE - 1) }
				valid_moves << new_position
			end
		end
		valid_moves
	end

	attr_reader :starting_position

	def initialize(starting_position)
		@starting_position = starting_position
		@considered_positions = [starting_position]

		build_move_tree
	end

	def find_path(ending_position)
		ending_node = @root_node.dfs(ending_position)
		path = trace_path_back(ending_node)
		path.reverse.map(&:value)
	end

	private

	def new_move_positions(position)
		valid_moves = KnightPathFinder.valid_moves(position)
		new_moves = []
		valid_moves.each do |move|
			unless @considered_positions.include?(move)
				new_moves << move 
				@considered_positions << move 
			end
		end
		new_moves
	end

	def build_move_tree 
		@root_node = PolyTreeNode.new(starting_position)
		queue = [@root_node]
		until queue.empty? 
			current_node = queue.shift 
			current_position = current_node.value
			next_positions = new_move_positions(current_position)
			next_positions.each do |next_position|
				next_node = PolyTreeNode.new(next_position)
				current_node.add_child(next_node)
				queue << next_node
			end
		end
	end

	def trace_path_back(ending_node)
		path = [ending_node] 
		previous_node = ending_node.parent
		until previous_node.nil? do
			path << previous_node 
			previous_node = previous_node.parent 
		end
		path
	end
end

if $PROGRAM_NAME == __FILE__
	kpf = KnightPathFinder.new([0, 0])
	p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
	p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
end